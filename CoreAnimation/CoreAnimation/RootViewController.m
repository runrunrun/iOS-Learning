//
//  RootViewController.m
//  CoreAnimation
//
//  Created by Hari Kunwar on 4/22/13.
//  Copyright (c) 2013 unknown. All rights reserved.
//

#import "RootViewController.h"
#import "TopicsModel.h"
#import "AppDelegate.h"

@interface RootViewController ()

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, copy) NSArray *topics;

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _topics = [[TopicsModel sharedInstance] topics];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableDataSourceDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_topics count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *topic = _topics[section];
    NSInteger numberOfRows = [[TopicsModel sharedInstance] numberOfSamplesForTopic:topic];
    return numberOfRows;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _topics[section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    cell.textLabel.text = [self sampleNameForIndexPath:indexPath];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *sampleName = [self sampleNameForIndexPath:indexPath];
    
    if(sampleName != nil)
    {
        UIViewController *viewController = [[TopicsModel sharedInstance] viewControllerForKey:sampleName];
        
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate.navigationController  pushViewController:viewController animated:YES];
    }
}


#pragma mark - 

- (NSString *)sampleNameForIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    NSString *topic = _topics[section];
    NSArray *samples = [[TopicsModel sharedInstance] samplesForTopic:topic];
    
    NSString *sampleName = samples[row];
    
    return sampleName;
}

@end
