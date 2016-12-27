//
//  LoginTests.m
//  LoginTests
//
//  Created by Hari Kunwar on 7/10/13.
//  Copyright (c) 2013 unknown. All rights reserved.
//

#import "LoginTests.h"
#import "AppDelegate.h"
#import "LoginViewController.h"

@interface LoginTests()

@property (nonatomic, strong) LoginViewController *loginViewController;
@property (nonatomic, strong) UIView *loginView;

@end

@implementation LoginTests

- (void)setUp
{
    [super setUp];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    _loginViewController = appDelegate.loginViewController;
    _loginView = _loginViewController.view;    
}

- (void)tearDown
{    
    [super tearDown];
}

- (void)testInputValidation
{
    STAssertFalse([_loginViewController isValidUserName:nil], @"Nil username");
    STAssertFalse([_loginViewController isValidUserName:@"ddd"], @"Short username");

    STAssertFalse([_loginViewController isValidPassword:nil], @"Nil password");
    STAssertFalse([_loginViewController isValidPassword:@"ddd"], @"Short password");
    
    STAssertTrue([_loginViewController isValidUserName:@"usernametest"], @"Valid username");
    STAssertTrue([_loginViewController isValidPassword:@"userpassword"], @"Valid password");
}

@end
