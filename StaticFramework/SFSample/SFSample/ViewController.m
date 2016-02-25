//
//  ViewController.m
//  SFSample
//
//  Created by Hari Kunwar on 2/25/16.
//  Copyright © 2016 Learning. All rights reserved.
//

#import "ViewController.h"
#import <StaticFramework/SFCustomView.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    SFCustomView *view = [SFCustomView new];
    view.frame = CGRectMake(0, 0, 100, 100);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
