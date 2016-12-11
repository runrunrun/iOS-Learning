//
//  MarqueeView.swift
//  MarqueeView
//
//  Created by Hari Kunwar on 12/10/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit

/**
 Copy content view into copyView1 and copyView2.
 
 */

class RollingView: UIScrollView {

    var copyView1 = UIView()
    var copyView2 = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
    }
    
    
    
}
