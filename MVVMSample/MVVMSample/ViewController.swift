//
//  ViewController.swift
//  MVVMSample
//
//  Created by Hari Kunwar on 5/16/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var data = [CellRepresentable]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = [TeamViewModel(team: Team(name: "Chelsea", rank: 1)),
                TeamViewModel(team: Team(name: "Tottenham", rank: 2)),
                TeamViewModel(team: Team(name: "Liverpool", rank: 3)),
                TeamViewModel(team: Team(name: "Man City", rank: 4)),
                TeamViewModel(team: Team(name: "Arsenal", rank: 5)),
                TeamViewModel(team: Team(name: "Man United", rank: 6)),
                TeamViewModel(team: Team(name: "Everton", rank: 7)),
                TeamViewModel(team: Team(name: "West Brom", rank: 8))]
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return data[indexPath.row].cellInstance(tableView, indexPath: indexPath)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return data[indexPath.row].rowHeight
    }
}
