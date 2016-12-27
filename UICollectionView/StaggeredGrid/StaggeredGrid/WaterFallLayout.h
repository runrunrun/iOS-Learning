//
//  WaterFallLayout.h
//  StaggeredGrid
//
//  Created by Hari Kunwar on 5/9/14.
//  Copyright (c) 2014 Hari Kunwar. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WaterFallLayoutDelegate <NSObject>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;

@end

@interface WaterFallLayout : UICollectionViewLayout



@end
