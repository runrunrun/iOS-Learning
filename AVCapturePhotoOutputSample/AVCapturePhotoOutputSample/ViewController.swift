//
//  ViewController.swift
//  AVCapturePhotoOutputSample
//
//  Created by Hari Kunwar on 1/9/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

/**
 AVCapturePhotoOutput is a concrete subclass of AVCaptureOutput that supersedes
 AVCaptureStillImageOutput as the preferred interface for capturing photos. In addition to capturing 
 all flavors of still image supported by AVCaptureStillImageOutput, it supports Live Photo capture, 
 preview-sized image delivery, wide color, RAW, RAW+JPG and RAW+DNG formats.
 
 
 */

class ViewController: UIViewController {

    let cameraOutput = AVCapturePhotoOutput()
    var captureSesssion: AVCaptureSession!
    @IBOutlet weak var capturePreview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        captureSesssion = AVCaptureSession()
        captureSesssion.sessionPreset = AVCaptureSessionPreset1920x1080
        
        
        let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        do {
            let input = try AVCaptureDeviceInput(device: device)
            if (captureSesssion.canAddInput(input)) {
                captureSesssion.addInput(input)
                if (captureSesssion.canAddOutput(cameraOutput)) {
                    captureSesssion.addOutput(cameraOutput)
                    captureSesssion.startRunning()
                    
                    // Show captured photos.
                    let captureVideoLayer: AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer.init(session: captureSesssion)
                    captureVideoLayer.frame = capturePreview.bounds
                    captureVideoLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
                    capturePreview.layer.addSublayer(captureVideoLayer)
                }
            }
        }
        catch {
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func captureButtonPressed(_ sender: Any) {
        let setting = AVCapturePhotoSettings()
        setting.flashMode = .auto
        setting.isAutoStillImageStabilizationEnabled = true
        setting.isHighResolutionPhotoEnabled = false
        cameraOutput.capturePhoto(with: setting, delegate: self)
    }
    

}

extension ViewController: AVCapturePhotoCaptureDelegate {
    
    func capture(_ captureOutput: AVCapturePhotoOutput,
                 didFinishProcessingPhotoSampleBuffer photoSampleBuffer: CMSampleBuffer?,
                 previewPhotoSampleBuffer: CMSampleBuffer?,
                 resolvedSettings: AVCaptureResolvedPhotoSettings,
                 bracketSettings: AVCaptureBracketedStillImageSettings?, error: Error?) {
        
        if let photoSampleBuffer = photoSampleBuffer {
            let photoData = AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: photoSampleBuffer, previewPhotoSampleBuffer: previewPhotoSampleBuffer)
            let image = UIImage(data: photoData!)
            UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
        }
        
    }
}

