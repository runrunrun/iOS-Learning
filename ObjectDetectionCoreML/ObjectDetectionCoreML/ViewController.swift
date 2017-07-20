//
//  ViewController.swift
//  ObjectDetectionCoreML
//
//  Created by Hari Kunwar on 7/20/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var objectLabel: UILabel!
    var model: Inceptionv3?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model = Inceptionv3()
    }
    
}

extension ViewController {
    
    @IBAction func cameraButtonPressed(_ sender: Any) {
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            return
        }
        
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.sourceType = .camera
        cameraPicker.allowsEditing = false
        
        present(cameraPicker, animated: true)
    }
    
    @IBAction func imageLibraryButtonPressed(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.allowsEditing = false
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
}

extension ViewController: UIImagePickerControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        picker.dismiss(animated: true)
        objectLabel.text = "Analyzing Image..."
        
        // Retrieve selected image from info dictionary.
        guard let image = info["UIImagePickerControllerOriginalImage"] as? UIImage else {
            return
        }
        
        // Show image.
        imageView.image = image
        
        // Predict image.
        if let pixelBuffer = image.pixelBuffer() {
            do {
                if let prediction = try model?.prediction(image: pixelBuffer) {
                    objectLabel.text = "This is a \(prediction.classLabel)"
                }
            } catch let error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
}


