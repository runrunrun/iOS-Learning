//
//  Car.h
//  Cars
//
//  Created by Hari Kunwar on 8/26/14.
//  Copyright (c) 2014 Hari Kunwar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, assign) CGFloat price;

+ (NSArray *)cheapCars;
+ (NSArray *)expensiveCars;

@end
