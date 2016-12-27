//
//  WaterFallLayout.m
//  StaggeredGrid
//
//  Created by Hari Kunwar on 5/9/14.
//  Copyright (c) 2014 Hari Kunwar. All rights reserved.
//

#import "WaterFallLayout.h"

@interface WaterFallLayout()
{
    id<WaterFallLayoutDelegate> __weak _delegate;
}

@end

@implementation WaterFallLayout

-(void)prepareLayout
{
    [super prepareLayout];
    
    _delegate = (id <WaterFallLayoutDelegate> )self.collectionView.delegate;

    CGSize size = self.collectionView.frame.size;
//    _cellCount = [[self collectionView] numberOfItemsInSection:0];
//    _center = CGPointMake(size.width / 2.0, size.height / 2.0);
//    _radius = MIN(size.width, size.height) / 2.5;
}

-(CGSize)collectionViewContentSize
{
    if  ([_delegate respondsToSelector:@selector(collectionView:cellForItemAtIndexPath:)]) {
        [_delegate collectionView:self.collectionView layout:self minimumInteritemSpacingForSectionAtIndex:<#(NSInteger)#>]
    }
    
    
    return [self collectionView].frame.size;
}

#pragma mark - UICollectionViewLayout (SubclassingHooks)

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)path
{
    UICollectionViewLayoutAttributes* attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:path];
    attributes.size = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
    attributes.center = CGPointMake(_center.x + _radius * cosf(2 * path.item * M_PI / _cellCount),
                                    _center.y + _radius * sinf(2 * path.item * M_PI / _cellCount));
    return attributes;
}

-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray* attributes = [NSMutableArray array];
    for (NSInteger i=0 ; i < self.cellCount; i++) {
        NSIndexPath* indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    return attributes;
}

- (CGFloat)heightForSection:(NSInteger)section
{
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:section];
    CGFloat height = 0;
    CGFloat spacing = [_delegate collectionView:self.collectionView layout:self minimumInteritemSpacingForSectionAtIndex:section];
    CGFloat collectionViewWidth = CGRectGetWidth(self.collectionView.bounds);
    
    //Calculate approximate collection view height by adding tallest items in each row.
    for (NSInteger i = 0; i < itemCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:section];
        CGSize size = [_delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
        if (size.width + spacing > CGRectGetWidth(self.collectionView.bounds)) {
            height = size.height;
        }
        else {
        
        }
        
        CGFloat itemsWidth = 0;
        while (itemsWidth < collectionViewWidth) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:section];
            CGSize size = [_delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
            itemsWidth = itemsWidth + size.width + spacing;
        }
    }
}

@end
