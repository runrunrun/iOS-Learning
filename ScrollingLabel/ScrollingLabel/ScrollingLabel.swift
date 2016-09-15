//
//  ScrollingLabel.swift
//  ScrollingLabel
//
//  Created by Hari Kunwar on 9/13/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit

private var textColorContext = 0

class ScrollingLabel: UILabel {
    
    private var label = UILabel()
    private var animating = false
    private var gradient: CAGradientLayer?

    public var isAnimating: Bool {
        set {}
        get {
            return animating
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override var textColor: UIColor! {
        didSet {
            // Prevent assigning clear text color
            if textColor != UIColor.clear {
                label.textColor = textColor
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let gl = gradient {
            gl.frame = self.bounds
            self.layer.mask = gl
        }
    }
    
    // MARK: - Public functions

    /**
     Start text scroll animation.
     Label properties should not be updated during animation.
     - parameter animate: Whether to animate.
     - parameter duration: Animation duration.
     */
    public func animateText(animate: Bool, duration: Double) {
        self.animateText(animate: animate, duration: duration, repeated: false)
    }
    
    /**
     Start text scroll animation.
     Label properties should not be updated during animation.
     - parameter animate: Whether to animate.
     - parameter duration: Animation duration.
     - parameter repeated: Whether scroll animation is repeated indefinitely.
     */
    public func animateText(animate: Bool, duration: Double = 10.0, repeated: Bool = false) {
        if animate {
            // Copy main label properties
            self.copyLabelProperties(fromLabel: self, toLabel: label)
            
            // Hide main label text
            textColor = UIColor.clear
            
            // Hide parent label text
            self.bringSubview(toFront: label)
            
            if let text = text {
                label.text = text
                
                // Get animation x positions.
                let size = (text as NSString).size(attributes: [NSFontAttributeName : self.font])
                self.label.frame = CGRect.init(x: 0, y: 0, width: size.width, height: self.frame.size.height)
                let x = self.frame.size.width - self.label.bounds.size.width
                
                // Set animation options
                var animationOptions: UIViewAnimationOptions = [.autoreverse, .curveEaseInOut]
                
                // Repeate animation.
                if repeated {
                    animationOptions.insert(.repeat)
                }
                
                animating = true
                // Get animation options.
                UIView.animate(withDuration: duration, delay: 0.0,
                               options: animationOptions, animations: {
                                self.label.frame.origin.x = x - 10
                    }, completion: { (complete) in
                        if complete { // Animation complete
                            self.animating = false
                            self.label.frame.origin.x = 0
                            // Show main label
                            self.textColor = self.label.textColor
                            // Hide label text
                            self.label.text = ""
                        }
                        else {
                            // Animation cancelled
                        }
                        
                })
            }
        }
        else { // Stop animation
            if self.animating {
                self.label.layer.removeAllAnimations()
                UIView.animate(withDuration: duration, delay: 0.0,
                               options: [], animations: {
                                self.label.frame.origin.x = 0
                    }, completion: { (complete) in
                        self.animating = false
                        // Show main label text
                        self.textColor = self.label.textColor
                        // Hide label text
                        self.label.text = ""
                })
            }

        }
    }
    
    // MARK: - Private functions
    
    private func setup() {
        self.numberOfLines = 1
        self.clipsToBounds = true
        self.lineBreakMode = .byClipping  // Clip tail word
        gradient = labelGradient()
        self.addSubview(label)
    }
    
    private func copyLabelProperties(fromLabel: UILabel, toLabel: UILabel) {
        toLabel.text = fromLabel.text
        toLabel.textColor = fromLabel.textColor
        toLabel.font = fromLabel.font
        toLabel.shadowColor = fromLabel.shadowColor
        toLabel.shadowOffset = fromLabel.shadowOffset
        toLabel.textAlignment = fromLabel.textAlignment
        toLabel.attributedText = fromLabel.attributedText
        toLabel.backgroundColor = fromLabel.backgroundColor
    }
    
    private func labelGradient() -> CAGradientLayer {
        let gl = CAGradientLayer()
        gl.colors = [UIColor(white: 1.0, alpha: 1.0).cgColor, UIColor(white: 1.0, alpha: 0.0).cgColor]
        gl.startPoint = CGPoint(x: 0.6, y: 1.0)
        gl.endPoint = CGPoint(x: 1.0, y: 1.0)
        return gl
    }
}
