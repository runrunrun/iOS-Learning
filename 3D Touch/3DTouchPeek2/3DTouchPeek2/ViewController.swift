//
//  ViewController.swift
//  3DTouchPeek2
//
//  Created by Hari Kunwar on 12/15/15.
//  Copyright © 2015 Learning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if #available(iOS 9, *) {
            if(traitCollection.forceTouchCapability == .available) {
                registerForPreviewing(with: self, sourceView: self.view)
            }
        }
    }
}

extension ViewController: UIViewControllerPreviewingDelegate {
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        if imageView.frame.contains(location) {
            guard let controller = storyboard?.instantiateViewController(withIdentifier: "photoViewController") as? PhotoViewController
                else {
                    return nil
            }
            
            controller.preferredContentSize = CGSize(width: 0.0, height: 300)
            
            if #available(iOS 9, *) {
                previewingContext.sourceRect = self.imageView.frame
            }
            return controller
        }
        
        return nil
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        show(viewControllerToCommit, sender: self)
    }
}

