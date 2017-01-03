//
//  FruitTableViewController.m
//  AdaptiveCell
//
//  Created by Hari Kunwar on 11/7/14.
//  Copyright (c) 2014 Hari Kunwar. All rights reserved.
//

#import "FruitTableViewController.h"
#import "FruitTableViewCell.h"
#import "Fruit.h"
#import "UIView+Layout.h"

// 1 - Implement delegate tableView:estimatedHeightForRowAtIndexPath: and return UITableViewAutomaticDimension.
// 2 - Set constraints to top and bottom of table cell.

NSString *fruitCellIdentifier = @"fruitCell";

@interface FruitTableViewController ()
{
    NSArray *_fruits;
}
@end

@implementation FruitTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _fruits = [Fruit fruitsCollection];
    
    // Setting tableView.rowHeight = UITableViewAutomaticDimension does not work on iOS 10.
    // Need to implement delegate tableView:estimatedHeightForRowAtIndexPath: and return UITableViewAutomaticDimension.
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.tableView.estimatedRowHeight = 200;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _fruits.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FruitTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:fruitCellIdentifier forIndexPath:indexPath];
    
    Fruit *fruit = _fruits[indexPath.row];
    
    cell.fruitLabel.text = fruit.name;
    cell.fruitSubLabel.text = fruit.name;
//    cell.imageView.image = [UIImage imageNamed:fruit.image];
    
//    [cell showLayoutBorders];
        
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}


@end
