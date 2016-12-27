//
//  Robot.h
//  Robots
//
//  Created by Hari Kunwar on 4/2/14.
//  Copyright (c) 2014 Hari Kunwar. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum RobotSize
{
    small,
    medium,
    large
}RobotSize;

@interface Robot : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) RobotSize size;


+ (id)robotWithName:(NSString *)name
        description:(NSString *)description
              image:(UIImage *)image
               size:(RobotSize)size;

+ (NSArray *)robots;//get preloaded robot instances
+ (CGSize)robotSize:(RobotSize)size;

@end
