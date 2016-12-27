//
//  ShutterView.m
//  Shutter
//
//  Created by Hari Kunwar on 7/2/13.
//  Copyright (c) 2013 unknown. All rights reserved.
//

#import "ShutterView.h"

@interface ShutterView () <UIGestureRecognizerDelegate>

@end

@implementation ShutterView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self selector:@selector(panShutter:)];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)panShutter:(UIPanGestureRecognizer *)gesture
{
    
}

@end
