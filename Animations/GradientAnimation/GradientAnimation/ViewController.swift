//
//  ViewController.swift
//  GradientAnimation
//
//  Created by Hari Kunwar on 2/11/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

/**
 CAGradientLayer offers you four animatable properties along with the ones inherited from CALayer:
 • colors: Animate the gradient’s colors to give it a tint.
 • locations: Animate the color milestone locations to make the colors move
 around inside the gradient.
 • startPoint and endPoint: Animate the extents of the layout of the gradient.
 */

class ViewController: UIViewController {
    @IBOutlet weak var gradientView: UIView!
    let gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.colors = [UIColor.black.cgColor, UIColor.white.cgColor, UIColor.black.cgColor]
        //Location specifies each color locations
        gradientLayer.locations = [0.15, 0.5, 0.85]
        let bounds = gradientView.bounds
        // Have larger gradientLayer size to maximize the effect.
        gradientLayer.frame = bounds//CGRect(x: -bounds.width, y: bounds.origin.y, width: 3*bounds.width, height: bounds.size.height)
        gradientView.layer.addSublayer(gradientLayer)
        
        // Create Text Mask
        // Create text attributes.
        let textAttributes: [String: AnyObject] = {
            let style = NSMutableParagraphStyle()
            style.alignment = .center
            return [
                NSFontAttributeName: UIFont(
                    name: "HelveticaNeue-Thin",
                    size: 28.0)!,
                NSParagraphStyleAttributeName: style
            ]
        }()
        
        // Create image from text.
        let text = "Today is best day of my Life."
        let image = UIGraphicsImageRenderer(size: bounds.size)
            .image {
                _ in
                text.draw(in: bounds, withAttributes: textAttributes)
        }
        
        // Create mask from text image
        let maskLayer = CALayer()
        maskLayer.backgroundColor = UIColor.clear.cgColor
        //A rectangle that is the same size as the source, but with its origin offset by dx units along the x-axis and dy units along the y-axis with respect to the source. Returns a null rectangle if rect is a null rectangle.
        maskLayer.frame = bounds//bounds.offsetBy(dx: bounds.size.width, dy: 0)
        maskLayer.contents = image.cgImage
        
        // Add mask to gradient
        gradientLayer.mask = maskLayer
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Add gradient animation
        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        //Location specifies each color locations
        gradientAnimation.fromValue = [0.0, 0.10, 0.20]
        gradientAnimation.toValue = [0.80, 0.90, 1.0]
        gradientAnimation.duration = 3.0
        gradientAnimation.repeatCount = Float.infinity
        gradientLayer.add(gradientAnimation, forKey: "gradientAnimation")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

