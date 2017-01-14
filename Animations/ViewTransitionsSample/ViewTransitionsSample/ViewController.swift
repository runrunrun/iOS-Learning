//
//  ViewController.swift
//  ViewTransitionsSample
//
//  Created by Hari Kunwar on 1/14/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var view1 = UIView()
    var view2 = UIView()
    @IBOutlet weak var containerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view1.backgroundColor = UIColor.green
        view1.frame = containerView.bounds

        view2.backgroundColor = UIColor.red
        view2.frame = containerView.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Add view1 with transition
        addViewWithTranstion()
        
        // Remove view1 with transition
        var delay = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: delay) {
            self.removeViewWithTranstion()
        }
        
        // Add view1 back with transition
        delay = delay + 2
        DispatchQueue.main.asyncAfter(deadline: delay) {
            self.addViewWithTranstion()
        }
    
        // Hide view1 with transition
        delay = delay + 2
        DispatchQueue.main.asyncAfter(deadline: delay) {
            self.hideViewWithTranstion()
        }
        
        // Show view1 with transition
        delay = delay + 2
        DispatchQueue.main.asyncAfter(deadline: delay) {
            self.replaceViewWithTranstion()
        }
    }
    
    
    private func addViewWithTranstion() {
        // Add new view1 with transition
        UIView.transition(with: containerView, duration: 0.5, options: [.curveEaseOut, .transitionFlipFromTop], animations: {
            self.containerView.addSubview(self.view1)
        }, completion: { (done) in
        })
    }

    private func removeViewWithTranstion() {
        UIView.transition(with: self.containerView, duration: 0.5, options: [.curveEaseOut, .transitionFlipFromBottom], animations: {
            self.view1.removeFromSuperview()
        }, completion: { (done) in
        })
    }
    
    private func hideViewWithTranstion() {
        UIView.transition(with: self.containerView, duration: 0.5, options: [.curveEaseOut, .transitionCrossDissolve], animations: {
            self.view1.isHidden = true
        }, completion: { (done) in
            self.view1.isHidden = false
        })
    }
    
    private func replaceViewWithTranstion() {
        UIView.transition(from: view1, to: view2, duration: 0.5, options: [.transitionFlipFromLeft], completion: nil)
    }
}

