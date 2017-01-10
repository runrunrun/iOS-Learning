//
//  TeamCell.swift
//  MessageExtensionSample
//
//  Created by Hari Kunwar on 1/10/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

class TeamCell: UITableViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
