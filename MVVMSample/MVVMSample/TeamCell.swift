//
//  TeamCell.swift
//  MVVMSample
//
//  Created by Hari Kunwar on 5/16/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

class TeamCell: UITableViewCell {
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var teamNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setup(vm: TeamViewModel) {
        rankLabel.text =  "\(vm.team.rank)"
        teamNameLabel.text = vm.team.name
    }

}
