//
//  ViewController.swift
//  CollectionViewLayout
//
//  Created by Hari Kunwar on 1/1/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set the PinterestLayout delegate
        if let layout = collectionView?.collectionViewLayout as? CustomLayout {
            layout.delegate = self
        }
        
        collectionView!.backgroundColor = UIColor.clear
        collectionView!.contentInset = UIEdgeInsets(top: 23, left: 5, bottom: 10, right: 5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func randomInt(min: Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! ItemCell
        cell.titleLabel.text = "Cell number \(indexPath.row)"
        return cell
    }
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

}

extension ViewController: CustomLayoutDelegate {
    func collectionView(collectionView: UICollectionView, heightForItemAtIndexPath indexPath: IndexPath,
                        width: CGFloat) -> CGFloat {
        
        let height = self.randomInt(min: 40, max: 200)
        return CGFloat(height)
    }
}


