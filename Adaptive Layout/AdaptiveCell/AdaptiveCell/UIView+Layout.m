//
//  UIView+Layout.m
//  AdaptiveCell
//
//  Created by Hari Kunwar on 11/7/14.
//  Copyright (c) 2014 Hari Kunwar. All rights reserved.
//

#import "UIView+Layout.h"

@implementation UIView (Layout)

- (void)showLayoutBorders
{
    [self showLayoutBordersWithColor:[UIColor redColor]];
}

- (void)showLayoutBordersWithColor:(UIColor *)color
{
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = 1.0;
}

@end
