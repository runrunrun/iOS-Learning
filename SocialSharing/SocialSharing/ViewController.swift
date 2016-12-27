//
//  ViewController.swift
//  SocialSharing
//
//  Created by Hari Kunwar on 3/2/15.
//  Copyright (c) 2015 learning. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cameraButtonPressed(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        }
        
        [self .presentViewController(imagePicker, animated: true, completion: nil)]
    }

    @IBAction func shareButtonPressed(sender: AnyObject) {
        let text = self.textView.text
        let image = self.imageView.image
        let activityItems: [AnyObject] = [image!, text]
        let activityController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        self.presentViewController(activityController, animated: true, completion: nil)
    }

    //Mark: UIImagePickerControllerDelegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imageView.image = image
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}


