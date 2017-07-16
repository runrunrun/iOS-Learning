//
//  ViewController.swift
//  KVO-iOS11
//
//  Created by Hari Kunwar on 7/16/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var team: Team?
    var observer: NSKeyValueObservation?
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var teamNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        team = Team(name: "Manchester United", city: "Manchester", league: "EPL", ranking: 5)
        teamNameLabel.text = team?.name
        
        // Initial rank
        rankLabel.text = "Rank \(team.ranking)"
        
        
        observer = team?.observe(\Team.ranking, changeHandler: { [weak self] (instance, change) in
            self?.rankLabel.text = "Rank \(instance.ranking.description)"
        })
    }
    
}

// MARK: IBActions
extension ViewController {
    @IBAction func incrementButtonPressed(_ sender: Any) {
        if let rank = team?.ranking {
            team?.ranking = rank + 1
        }
    }
    
    @IBAction func decrementButtonPressed(_ sender: Any) {
        if let rank = team?.ranking, rank > 1 {
            team?.ranking = rank - 1
        }
    }
}

