//
//  RobotDetailViewController.m
//  Robots
//
//  Created by Hari Kunwar on 4/2/14.
//  Copyright (c) 2014 Hari Kunwar. All rights reserved.
//

#import "RobotDetailViewController.h"
#import "Robot.h"

@interface RobotDetailViewController ()
{
    UILabel *_titleLabel;
    UIImageView *_imageView;
    Robot *_robot;
}
@end

@implementation RobotDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithRobot:(Robot *)robot
{
    self = [super init];
    
    if (self) {
        _robot = robot;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _imageView = [[UIImageView alloc] initWithImage:_robot.image];
    _imageView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:_imageView];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.text = _robot.name;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_titleLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    CGFloat x = 0.0f, y = CGRectGetMaxY(self.navigationController.navigationBar.frame), width = CGRectGetWidth(self.view.bounds), height = 50.0f;
    
    _titleLabel.frame = CGRectMake(x, y, width, height);
    
    y = CGRectGetMaxY(_titleLabel.frame), height = CGRectGetHeight(self.view.bounds) - y;
    _imageView.frame = CGRectMake(x, y, width, height);
}

@end
