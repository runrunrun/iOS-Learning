//
//  TopicsModel.h
//  CoreAnimation
//
//  Created by Hari Kunwar on 4/24/13.
//  Copyright (c) 2013 unknown. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Topic.h"

@interface TopicsModel : NSObject

@property (nonatomic, readonly) NSDictionary *topicsDictionary;

+ (id)sharedInstance;

- (NSInteger)numberOfTopics;
- (NSInteger)numberOfSamplesForTopic:(NSString *)topic;
- (NSArray *)topics;
- (NSArray *)samplesForTopic:(NSString *)topic;
- (UIViewController *)viewControllerForKey:(NSString *)key;

@end
