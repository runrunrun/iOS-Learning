//
//  ViewController.m
//  MotionEffect
//
//  Created by Hari Kunwar on 12/9/14.
//  Copyright (c) 2014 Hari Kunwar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"GoraBeluha"]];
    backgroundImageView.frame = self.view.bounds;
    backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:backgroundImageView];
    [self addMotionEffectToView:backgroundImageView magnitude:50.0f];
}

- (void)addMotionEffectToView:(UIView*)view  magnitude:(float)magnitude {
    UIInterpolatingMotionEffect* xMotion = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x"
                                                                                           type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    xMotion.minimumRelativeValue = @(-magnitude);
    xMotion.maximumRelativeValue = @(magnitude);
    
    UIInterpolatingMotionEffect* yMotion = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y"
                                                                                           type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    yMotion.minimumRelativeValue = @(-magnitude);
    yMotion.maximumRelativeValue = @(magnitude);
    
    UIMotionEffectGroup* group = [[UIMotionEffectGroup alloc] init];
    group.motionEffects = @[xMotion, yMotion];
    
    [view addMotionEffect:group];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
