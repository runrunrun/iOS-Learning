//
//  LoginViewController.m
//  Login
//
//  Created by Hari Kunwar on 7/10/13.
//  Copyright (c) 2013 unknown. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)isValidUserName:(NSString *)userName
{
    BOOL isValidLoginString = [self isValidLoginString:userName];
    
    BOOL isNotShort = userName.length > 8 ;
    
    BOOL isValid = isNotShort && isValidLoginString;

    return isValid;
}

- (BOOL)isValidPassword:(NSString *)password
{
    BOOL isValidLoginString = [self isValidLoginString:password];
    
    BOOL isNotShort = password.length > 8 ;
    
    BOOL isValid = isNotShort && isValidLoginString;
    
    return isValid;
}

- (BOOL)isValidLoginString:(NSString *)string
{
    BOOL isNotNil = string != nil;
    
    NSString *userNameWithoutWhiteSpaces = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    BOOL hasNoWhiteSpaces = userNameWithoutWhiteSpaces.length == string.length;

    BOOL isValidLoginString = isNotNil && hasNoWhiteSpaces;
    
    return isValidLoginString;
}

@end
