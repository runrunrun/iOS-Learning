//
//  PhotoViewController.swift
//  3DTouchPeek2
//
//  Created by Hari Kunwar on 12/15/15.
//  Copyright © 2015 Learning. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @available(iOS 9.0, *)
    override var previewActionItems : [UIPreviewActionItem] {
        
        let likeAction = UIPreviewAction(title: "Like", style: .default) { (action, viewController) -> Void in
            print("You liked the photo")
        }
        
        let deleteAction = UIPreviewAction(title: "Delete", style: .destructive) { (action, viewController) -> Void in
            print("You deleted the photo")
        }
        
        return [likeAction, deleteAction]
        
    }
}
