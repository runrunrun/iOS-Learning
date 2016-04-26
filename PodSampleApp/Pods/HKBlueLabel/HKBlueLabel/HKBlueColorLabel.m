//
//  HKBlueColorLabel.m
//  HKBlueLabel
//
//  Created by Kunwar on 4/25/16.
//  Copyright © 2016 Learning. All rights reserved.
//

#import "HKBlueColorLabel.h"

@implementation HKBlueColorLabel

- (void)willMoveToSuperview:(nullable UIView *)newSuperview {
    self.textColor = [UIColor blueColor];
    self.backgroundColor = [UIColor whiteColor];
}

@end
