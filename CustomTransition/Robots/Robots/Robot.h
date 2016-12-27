//
//  Robot.h
//  Robots
//
//  Created by Hari Kunwar on 4/2/14.
//  Copyright (c) 2014 Hari Kunwar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Robot : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *info;
@property (nonatomic, strong) UIImage *image;


+ (id)robotWithName:(NSString *)name description:(NSString *)description image:(UIImage *)image;
+ (NSArray *)robots;//get preloaded robot instances

@end
