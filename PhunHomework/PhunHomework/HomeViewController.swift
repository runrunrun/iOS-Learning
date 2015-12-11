//
//  HomeViewController.swift
//  PhunApp
//
//  Created by Hari Kunwar on 11/24/15.
//  Copyright (c) 2015 learning. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let cellHeight = CGFloat(200)
    var models: [PhunModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Fetch feed content and create model instances
        let url = "https://dl.dropboxusercontent.com/u/733674/PhunwareHomework/feed.json?dl=1"
        
        WebServiceManager.fetchDataFromUrl(url) { (dataArray, error) -> Void in
            
            for object in dataArray {
                guard let dict = object as? [String: String] else {
                    print("Not a dictionary")
                    return
                }
                let model = PhunModel.modelWithDictionary(dict)
                self.models.append(model)
            }
                self.collectionView.reloadData()
        }
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        // Invalidate layout to recalculate cell size
        self.collectionView.collectionViewLayout.invalidateLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.models.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("homeCell", forIndexPath: indexPath) as! HomeCell
        let model = self.models[indexPath.row]
        if let dateString = model.date {
            cell.dateLabel.text = NSDate.formatDateString(dateString)
        }
        
        cell.titleLabel.text = model.title
        cell.locationLabel.text = model.location1
        cell.summaryLabel.text = model.summary
        if let url = NSURL(string: model.imageUrl!) {
            cell.imageView.setImageWithUrl(url)
        }
        
        return cell
    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }

    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        // Caculate collection cell sizes based on size class
        var width = collectionView.frame.width
        if self.view.respondsToSelector("traitCollection") {
            if self.view.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.Regular {
                width = width/2 - 1
            }
        }
        
        return CGSizeMake(width, self.cellHeight)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1
    }

    
    // MARK: - UIContentContainer
    
    // Detect screen size changes. e.g screen orientation changes
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        self.collectionView.performBatchUpdates({ () -> Void in
            }, completion: { (complete) -> Void in
        })
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let cell = sender as! UICollectionViewCell
        let indexPath = self.collectionView!.indexPathForCell(cell)
        
        let detailViewController =  segue.destinationViewController as! DetailViewController
        if let row = indexPath?.row {
            detailViewController.model = self.models[row]
        }
    }


}
