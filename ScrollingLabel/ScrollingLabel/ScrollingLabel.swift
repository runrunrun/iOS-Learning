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
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if context == &textColorContext {
            
        }
    }
    
    // MARK: - Public functions
    
    /**
     Start text scroll animation.
     - parameter animate: Whether to animate.
     */
    public func animateText(animate: Bool) {
        self.animateText(animate: animate, duration: 10.0, repeated: false)
    }

    /**
     Start text scroll animation.
     - parameter animate: Whether to animate.
     - parameter duration: Animation duration.
     - parameter repeated: Whether scroll animation is repeated indefinitely.
     */
    public func animateText(animate: Bool, duration: Double, repeated: Bool) {
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
            let x = self.frame.size.width - size.width
            
            
            var animationOptions: UIViewAnimationOptions = [.autoreverse, .curveEaseInOut]
            
            if repeated {
                animationOptions.insert(.repeat)
            }
            
            // Get animation options.
            UIView.animate(withDuration: duration, delay: 0.0,
                                       options: animationOptions, animations: {
                                        self.label.frame.origin.x = x
                }, completion: { (complete) in
                    self.label.frame.origin.x = 0
            })
            
//            // Start animation with key frames.
//            UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: animationOptions , animations: {
//                
//                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.2, animations: {
//                    self.label.frame.origin.x = x
//                })
//                UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.2, animations: {
//                    // Pausing animation
//                })
//                
//                UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.2, animations: {
//                    self.label.frame.origin.x = 0.0
//                })
//                
//                UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.2, animations: {
//                    // Pausing animation
//                })
//                
//                }, completion: { (complete) in
//            })
        }
    }
    
    // MARK: - Private functions
    
    private func setup() {
        self.numberOfLines = 1
        self.clipsToBounds = true
        self.addSubview(label)
        
        // Observer text color changes
        self.addObserver(self, forKeyPath: "textColor", options: [.new], context: &textColorContext)
    }
    
    private func copyLabelProperties(fromLabel: UILabel, toLabel: UILabel) {
        // UILabel properties
        toLabel.text = fromLabel.text
        toLabel.textColor = fromLabel.textColor
        toLabel.font = fromLabel.font
        toLabel.shadowColor = fromLabel.shadowColor
        toLabel.shadowOffset = fromLabel.shadowOffset
        toLabel.textAlignment = fromLabel.textAlignment
        toLabel.attributedText = fromLabel.attributedText
        
        // UIView properties 
        toLabel.backgroundColor = fromLabel.backgroundColor
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
}
