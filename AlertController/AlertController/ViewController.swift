//
//  ViewController.swift
//  AlertController
//
//  Created by Hari Kunwar on 11/11/14.
//  Copyright (c) 2014 Hari Kunwar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var alertButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func alertButtonPressed(_ sender: UIButton) {
//        let alertController = actionSheet(with: "Activities", sourceRect: sender.frame)
        let alertController = alert(with: "Activities", message: "Do something.")
        
        // Create alert actions.
        let eat = UIAlertAction(title: "Eat food", style: UIAlertActionStyle.default) { (action) in
            print(action.title ?? "")
        }

        let run = UIAlertAction(title: "Go for a run", style: UIAlertActionStyle.default) { (action) in
            print(action.title ?? "")
        }

        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (action) in
            print(action.title ?? "")
        }
        
        // Add alert actions to alertController
        alertController.addAction(eat)
        alertController.addAction(run)
        alertController.addAction(cancel)

        // Present alertController
        self.present(alertController, animated: true, completion: nil)
    }

    func actionSheet(with title: String, message: String = "", sourceRect: CGRect) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        // iPad popover
        alertController.popoverPresentationController?.sourceView = self.view;
        alertController.popoverPresentationController?.sourceRect = sourceRect;
        
        return alertController
    }
    
    func alert(with title: String, message: String = "") -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        return alertController
    }
}

