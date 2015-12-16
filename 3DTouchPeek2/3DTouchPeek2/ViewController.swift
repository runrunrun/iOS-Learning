//
//  ViewController.swift
//  3DTouchPeek2
//
//  Created by Hari Kunwar on 12/15/15.
//  Copyright © 2015 Learning. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerPreviewingDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if #available(iOS 9, *) {
            if(traitCollection.forceTouchCapability == .Available) {
                registerForPreviewingWithDelegate(self, sourceView: self.view)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: UIViewControllerPreviewingDelegate
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        if imageView.frame.contains(location) {
            guard let controller = storyboard?.instantiateViewControllerWithIdentifier("photoViewController") as? PhotoViewController else { return nil }
        
            controller.preferredContentSize = CGSize(width: 0.0, height: 300)
            
            if #available(iOS 9, *) {
                previewingContext.sourceRect = self.imageView.frame
            }
            return controller
        }
        
        return nil
    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        
        showViewController(viewControllerToCommit, sender: self)
        
    }


}

