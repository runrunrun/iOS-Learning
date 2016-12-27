//
//  Fruit.m
//  AdaptiveCell
//
//  Created by Hari Kunwar on 11/6/14.
//  Copyright (c) 2014 Hari Kunwar. All rights reserved.
//

#import "Fruit.h"

@implementation Fruit

+ (Fruit *)fruitWithName:(NSString *)name image:(NSString *)image
{
    Fruit *fruit = [Fruit new];
    
    fruit.name = name;
    fruit.image = image;
    
    return fruit;
}


+ (NSArray *)fruitsCollection
{
    Fruit *apple = [Fruit fruitWithName:@"An apple is the pomaceous fruit of the apple tree, Malus domestica of the rose family (Rosaceae). It is one of the most widely cultivated tree fruits, and the most widely known of the many members of genus Malus that are used by humans. Apples grow on deciduous trees which are large if grown from seed, but small if grafted onto roots (rootstock). The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today. Apples have been grown for thousands of years in Asia and Europe, and were brought to North America by European colonists. Apples have been present in the mythology and religions of many cultures, including Norse, Greek and European Christian traditions. In 2010, the fruit's genome was decoded as part of research on disease control and selective breeding in apple production." image:@"apple"];
    
    Fruit *mango = [Fruit fruitWithName:@"Mango" image:@"mango"];
    Fruit *orange = [Fruit fruitWithName:@"The orange (specifically, the sweet orange) is the fruit of the citrus species Citrus × sinensis in the family Rutaceae.[2] The fruit of the Citrus sinensis is considered a sweet orange, whereas the fruit of the Citrus aurantium is considered a bitter orange. " image:@"orange"];
    Fruit *grape = [Fruit fruitWithName:@"Grape" image:@"grapes"];
    Fruit *banana = [Fruit fruitWithName:@"Banana" image:@"banana"];

    NSArray *fruits = @[apple, mango, orange, grape, banana];
    
    return fruits;
}


@end
