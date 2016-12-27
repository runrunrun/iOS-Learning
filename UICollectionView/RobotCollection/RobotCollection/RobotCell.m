//
//  RobotCell.m
//  RobotCollection
//
//  Created by Hari Kunwar on 5/2/14.
//  Copyright (c) 2014 Hari Kunwar. All rights reserved.
//

#import "RobotCell.h"

@implementation RobotCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.imageView = [[UIImageView alloc] init];
        [self addSubview:_imageView];
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = self.bounds;
}

@end
