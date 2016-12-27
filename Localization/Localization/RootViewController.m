//
//  RootViewController.m
//  Localization
//
//  Created by Hari Kunwar on 4/29/13.
//  Copyright (c) 2013 unknown. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
@property (nonatomic, strong) IBOutlet UILabel *label;
@property (nonatomic, strong) IBOutlet UIButton *button;
- (IBAction)buttonPress:(id)sender;
@end

@implementation RootViewController

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
    
    NSString *buttonTitle = NSLocalizedString(@"Press Me", nil);
    
    [_button setTitle:buttonTitle forState:UIControlStateNormal];
    [_button setTitle:buttonTitle forState:UIControlStateHighlighted];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)buttonPress:(id)sender
{
    _label.text = NSLocalizedString(@"Hello World", nil);
}


@end
