//
//  AppDelegate.h
//  AutoLayoutSampleIOS
//
//  Created by Hari Kunwar on 7/18/13.
//  Copyright (c) 2013 unknown. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoginViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) LoginViewController *loginViewController;

@end
