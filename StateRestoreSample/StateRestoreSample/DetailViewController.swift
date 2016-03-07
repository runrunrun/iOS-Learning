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
    let modelEncodeKey = "phunModelKey"
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }
    
    override func viewWillAppear(animated: Bool) {
        if let modelInstance = self.model {
            if let dateString = modelInstance.date {
                self.dateLabel.text = NSDate.standardDateString(dateString)
            }
            
            self.titleLabel.text = modelInstance.title
            self.descriptionLabel.text = modelInstance.summary
            if let url = NSURL(string: modelInstance.imageUrl!) {
                self.imageView.setImageWithUrl(url)
            }
        }
    }
    
    override func encodeRestorableStateWithCoder(coder: NSCoder) {
        // Encode model title
        coder.encodeObject(self.model?.title, forKey: modelEncodeKey)
        super.encodeRestorableStateWithCoder(coder)
    }
    
    override func decodeRestorableStateWithCoder(coder: NSCoder) {
        // Decode model title and use it to restore model instance
        if let title = coder.decodeObjectForKey(modelEncodeKey) as? String {
            self.model = PhunModel.fetchModel(title)
        }
        super.decodeRestorableStateWithCoder(coder)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionButtonPressed(sender: AnyObject) {
        if let modelInstance = self.model {
            let string: String = modelInstance.title!
            
            guard let url = NSURL(string: modelInstance.imageUrl!) else {
                return
            }
            
            let activityViewController = UIActivityViewController(activityItems: [string, url], applicationActivities: nil)
            navigationController?.presentViewController(activityViewController, animated: true) {
                // ...
            }
        }
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
