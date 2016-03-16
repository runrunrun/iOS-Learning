//
//  LogViewController.m
//  LogSample
//
//  Created by Hari Kunwar on 3/15/16.
//  Copyright © 2016 Learning. All rights reserved.
//

#import "LogViewController.h"

@interface LogViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation LogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self displayLog];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)displayLog {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    NSString *logPath = [documentsDirectory stringByAppendingPathComponent:@"console.txt"];
    
    NSError *err = nil;
    NSString *fileContents = [NSString stringWithContentsOfFile:logPath
                                                       encoding:NSUTF8StringEncoding
                                                          error:&err];
    if (fileContents == nil) {
        NSLog(@"Error reading %@: %@", logPath, err);
    } else {
        self.textView.text = fileContents;
    }
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
