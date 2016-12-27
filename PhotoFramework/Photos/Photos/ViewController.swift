//
//  ViewController.swift
//  Photos
//
//  Created by Hari Kunwar on 4/20/15.
//  Copyright (c) 2015 learning. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    private let cellIdentifier = "photoCell"
    private let sectionHeaderIdentifier = "photosSectionHeader"
    private var albums: [PHFetchResult] = []
    private var albumsCollection: PHFetchResult = PHAssetCollection.fetchAssetCollectionsWithType(PHAssetCollectionType.Moment, subtype: PHAssetCollectionSubtype.AlbumRegular, options: nil)
    private let imageManager: PHCachingImageManager = PHCachingImageManager()
    private var cellSize = CGSizeZero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let flowLayout = collectionView.collectionViewLayout as UICollectionViewFlowLayout
        cellSize = flowLayout.itemSize
        
        if (PHPhotoLibrary.authorizationStatus() != PHAuthorizationStatus.Authorized) {
            println("Need photo access")
        }
        
        //http://stackoverflow.com/questions/25981374/ios-8-photos-framework-get-a-list-of-all-albums-with-ios8
        //https://developer.apple.com/library/ios/documentation/Photos/Reference/PHFetchOptions_Class/index.html#//apple_ref/occ/instp/PHFetchOptions/sortDescriptors
        
        let fetchOption = PHFetchOptions()
        fetchOption.sortDescriptors = [NSSortDescriptor(key:"startDate", ascending: false)]
        albumsCollection = PHAssetCollection.fetchAssetCollectionsWithType(PHAssetCollectionType.Moment, subtype: PHAssetCollectionSubtype.AlbumRegular, options: fetchOption)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return albumsCollection.count
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var numberOfItems = 0
        var album: PHAssetCollection = albumsCollection[section] as PHAssetCollection
     
        let albumPhotos = PHAsset.fetchAssetsInAssetCollection(album, options: nil)
        
        //Add album to albums
        albums.append(albumPhotos)
        
        numberOfItems = albumPhotos.count
        
        return numberOfItems;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: PhotoCell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as PhotoCell
        
        let currentTag = cell.tag + 1
        cell.tag = currentTag
        
        let albumPhotos = albums[indexPath.section]
        let photo = albumPhotos[indexPath.row] as PHAsset
        
        imageManager.requestImageForAsset(photo, targetSize: cellSize, contentMode: PHImageContentMode.AspectFill, options: nil) { (image, info) -> Void in
            if (cell.tag == currentTag) {
                cell.imageView.image = image
            }
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        var collectionReusableView: PhotosSectionHeaderView? = nil
        if (kind == UICollectionElementKindSectionHeader) {
            collectionReusableView = (collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: sectionHeaderIdentifier, forIndexPath: indexPath) as PhotosSectionHeaderView)
            
            var collection: PHCollection = albumsCollection[indexPath.section] as PHCollection
            if(collection.isKindOfClass(PHAssetCollection)) {
                let assetCollection = collection as PHAssetCollection
                var location: String? = ""
                if (assetCollection.localizedLocationNames != nil) {
                    for locationName in assetCollection.localizedLocationNames as [String] {
                        location = location! + " " +  locationName
                    }
                    collectionReusableView?.titleLabel.text = location
                }
            }

        }
        
        return collectionReusableView!
    }


}

