//
//  ViewController.m
//  ActionExtension
//
//  Created by Hari Kunwar on 11/20/14.
//  Copyright (c) 2014 Hari Kunwar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSUserDefaults *_userDefault;
    __weak IBOutlet UILabel *_textLabel;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _userDefault = [[NSUserDefaults alloc] initWithSuiteName:@"group.harikunwarDev"];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(actionUpdate:)
                                                 name:NSUserDefaultsDidChangeNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(actionUpdate:)
                                                name:UIApplicationDidBecomeActiveNotification
                                              object:nil];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)actionUpdate:(NSNotification *)notification
{
    NSString *url = [_userDefault objectForKey:@"urlKey"];
    _textLabel.text = url;
}

@end
