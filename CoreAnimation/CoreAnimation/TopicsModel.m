//
//  TopicsModel.m
//  CoreAnimation
//
//  Created by Hari Kunwar on 4/24/13.
//  Copyright (c) 2013 unknown. All rights reserved.
//

#import "TopicsModel.h"

@interface TopicsModel ()

@property (nonatomic, readwrite) NSDictionary *topicsDictionary;
@property (nonatomic, readwrite) NSDictionary *ballDictionary;
@property (nonatomic, readwrite) NSDictionary *wireDictionary;

@end

@implementation TopicsModel

static TopicsModel *sharedInstance = nil;

+ (id)sharedInstance
{
    static dispatch_once_t once = 0;
    dispatch_once(&once,^{
        sharedInstance = [[TopicsModel alloc] init];
        [sharedInstance initTopicsModel];
    });
    
    return sharedInstance;
}

- (void)initTopicsModelWithJsonFile:(NSString *)jsonFile
{
    //store topics and viewcontroller names in json files
}

- (void)initTopicsModel
{
    _ballDictionary = @{@"Ball Drop":@"BallDropViewController", @"Ball Bounce":@"BallBounceViewController", @"Ball Rolling":@"BallRollViewController"};
    
    _wireDictionary = @{@"Wire Drop":@"WireDropViewController", @"Wire Bounce":@"WireBounceViewController", @"Wire Roll":@"WireRollViewController"};
    
    NSArray *ballAnimationViewControllers = [_ballDictionary allKeys];
    
    NSArray *wireAnimationViewControllers = [_wireDictionary allKeys];

    sharedInstance.topicsDictionary = @{@"Ball Animations":ballAnimationViewControllers,@"Wire Animations":wireAnimationViewControllers};
}

#pragma mark - Data Source methods

- (NSInteger)numberOfTopics
{
    return [sharedInstance.topicsDictionary count];
}

- (NSInteger)numberOfSamplesForTopic:(NSString *)topic
{
    if(topic == nil)
        return 0;
    
    return [[sharedInstance.topicsDictionary objectForKey:topic] count];
}

- (NSArray *)topics
{    
    return [sharedInstance.topicsDictionary allKeys];
}


- (NSArray *)samplesForTopic:(NSString *)topic
{
    if(topic == nil)
        return nil;
    
    return [sharedInstance.topicsDictionary objectForKey:topic];
}

- (UIViewController *)viewControllerForKey:(NSString *)key
{
    if(key == nil)
        return nil;
    
    NSString *viewControllerName = [_ballDictionary objectForKey:key];
    if(viewControllerName == nil){
        viewControllerName = [_wireDictionary objectForKey:key];
    }
    Class class =  NSClassFromString(viewControllerName);
    
    id viewController = (UIViewController *)[[class alloc] init];
    
    return viewController;
}

@end
