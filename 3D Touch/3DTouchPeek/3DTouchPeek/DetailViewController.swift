//
//  DetailViewController.swift
//  3DTouchPeek
//
//  Created by Hari Kunwar on 12/15/15.
//  Copyright © 2015 Learning. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    var detailText: String? {
        didSet {
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = detailText
    }
    
}
