//
//  Contact.h
//  CoreData
//
//  Created by Hari Kunwar on 5/12/13.
//  Copyright (c) 2013 unknown. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Contact : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * index;
@property (nonatomic, retain) NSString * phoneNumber;
@property (nonatomic, retain) NSString * address;

@end
