//
//  AppDelegate.m
//  BallDropOSX
//
//  Created by Hari Kunwar on 7/17/13.
//  Copyright (c) 2013 unknown. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) RootViewController *rootViewController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    _rootViewController = [[RootViewController alloc] initWithNibName:@"RootViewController" bundle:nil];

    [_window.contentView addSubview:_rootViewController.view];
    
    _rootViewController.view.frame = ((NSView*)self.window.contentView).bounds;
    
    _rootViewController.view.translatesAutoresizingMaskIntoConstraints = NO;  //This part hung me up
    NSView *rootView = _rootViewController.view;

//    rootView.layer.backgroundColor = [[NSColor blackColor] CGColor];
    
    [_window.contentView addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|-0-[rootView]-0-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(rootView)]];

    [_window.contentView addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-0-[rootView]-0-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(rootView)]];
    

}

@end
