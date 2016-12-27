//
//  BallDropViewController.m
//  CoreAnimation
//
//  Created by Hari Kunwar on 4/24/13.
//  Copyright (c) 2013 unknown. All rights reserved.
//

#import "BallDropViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface BallDropViewController ()

@end

@implementation BallDropViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//- (void)loadView
//{
//    CGRect viewFrame = [UIScreen mainScreen].applicationFrame;
////    viewFrame.origin.y = viewFrame.origin.y;
//    
//    self.view = [[UIView alloc] initWithFrame:viewFrame];
//    
//    self.view.layer.borderColor = [UIColor redColor].CGColor;
//    self.view.layer.borderWidth = 5.0f;
//    
//}


- (void)viewDidLoad
{
    [super viewDidLoad];

    CALayer *ball = [self ballLayer];
    
    CGFloat ballX = CGRectGetMidX(self.view.bounds);
    CGFloat ballY = CGRectGetMinY(self.view.bounds) + CGRectGetHeight(ball.bounds)/2;
    CGPoint ballFromPoint = CGPointMake(ballX, ballY);
    ball.position = ballFromPoint;
    
    [self.view.layer addSublayer:ball];

    
    ballY = CGRectGetMaxY(self.view.bounds) - CGRectGetHeight(ball.bounds);
    CGPoint ballToPoint = CGPointMake(ballX, ballY);

    CABasicAnimation *dropAnimation = [self dropAnimationFromPoint:ballFromPoint toPoint:ballToPoint];

    [ball addAnimation:dropAnimation forKey:@"drop"];
    
    ball.position = ballToPoint;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CALayer*)ballLayer
{
    CALayer *ball = [CALayer layer];
    ball.bounds = CGRectMake(0,0,50,50);
    ball.cornerRadius = 25;
    ball.backgroundColor = [UIColor blackColor].CGColor;
    
    return ball;
}

- (CABasicAnimation *)dropAnimationFromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint
{
    CABasicAnimation *dropAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    dropAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    dropAnimation.fromValue = [NSValue valueWithCGPoint:fromPoint];
    dropAnimation.toValue = [NSValue valueWithCGPoint:toPoint];
    
    dropAnimation.duration = 2.0;
    
    return dropAnimation;
}


@end
