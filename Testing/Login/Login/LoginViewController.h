//
//  LoginViewController.h
//  Login
//
//  Created by Hari Kunwar on 7/10/13.
//  Copyright (c) 2013 unknown. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

- (BOOL)isValidUserName:(NSString *)userName;
- (BOOL)isValidPassword:(NSString *)userName;

@end
