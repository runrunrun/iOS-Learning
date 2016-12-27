//
//  ContainerCell.m
//  RobotCollection
//
//  Created by Hari Kunwar on 5/5/14.
//  Copyright (c) 2014 Hari Kunwar. All rights reserved.
//

#import "ContainerCell.h"
#import "Robot.h"
#import "RobotCell.h"

@interface ContainerCell()
{
    NSMutableArray *_robotCells;
}

@end

@implementation ContainerCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setRobots:(NSMutableArray *)robots
{
    _robotCells = [NSMutableArray array];
    
    for (Robot *robot in robots) {
        RobotCell *cell = [[RobotCell alloc] init];
        cell.imageView.image = robot.image;
        [self addSubview:cell];
        [_robotCells addObject:cell];
        
        cell.layer.borderColor = [[UIColor blueColor] CGColor];
        cell.layer.borderWidth = 1.0f;
    }
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat x = 0, y = 0, width = self.bounds.size.width, height = self.bounds.size.height/2;
    
    for (RobotCell *cell in _robotCells) {
        cell.frame = CGRectMake(x, y, width, height);
        y = CGRectGetMaxY(cell.frame);
        
        cell.backgroundColor = [UIColor blueColor];
    }
}


@end
