//
//  ViewController.m
//  tvOS Intro
//
//  Created by Hari Kunwar on 11/12/15.
//  Copyright © 2015 learning. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tvCell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"row number %ld", indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Subtitle number %ld", indexPath.row];
    return cell;
}


@end
