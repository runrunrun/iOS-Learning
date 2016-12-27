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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func alertButtonPressed(sender: UIButton) {
        let buttonTitle = sender.titleLabel?.text;
        var message = ""
        var alertController = UIAlertController(title: "hello", message: message, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
//        var alertController = UIAlertController(title: "hello", message: message, preferredStyle: UIAlertControllerStyle.Alert)

        
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (action: UIAlertAction!) -> Void in
            println("You tapped OK")
        }))
        
        //for iPad
        alertController.popoverPresentationController?.sourceView = self.view;
        alertController.popoverPresentationController?.sourceRect = sender.frame;
        self.presentViewController(alertController, animated: true, completion: nil)
    }

}

