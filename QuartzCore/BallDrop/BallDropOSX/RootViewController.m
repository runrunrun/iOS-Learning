//
//  RootViewController.m
//  BallDrop
//
//  Created by Hari Kunwar on 7/17/13.
//  Copyright (c) 2013 unknown. All rights reserved.
//

#import "RootViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface RootViewController ()

@property (nonatomic, assign) IBOutlet NSImageView *ballImageView;
@property (nonatomic, assign) IBOutlet NSButton *dropButton;


@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}


- (IBAction)dropBallUsingKeyframeAnimationWithTranslation:(id)sender
{
    CGFloat height = CGRectGetMinY(_ballImageView.frame);
    
    NSString *keyPath = @"transform.translation.y";
    
    CAKeyframeAnimation *translation = [CAKeyframeAnimation animationWithKeyPath:keyPath];
    translation.duration = 1.0f;
    
    translation.removedOnCompletion = FALSE;
    translation.fillMode = kCAFillModeForwards;
    
    NSMutableArray *values = [[NSMutableArray alloc] init];
    [values addObject:[NSNumber numberWithFloat:0.0f]];
    [values addObject:[NSNumber numberWithFloat:-height]];
    
    translation.values = values;
    
    [_ballImageView.layer addAnimation:translation forKey:keyPath];
}

- (IBAction)dropBallUsingBasicAnimationWithTranslation:(id)sender
{
    CGFloat height = CGRectGetMinY(_ballImageView.frame);
    
    NSString *keyPath = @"transform.translation.y";
    
    CABasicAnimation *translation = [CABasicAnimation animationWithKeyPath:keyPath];
    translation.duration = 1.0f;
    
    translation.removedOnCompletion = FALSE;
    translation.fillMode = kCAFillModeForwards;
    
    translation.fromValue = [NSNumber numberWithInt:0.0f];
    translation.toValue = [NSNumber numberWithInt:-height];
    
    [_ballImageView.layer addAnimation:translation forKey:keyPath];
}

- (IBAction)dropBallUsingBasicAnimationWithPosition:(id)sender
{
    CGFloat height = CGRectGetHeight(self.view.frame) - CGRectGetMaxY(_ballImageView.frame);
    CGPoint position = _ballImageView.layer.position;
    
    NSString *keyPath = @"position.y";
    
    CABasicAnimation *translation = [CABasicAnimation animationWithKeyPath:keyPath];
    translation.duration = 1.0f;
    
    translation.removedOnCompletion = FALSE;
    translation.fillMode = kCAFillModeForwards;
    
    translation.fromValue = [NSNumber numberWithInt:position.y];
    translation.toValue = [NSNumber numberWithInt:0.0];
    
    [_ballImageView.layer addAnimation:translation forKey:keyPath];
}


@end
