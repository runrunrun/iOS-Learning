//
//  RootViewController.m
//  CoreData
//
//  Created by Hari Kunwar on 5/11/13.
//  Copyright (c) 2013 unknown. All rights reserved.
//

#import "RootViewController.h"
#import "Contact.h"

@interface RootViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *addButton;

@property (nonatomic, strong) UIView *inputAccessoryView;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) UITableViewStyle style;


@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation RootViewController

- (id)initWithStyle:(UITableViewStyle)style;
{
    self = [super init];
    if (self) {
        _style = style;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Add Names";
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStyleBordered target:self action:@selector(editTable:)];
    
    [self.navigationItem setRightBarButtonItem:editButton];
    
    
    _textField = [[UITextField alloc] init];
    _textField.frame = [self textFieldFrame];
    _textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_textField];
    
    _addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_addButton addTarget:self action:@selector(addName:) forControlEvents:UIControlEventTouchUpInside];
    _addButton.titleLabel.text = @"Add";
    [_addButton setTitle:@"Add" forState:UIControlStateNormal];
    _addButton.frame = [self addButtonFrame];
    [self.view addSubview:_addButton];
    
    
    _tableView = [[UITableView alloc] initWithFrame:[self tableViewFrame] style:_style];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
    _inputAccessoryView = [[UIView alloc] initWithFrame:[self inputAccessoryViewFrame]];
    UIButton *hideKeyboardButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [hideKeyboardButton addTarget:self action:@selector(hideKeyboard:) forControlEvents:UIControlEventTouchUpInside];
    [hideKeyboardButton setTitle:@"Hide Keyboard" forState:UIControlStateNormal];
    [hideKeyboardButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    hideKeyboardButton.titleLabel.font = [UIFont systemFontOfSize:9];
    hideKeyboardButton.frame = [self hideKeyboardButtonFrame];
    [_inputAccessoryView addSubview:hideKeyboardButton];
    
    [_textField setInputAccessoryView:_inputAccessoryView];
    
    _dataArray = [[NSMutableArray alloc] init];
    
    _dataArray =  [self fetchData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Enter edit mode

- (void)editTable:(id)sender
{
    if(_tableView.editing){
    
        [_tableView setEditing:NO animated:YES];
        [_tableView reloadData];
        [self.navigationItem.rightBarButtonItem setTitle:@"Edit"];
        [self.navigationItem.rightBarButtonItem setStyle:UIBarButtonItemStylePlain];
    }
    else{
        [_tableView setEditing:YES animated:YES];
        
        [self.navigationItem.rightBarButtonItem setTitle:@"Done"];
        [self.navigationItem.rightBarButtonItem setStyle:UIBarButtonItemStyleDone];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    Contact *contact = [_dataArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = contact.name;
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        NSManagedObject *contactToDelete = [_dataArray objectAtIndex:indexPath.row];
        [_managedObjectContext deleteObject:contactToDelete];
        
        [_dataArray removeObjectAtIndex:indexPath.row];
        [_tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
        
        NSError *error = nil;
        
        if(![_managedObjectContext save:&error]){
            //Handle the error
        }
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"canMoveRowAtIndexPath : %d", indexPath.row);
    
    return  indexPath.row == 1;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSLog(@"moveRowAtIndexPath row %d", sourceIndexPath.row);
}


#pragma mark - Fetch data

- (NSMutableArray *)fetchData
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Contact" inManagedObjectContext:_managedObjectContext];
    
    [request setEntity:entity];
    
    
    NSError *error = nil;
    NSMutableArray *mutableFetchResults = [[_managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    
    if(mutableFetchResults == nil){
        //handleError
    }
    
    return mutableFetchResults;
}

#pragma mark - Button Actions

- (void)addName:(id)sender
{
    Contact *contact = [NSEntityDescription insertNewObjectForEntityForName:@"Contact" inManagedObjectContext:_managedObjectContext];
    contact.name = _textField.text;
    contact.address = @"sfdfd";
    contact.phoneNumber = @"121211";
    contact.index = [NSNumber numberWithInt:3];


    NSError *error = nil;
    
    if(![_managedObjectContext save:&error]){
        //handle error
    }
    
    
    if(_dataArray == nil)
        _dataArray = [[NSMutableArray alloc] init];
    
    [_dataArray addObject:contact];
    
    _textField.text = @"";
    
    [_tableView reloadData];
}

- (void)hideKeyboard:(id)sender
{
    [_textField endEditing:YES];
}



#pragma mark - Frames

- (CGRect)textFieldFrame
{
    CGFloat padding = 10.0f;
    CGFloat x = 0.0f + padding;
    CGFloat y = 0.0f + padding;
    CGFloat width = CGRectGetWidth(self.view.frame)/1.5;
    CGFloat height = 50.0f;
    
    return CGRectMake(x, y, width, height);
}

- (CGRect)addButtonFrame
{
    CGFloat padding = 10.0f;
    CGFloat x = CGRectGetMaxX(_textField.frame) + padding;
    CGFloat y = CGRectGetMinY(_textField.frame);
    CGFloat width = CGRectGetMaxX(self.view.frame) - CGRectGetMaxX(_textField.frame) - 2*padding;
    CGFloat height = CGRectGetHeight(_textField.frame);
    
    return CGRectMake(x, y, width, height);
}

- (CGRect)inputAccessoryViewFrame
{
    CGFloat width = CGRectGetWidth(self.view.bounds);
    CGFloat height = 20.0f;
    CGFloat x = 0.0f;
    CGFloat y = 0.0f;
    
    return CGRectMake(x, y, width, height);
}

- (CGRect)hideKeyboardButtonFrame
{
    CGFloat padding = 5.0f;
    CGFloat width = 100.0f;
    CGFloat height = CGRectGetHeight(_inputAccessoryView.bounds);
    CGFloat x = CGRectGetWidth(_inputAccessoryView.bounds) - width - padding;
    CGFloat y = 0.0f;
    
    return CGRectMake(x, y, width, height);
}

- (CGRect)tableViewFrame
{
    CGFloat x = 0.0f;
    CGFloat y = CGRectGetMaxY(_textField.frame);
    CGFloat width = CGRectGetWidth(self.view.frame);
    CGFloat height = CGRectGetHeight(self.view.bounds) - y - 50.0f;
    
    return CGRectMake(x, y, width, height);
}


@end
