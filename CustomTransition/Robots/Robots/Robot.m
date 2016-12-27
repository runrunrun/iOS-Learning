//
//  Robot.m
//  Robots
//
//  Created by Hari Kunwar on 4/2/14.
//  Copyright (c) 2014 Hari Kunwar. All rights reserved.
//

#import "Robot.h"

@implementation Robot

+ (id)robotWithName:(NSString *)name description:(NSString *)description image:(UIImage *)image
{
    Robot *robot = [Robot new];
    robot.name = name;
    robot.info = description;
    robot.image = image;
    
    return robot;
}

+ (NSArray *)robots//get preloaded robot instances
{
    Robot *robot1 = [self robotWithName:@"Casino Robot" description:@"" image:[UIImage imageNamed:@"CasinoRobot.jpeg"]];
    Robot *robot2 = [self robotWithName:@"Fighting Robot" description:@"" image:[UIImage imageNamed:@"FightingRobot"]];
    Robot *robot3 = [self robotWithName:@"Gun Robot" description:@"" image:[UIImage imageNamed:@"GunRobot"]];
    Robot *robot4 = [self robotWithName:@"Halo Robot" description:@"" image:[UIImage imageNamed:@"HaloRobot"]];
    Robot *robot5 = [self robotWithName:@"Mcdonald Robot" description:@"" image:[UIImage imageNamed:@"McdonaldRobot"]];
    Robot *robot6 = [self robotWithName:@"Old Robot" description:@"" image:[UIImage imageNamed:@"OldRobot"]];
    Robot *robot7 = [self robotWithName:@"Casino Robot" description:@"" image:[UIImage imageNamed:@"StandingRobot"]];
    
    NSArray *robots = [NSArray arrayWithObjects:robot1, robot2, robot3, robot4, robot5, robot6, robot7, nil];
    
    return robots;
}

@end
