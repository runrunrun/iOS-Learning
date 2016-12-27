//
//  RobotCollectionViewController.m
//  RobotCollection
//
//  Created by Hari Kunwar on 4/30/14.
//  Copyright (c) 2014 Hari Kunwar. All rights reserved.
//

#import "RobotCollectionViewController.h"
#import "ContainerCell.h"
#import "RobotCell.h"
#import "Robot.h"

@interface RobotCollectionViewController () <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>
{
    UICollectionView *_robotCollectionView;
    NSMutableArray *_robotArray;
}

@property (nonatomic, strong) UICollectionView *robotCollectionView;

@end

@implementation RobotCollectionViewController

static NSString *defaultCellIdentifier = @"DefaultCell";
static NSString *containerCellIdentifier = @"ContainerCell";

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
	// Do any additional setup after loading the view.
    
    _robotArray = [NSMutableArray array];
    
    NSArray *robots = [Robot robots];
    
    for (Robot *robot in robots) {
        id lastItem = [_robotArray lastObject];
        
        if ([lastItem isKindOfClass:[NSArray class]]) {
            
        }
    }
    
    NSMutableArray *smallRobots = [NSMutableArray array];
    NSMutableArray *mediumRobots = [NSMutableArray array];
    NSMutableArray *largeRobots = [NSMutableArray array];

    for (Robot *robot in robots) {
        if (robot.size == small) {
            [smallRobots addObject:robot];
        }
        else if (robot.size == medium) {
            [mediumRobots addObject:robot];
        }
        else if (robot.size == large) {
            [largeRobots addObject:robot];
        }
    }
    
    Robot *largeRobot = [largeRobots firstObject];
    [_robotArray addObject:largeRobot];
    
    for (int i = 0; i < [mediumRobots count]; i++) {
        Robot *mediumRobot = [mediumRobots objectAtIndex:i];
        [_robotArray addObject:mediumRobot];
        
        //Add two small robots
        Robot *smallRobot1 = [smallRobots objectAtIndex:0];
        Robot *smallRobot2 = [smallRobots objectAtIndex:1];
        
        NSArray *smallRobotSubArray = [NSArray arrayWithObjects:smallRobot1, smallRobot2, nil];
        [smallRobots removeObject:smallRobot1];
        [smallRobots removeObject:smallRobot2];
        
        [_robotArray addObject:smallRobotSubArray];
    }
    
    [_robotArray addObjectsFromArray:smallRobots];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    _robotCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    [_robotCollectionView registerClass:[RobotCell class] forCellWithReuseIdentifier:defaultCellIdentifier];
    [_robotCollectionView registerClass:[ContainerCell class] forCellWithReuseIdentifier:containerCellIdentifier];
    
    _robotCollectionView.delegate = self;
    _robotCollectionView.dataSource = self;
    
    [self.view addSubview:_robotCollectionView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    _robotCollectionView.frame = self.view.bounds;
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self.view setNeedsLayout];
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_robotArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *collectionCell = nil;
    
    id item = [_robotArray objectAtIndex:indexPath.row];
    
    if ([item isKindOfClass:[NSArray class]]) {
        ContainerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:containerCellIdentifier forIndexPath:indexPath];
        cell.robots = item;
        collectionCell = cell;
    }
    else {
        RobotCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:defaultCellIdentifier forIndexPath:indexPath];
        Robot *robot = (Robot *)item;
        cell.imageView.image = robot.image;
        collectionCell = cell;
    }
    
    collectionCell.layer.backgroundColor = [[UIColor redColor] CGColor];
    
    return collectionCell;
}


#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    id item = [_robotArray objectAtIndex:indexPath.row];
    
    CGSize size = CGSizeZero;
    
    if ([item isKindOfClass:[NSArray class]]) {
        size = [Robot robotSize:medium];
    }
    else {
        Robot *robot = (Robot *)item;
        size = [Robot robotSize:robot.size];
    }
    
    return size;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section;
{
    return 10.0f;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10.0f;
}

@end
