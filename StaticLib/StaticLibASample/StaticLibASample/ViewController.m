//
//  ViewController.m
//  StaticLibASample
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
    
    // Will work only on device
    SLBannerView *bannerView = [SLBannerView new];
    [self.view addSubview:bannerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
