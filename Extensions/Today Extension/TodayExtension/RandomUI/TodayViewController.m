//
//  TodayViewController.m
//  RandomUI
//
//  Created by Hari Kunwar on 11/14/14.
//  Copyright (c) 2014 Hari Kunwar. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(userDefaultsDidChange:)
                                                 name:NSUserDefaultsDidChangeNotification
                                               object:nil];
    
    NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.harikunwarDev"];
    NSString *string = [sharedDefaults objectForKey:@"textKey"];
    self.textLabel.text = [NSString stringWithFormat:@"help %@", string];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}


- (void)userDefaultsDidChange:(NSNotification *)notification {
    NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.harikunwarDev"];
    NSString *string = [sharedDefaults objectForKey:@"textKey"];
    self.textLabel.text = [NSString stringWithFormat:@"%@", string];
}

@end
