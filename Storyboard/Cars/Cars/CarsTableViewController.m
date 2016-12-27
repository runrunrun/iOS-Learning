//
//  CarsTableViewController.m
//  Cars
//
//  Created by Hari Kunwar on 8/26/14.
//  Copyright (c) 2014 Hari Kunwar. All rights reserved.
//

#import "CarsTableViewController.h"
#import "CarDetailViewController.h"
#import "Car.h"

@interface CarsTableViewController ()

@end

@implementation CarsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cars.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Car *car = self.cars[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"carsCell" forIndexPath:indexPath];
    
    cell.textLabel.text = car.name;
    
    // Configure the cell...
    
    return cell;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UITableViewCell *cell = (UITableViewCell *)sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    Car *car = _cars[indexPath.row];
    
    if ([segue.identifier isEqualToString:@"cheapCarDetailSegue"]) {
        CarDetailViewController *carDetailViewController = segue.destinationViewController;
        carDetailViewController.car = car;
    }
    else if ([segue.identifier isEqualToString:@"expensiveCarDetailSegue"]) {
        CarDetailViewController *carDetailViewController = segue.destinationViewController;
        carDetailViewController.car = car;
    }
}


@end
