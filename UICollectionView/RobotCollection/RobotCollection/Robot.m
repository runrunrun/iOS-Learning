//
//  Robot.m
//  Robots
//
//  Created by Hari Kunwar on 4/2/14.
//  Copyright (c) 2014 Hari Kunwar. All rights reserved.
//

#import "Robot.h"

@implementation Robot

+ (id)robotWithName:(NSString *)name
        description:(NSString *)description
              image:(UIImage *)image
               size:(RobotSize)size
{
    Robot *robot = [Robot new];
    robot.name = name;
    robot.description = description;
    robot.image = image;
    robot.size = size;
    
    return robot;
}

+ (NSArray *)robots//get preloaded robot instances
{
    Robot *robot1 = [self robotWithName:@"Casino Robot"
                            description:@""
                                  image:[UIImage imageNamed:@"CasinoRobot"]
                                   size:large];
    
    Robot *robot2 = [self robotWithName:@"Fighting Robot"
                            description:@""
                                  image:[UIImage imageNamed:@"FightingRobot"]
                                   size:medium];
    
    Robot *robot3 = [self robotWithName:@"Gun Robot"
                            description:@""
                                  image:[UIImage imageNamed:@"GunRobot"]
                                   size:small];
    
    Robot *robot4 = [self robotWithName:@"Halo Robot"
                            description:@""
                                  image:[UIImage imageNamed:@"HaloRobot"]
                     size:small];
    
    Robot *robot5 = [self robotWithName:@"Mcdonald Robot"
                            description:@""
                                  image:[UIImage imageNamed:@"McdonaldRobot"]
                                   size:medium];
    
    Robot *robot6 = [self robotWithName:@"Old Robot"
                            description:@""
                                  image:[UIImage imageNamed:@"OldRobot"]
                                   size:small];
    
    Robot *robot7 = [self robotWithName:@"Casino Robot"
                            description:@""
                                  image:[UIImage imageNamed:@"StandingRobot"]
                                   size:small];
    
    Robot *robot8 = [self robotWithName:@"Halo Robot"
                            description:@""
                                  image:[UIImage imageNamed:@"HaloRobot"]
                                   size:small];
    
    Robot *robot9 = [self robotWithName:@"Mcdonald Robot"
                            description:@""
                                  image:[UIImage imageNamed:@"McdonaldRobot"]
                                   size:medium];
    
    Robot *robot10 = [self robotWithName:@"Old Robot"
                            description:@""
                                  image:[UIImage imageNamed:@"OldRobot"]
                                   size:small];
    
    Robot *robot11 = [self robotWithName:@"Casino Robot"
                            description:@""
                                  image:[UIImage imageNamed:@"StandingRobot"]
                                   size:small];
    
    Robot *robot12 = [self robotWithName:@"Halo Robot"
                            description:@""
                                  image:[UIImage imageNamed:@"HaloRobot"]
                                   size:small];
    
    Robot *robot13 = [self robotWithName:@"Mcdonald Robot"
                            description:@""
                                  image:[UIImage imageNamed:@"McdonaldRobot"]
                                   size:medium];
    
    Robot *robot14 = [self robotWithName:@"Old Robot"
                             description:@""
                                   image:[UIImage imageNamed:@"OldRobot"]
                                    size:small];
    
    Robot *robot15 = [self robotWithName:@"Casino Robot"
                             description:@""
                                   image:[UIImage imageNamed:@"StandingRobot"]
                                    size:small];
    
    NSArray *robots = [NSArray arrayWithObjects:robot1, robot2, robot3, robot4, robot5, robot6, robot7, robot8, robot9, robot10, robot11, robot12, robot13, robot14, robot15, nil];
    
    return robots;
}

+ (CGSize)robotSize:(RobotSize)size
{
    CGFloat width = 0, height = 0;
    
    switch (size) {
        case small:
            width = 100, height = 100;
            break;
        case medium:
            width = 100, height = 200;
            break;
        case large:
            width = 300, height = 200;
            break;
        default:
            width = 100, height = 100;
            break;
    }
    
    return CGSizeMake(width, height);
}


@end
