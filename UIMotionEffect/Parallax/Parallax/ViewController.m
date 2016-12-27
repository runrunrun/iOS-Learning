//
//  ViewController.m
//  Parallax
//
//  Created by Hari Kunwar on 11/26/13.
//  Copyright (c) 2013 Hari Kunwar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nightsky.jpeg"]];
    backgroundImageView.frame = self.view.bounds;
    [self.view addSubview:backgroundImageView];
    
    UIView *redBox = [[UIView alloc] initWithFrame:CGRectMake(100.0f, 100.0f, 40.0f, 40.0f)];
    redBox.layer.backgroundColor = [[UIColor redColor] CGColor];
    [self.view addSubview:redBox];
    
    UIInterpolatingMotionEffect *horizontalMotionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    horizontalMotionEffect.minimumRelativeValue = @(-50);
    horizontalMotionEffect.maximumRelativeValue = @(50);
    [redBox addMotionEffect:horizontalMotionEffect];
    
    UIInterpolatingMotionEffect *verticalMotionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    verticalMotionEffect.minimumRelativeValue = @(-50);
    verticalMotionEffect.maximumRelativeValue = @(50);
    [redBox addMotionEffect:verticalMotionEffect];
    
    UIInterpolatingMotionEffect *shadowEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"layer.shadowOffset" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    shadowEffect.minimumRelativeValue = [NSValue valueWithCGSize:CGSizeMake(-10, 5)];
    shadowEffect.maximumRelativeValue = [NSValue valueWithCGSize:CGSizeMake(10, 5)];
    [redBox addMotionEffect:shadowEffect];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
