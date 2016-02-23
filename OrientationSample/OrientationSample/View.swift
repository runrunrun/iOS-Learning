//
//  View.swift
//  OrientationSample
//
//  Created by Hari Kunwar on 2/23/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit

class View: UIView {

    /*
    layoutSubviews is called on orientation change. Should make changes based on frame updates.
    */
    override func layoutSubviews() {
        print("LayoutSubview called")
    }

}
