//
//  CustomLayout.swift
//  CollectionViewLayout
//
//  Created by Hari Kunwar on 1/1/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

protocol CustomLayoutDelegate {
    func collectionView(collectionView: UICollectionView, heightForItemAtIndexPath indexPath: IndexPath,
                        width: CGFloat) -> CGFloat
}

class CustomLayout: UICollectionViewLayout {

    var delegate: CustomLayoutDelegate!
    
    // Number of columns. Using fixed value.
    var numberOfColumns = 2
    var cellPadding: CGFloat = 6.0
    
    // Array to cache the calculated attributes.
    // When you call prepareLayout(), you’ll calculate the attributes for all items and add them to the cache.
    private var cache: [UICollectionViewLayoutAttributes] = []
    
    // Total content height.
    private var contentHeight: CGFloat = 0.0
    // Total content width
    private var contentWidth: CGFloat  {
        let insets = collectionView!.contentInset
        return collectionView!.bounds.width - (insets.left + insets.right)
    }
    
    override func prepare() {
        if cache.isEmpty {
            // This declares and fills the xOffset array with the x-coordinate for every column based on the column 
            //widths. The yOffset array tracks the y-position for every column. You initialize each value in yOffset to 
            // 0, since this is the offset of the first item in each column.
            let columnWidth = contentWidth / CGFloat(numberOfColumns)
            var xOffset = [CGFloat]()
            for column in 0 ..< numberOfColumns {
                xOffset.append(CGFloat(column) * columnWidth )
            }
            var column = 0
            var yOffset = [CGFloat](repeating: 0, count: numberOfColumns)
            
            // This loops through all the items in the first section, as this particular layout has only one section.
            for item in 0 ..< collectionView!.numberOfItems(inSection: 0) {
                // Get item indexPath
                let indexPath = IndexPath(item: item, section: 0)
                // Get item width
                let width = columnWidth - cellPadding * 2
                // Get item height
                let itemHeight = delegate.collectionView(collectionView: collectionView!,
                                                         heightForItemAtIndexPath: indexPath, width: width)
                // Calculate cell height with item height and top/bottom cell paddings.
                let height = cellPadding +  itemHeight + cellPadding
                // Calculate cell frame.
                let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: height)
                let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
                
                // Get attribute instance with frames.
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.frame = insetFrame
                cache.append(attributes)
                
                // Recalculate contentHeight.
                // If new cell frame.maxY is greater, use it as contentHeight.
                contentHeight = max(contentHeight, frame.maxY)
                yOffset[column] = yOffset[column] + height
                
                // Advance coloum so next item will be placed in next column.
                column = column >= (numberOfColumns - 1) ? 0 : column + 1
            }
        }
    }
    
    // Returns size of collection view content.
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    // Returns layoutAttributes for items in the given rect.
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                layoutAttributes.append(attributes)
            }
        }
        return layoutAttributes
    }
    
    
    
}
