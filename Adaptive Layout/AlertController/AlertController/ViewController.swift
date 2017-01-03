//
//  ViewController.swift
//  AlertController
//
//  Created by Hari Kunwar on 11/11/14.
//  Copyright (c) 2014 Hari Kunwar. All rights reserved.
//

import UIKit

// We can show ActionSheet and Alert using UIAlertController
// ActionSheet will present as popover in iPad automatically.

class ViewController: UIViewController {

    @IBOutlet weak var alertButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func alertButtonPressed(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Alert Title here", message: "Alert message here.", preferredStyle: UIAlertControllerStyle.alert)

        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action: UIAlertAction!) -> Void in
            print("You tapped OK")
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func actionSheetButtonPressed(_ sender: UIButton) {
        let alertController = UIAlertController(title: "ActionSheet title here.", message: "ActionSheet message here.", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action: UIAlertAction!) -> Void in
            print("You tapped OK")
        }))
        
        //for iPad
        alertController.popoverPresentationController?.sourceView = self.view;
        alertController.popoverPresentationController?.sourceRect = sender.frame;
        self.present(alertController, animated: true, completion: nil)
    }

}

