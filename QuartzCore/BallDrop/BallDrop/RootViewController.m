//
//  RootViewController.m
//  BallDrop
//
//  Created by Hari Kunwar on 7/15/13.
//  Copyright (c) 2013 unknown. All rights reserved.
//

#import "RootViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface RootViewController ()

@property (nonatomic, strong) UIImageView *ballImageView;
@property (nonatomic, strong) UIButton *dropButton;

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
    
    _dropButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_dropButton setTitle:@"Drop" forState:UIControlStateNormal];
    _dropButton.frame = [self dropButtonFrame];
    [_dropButton addTarget:self action:@selector(dropBallUsingBasicAnimationWithPosition) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_dropButton];
    
    _ballImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ball"]];
    _ballImageView.frame = [self ballImageViewFrame];
    [self.view addSubview:_ballImageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dropBallUsingKeyframeAnimationWithTranslation
{
    CGFloat height = CGRectGetHeight(self.view.frame) - CGRectGetMaxY(_ballImageView.frame);

    NSString *keyPath = @"transform.translation.y";

    CAKeyframeAnimation *translation = [CAKeyframeAnimation animationWithKeyPath:keyPath];
    translation.duration = 1.0f;

    translation.removedOnCompletion = FALSE;
    translation.fillMode = kCAFillModeForwards;
    
    NSMutableArray *values = [[NSMutableArray alloc] init];
    [values addObject:[NSNumber numberWithFloat:0.0f]];
    [values addObject:[NSNumber numberWithFloat:height]];
    
    translation.values = values;
        
    [_ballImageView.layer addAnimation:translation forKey:keyPath];
}

- (void)dropBallUsingBasicAnimationWithTranslation
{
    CGFloat height = CGRectGetHeight(self.view.frame) - CGRectGetMaxY(_ballImageView.frame);
    
    NSString *keyPath = @"transform.translation.y";
    
    CABasicAnimation *translation = [CABasicAnimation animationWithKeyPath:keyPath];
    translation.duration = 1.0f;
    
    translation.removedOnCompletion = FALSE;
    translation.fillMode = kCAFillModeForwards;
    
    translation.fromValue = [NSNumber numberWithInt:0.0f];
    translation.toValue = [NSNumber numberWithInt:height];
    
    [_ballImageView.layer addAnimation:translation forKey:keyPath];
}

- (void)dropBallUsingBasicAnimationWithPosition
{
    CGFloat height = CGRectGetHeight(self.view.frame) - CGRectGetMaxY(_ballImageView.frame);
    CGPoint position = _ballImageView.layer.position;
    
    NSString *keyPath = @"position.y";
    
    CABasicAnimation *translation = [CABasicAnimation animationWithKeyPath:keyPath];
    translation.duration = 1.0f;
    
    translation.removedOnCompletion = FALSE;
    translation.fillMode = kCAFillModeForwards;
    
    translation.fromValue = [NSNumber numberWithInt:position.y];
    translation.toValue = [NSNumber numberWithInt:position.y + height];
    
    [_ballImageView.layer addAnimation:translation forKey:keyPath];
}


#pragma mark - Frames

- (CGRect)dropButtonFrame
{
    CGFloat width = 80.0f;
    CGFloat height = 40.0f;
    CGFloat x = CGRectGetMidX(self.view.frame) - width/2;
    CGFloat y = 0.0f;
    
    return CGRectMake(x, y, width, height);
}

- (CGRect)ballImageViewFrame
{
    CGFloat width = 50.0f;
    CGFloat height = 50.0f;
    CGFloat x = CGRectGetMidX(self.view.frame) - width/2;
    CGFloat y = CGRectGetMaxY(_dropButton.frame) + 5.0f;
    
    return CGRectMake(x, y, width, height);
}



@end
