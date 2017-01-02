//
//  DetailViewController.swift
//  3DTouchPeek
//
//  Created by Hari Kunwar on 12/15/15.
//  Copyright © 2015 Learning. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    var detailText: String? {
        didSet {
            self.configureView()
        }
    }
    
    func configureView() {
        if let detail = self.detailText {
            if let label = self.titleLabel {
                label.text = detail
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
}
