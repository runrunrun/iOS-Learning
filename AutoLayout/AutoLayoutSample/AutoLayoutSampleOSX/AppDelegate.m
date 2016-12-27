//
//  AppDelegate.m
//  AutoLayoutSampleOSX
//
//  Created by Hari Kunwar on 7/18/13.
//  Copyright (c) 2013 unknown. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) LoginViewController *loginViewController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    _loginViewController = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    
    NSView *loginView = _loginViewController.view;
    
    [_window.contentView addSubview:loginView];
    
    loginView.layer.backgroundColor = [[NSColor redColor] CGColor];
    
    _loginViewController.view.frame = ((NSView*)self.window.contentView).bounds;
    _loginViewController.view.translatesAutoresizingMaskIntoConstraints = NO;  //This part hung me up

    [_window.contentView addConstraints:[NSLayoutConstraint
                                         constraintsWithVisualFormat:@"V:|[loginView]|"
                                         options:NSLayoutFormatDirectionLeadingToTrailing
                                         metrics:nil
                                         views:NSDictionaryOfVariableBindings(loginView)]];
    
    [_window.contentView addConstraints:[NSLayoutConstraint
                                         constraintsWithVisualFormat:@"H:|[loginView]|"
                                         options:NSLayoutFormatDirectionLeadingToTrailing
                                         metrics:nil
                                         views:NSDictionaryOfVariableBindings(loginView)]];

}

@end
