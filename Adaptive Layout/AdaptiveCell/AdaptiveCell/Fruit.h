//
//  Fruit.h
//  AdaptiveCell
//
//  Created by Hari Kunwar on 11/6/14.
//  Copyright (c) 2014 Hari Kunwar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fruit : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *image;

+ (Fruit *)fruitWithName:(NSString *)name image:(NSString *)image;
+ (NSArray *)fruitsCollection;

@end
