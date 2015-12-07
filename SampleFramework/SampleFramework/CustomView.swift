//
//  CustomView.swift
//  SampleFramework
//
//  Created by Hari Kunwar on 12/7/15.
//  Copyright (c) 2015 learning. All rights reserved.
//

import UIKit

public class CustomView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    public func sampleTestCount() -> Int {
        return 10
    }

    public func sampleString() -> String {
        return "Hello from sample framework"
    }
}
