//
//  ViewController.swift
//  PathAnimation
//
//  Created by Hari Kunwar on 2/14/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let ovalShape = CAShapeLayer()
        ovalShape.strokeColor = UIColor.red.cgColor
        ovalShape.fillColor = UIColor.clear.cgColor
        ovalShape.lineWidth = 4.0
        ovalShape.lineDashPattern = [2, 3]
        
        let refreshRadius = view.bounds.height/2 * 0.3
        
        ovalShape.path = UIBezierPath(ovalIn: CGRect(x: view.bounds.size.width/2 - refreshRadius,
                                                     y: view.bounds.size.height/2 - refreshRadius,
                                                     width: 2*refreshRadius,
                                                     height: 2*refreshRadius)).cgPath
        view.layer.addSublayer(ovalShape)
        
        ovalShape.strokeEnd = 0.25
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

