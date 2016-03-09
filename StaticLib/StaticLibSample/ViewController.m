//
//  ViewController.m
//  StaticLibSample
//
//  Created by Hari Kunwar on 3/9/16.
//  Copyright © 2016 Learning. All rights reserved.
//

#import "ViewController.h"
#import "SLBannerView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    SLBannerView *bannerView = [SLBannerView new];
    bannerView.frame = CGRectZero;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
