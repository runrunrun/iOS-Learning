//
//  Car.m
//  Car
//
//  Created by Hari Kunwar on 8/26/14.
//  Copyright (c) 2014 Hari Kunwar. All rights reserved.
//

#import "Car.h"

@implementation Car

+ (NSArray *)cheapCars
{
    
    Car *car1 = [Car new];
    car1.name = @"Toyota 1";
    car1.description = @"tkdjkfjd";
    car1.price = 2000;
    
    Car *car2 = [Car new];
    car2.name = @"Toyota 2";
    car2.description = @"tkdjkfjd";
    car2.price = 2000;
    
    Car *car3 = [Car new];
    car3.name = @"Toyota 3";
    car3.description = @"tkdjkfjd";
    car3.price = 2000;
    
    Car *car4 = [Car new];
    car4.name = @"Toyota 4";
    car4.description = @"tkdjkfjd";
    car4.price = 2000;
    
    Car *car5 = [Car new];
    car5.name = @"Toyota 5";
    car5.description = @"tkdjkfjd";
    car5.price = 2000;
    
    Car *car6 = [Car new];
    car6.name = @"Toyota 6";
    car6.description = @"tkdjkfjd";
    car6.price = 2000;
    
    Car *car7 = [Car new];
    car7.name = @"Toyota 7";
    car7.description = @"tkdjkfjd";
    car7.price = 2000;
    
    return [NSArray arrayWithObjects:car1, car2, car3, car4, car5, car6, car7, nil];
}

+ (NSArray *)expensiveCars
{
    Car *car1 = [Car new];
    car1.name = @"Ferrari 1";
    car1.description = @"tkdjkfjd";
    car1.price = 200000;
    
    Car *car2 = [Car new];
    car2.name = @"Ferrari 2";
    car2.description = @"tkdjkfjd";
    car2.price = 200000;
    
    Car *car3 = [Car new];
    car3.name = @"Ferrari 3";
    car3.description = @"tkdjkfjd";
    car3.price = 200000;
    
    Car *car4 = [Car new];
    car4.name = @"Ferrari 4";
    car4.description = @"tkdjkfjd";
    car4.price = 200000;
    
    Car *car5 = [Car new];
    car5.name = @"Ferrari 5";
    car5.description = @"tkdjkfjd";
    car5.price = 200000;
    
    Car *car6 = [Car new];
    car6.name = @"Ferrari 6";
    car6.description = @"tkdjkfjd";
    car6.price = 200000;
    
    Car *car7 = [Car new];
    car7.name = @"Ferrari 7";
    car7.description = @"tkdjkfjd";
    car7.price = 200000;
    
    return [NSArray arrayWithObjects:car1, car2, car3, car4, car5, car6, car7, nil];
}

@end
