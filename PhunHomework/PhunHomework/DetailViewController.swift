//
//  DetailViewController.swift
//  PhunApp
//
//  Created by Hari Kunwar on 11/24/15.
//  Copyright (c) 2015 learning. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var model: PhunModel?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let modelInstance = self.model {
            if let dateString = modelInstance.date {
                self.dateLabel.text = NSDate.formatDateString(dateString)
            }

            self.titleLabel.text = modelInstance.title
            self.descriptionLabel.text = modelInstance.summary
            if let url = NSURL(string: modelInstance.imageUrl!) {
                self.imageView.setImageWithUrl(url)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
