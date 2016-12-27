//
//  ViewController.m
//  TodayExtension
//
//  Created by Hari Kunwar on 11/14/14.
//  Copyright (c) 2014 Hari Kunwar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButtonPressed:(id)sender {
    NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.harikunwarDev"];
    [sharedDefaults setObject:self.textLabel.text forKey:@"textKey"];
    [sharedDefaults synchronize];   // (!!) This is crucial.
}


@end
