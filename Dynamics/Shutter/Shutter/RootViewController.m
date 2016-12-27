//
//  RootViewController.m
//  Shutter
//
//  Created by Hari Kunwar on 7/2/13.
//  Copyright (c) 2013 unknown. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController () <UICollisionBehaviorDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *shutterView;
@property (nonatomic, assign) CGPoint gestureStartPoint;
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIPushBehavior *pushBehavior;

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
	
    self.view.backgroundColor = [UIColor redColor];
    
    CGFloat x = 0.0f, y = 0.0f, width = 100.0f, height = 100.0f;//width = CGRectGetWidth(self.view.frame), height = CGRectGetHeight(self.view.frame);
    _shutterView = [[UIView alloc] initWithFrame:CGRectMake(x, y, width, height)];
    _shutterView.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.5];
    [self.view addSubview:_shutterView];
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panShutterView:)];
    [_shutterView addGestureRecognizer:panGestureRecognizer];

    
    [self runAnimator];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - PanShutterView

- (void)panShutterView:(UIPanGestureRecognizer *)gestureRecognizer
{
    UIView *shutterView = [gestureRecognizer view];
    
    UIGestureRecognizerState gestureState = [gestureRecognizer state];
    
    if(gestureState == UIGestureRecognizerStateBegan) {
        _gestureStartPoint = shutterView.center ;
    }
    
    CGPoint translatedPoint = [gestureRecognizer translationInView:self.view];
    translatedPoint = CGPointMake(_gestureStartPoint.x + translatedPoint.x, _gestureStartPoint.y + translatedPoint.y);
    
    CGFloat floorY = CGRectGetMaxY(self.view.frame) - CGRectGetHeight(shutterView.frame)/2;
    CGFloat floorX = translatedPoint.x;

    BOOL shutterFloor = translatedPoint.y < floorY;
    
    if(shutterFloor){
        [shutterView setCenter:translatedPoint];
    }
    else{
        CGPoint floorCenter = CGPointMake(floorX, floorY);
        [shutterView setCenter:floorCenter];
    }
    
    if(gestureState == UIGestureRecognizerStateEnded){
        [_animator removeAllBehaviors];
        [self runAnimator];
    }

}

- (void)runAnimator
{
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[_shutterView]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [animator addBehavior:collisionBehavior];
    
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[_shutterView]];
    [animator addBehavior:gravityBehavior];
    
    UIDynamicItemBehavior* propertiesBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[_shutterView]];
    propertiesBehavior.density = 0.5;
    
    [animator addBehavior:propertiesBehavior];
    
    _animator = animator;
}


#pragma mark - UICollisionBehaviorDelegate

-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p
{
}

-(void)collisionBehavior:(UICollisionBehavior *)behavior endedContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier
{
}

@end
