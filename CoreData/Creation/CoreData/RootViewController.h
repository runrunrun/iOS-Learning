//
//  RootViewController.h
//  CoreData
//
//  Created by Hari Kunwar on 5/11/13.
//  Copyright (c) 2013 unknown. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController 

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (id)initWithStyle:(UITableViewStyle)style;

@end
