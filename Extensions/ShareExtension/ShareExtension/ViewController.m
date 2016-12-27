//
//  ViewController.m
//  ShareExtension
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
    NSString *text = [_userDefault objectForKey:@"textKey"];
    _textLabel.text = text;

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(sharePost:)
                                                 name:NSUserDefaultsDidChangeNotification
                                               object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sharePost:(NSNotification *)notification {
    NSString *text = [_userDefault objectForKey:@"textKey"];
    _textLabel.text = text;
}

@end
