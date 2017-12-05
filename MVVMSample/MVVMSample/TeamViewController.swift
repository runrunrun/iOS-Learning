//
//  ViewController.swift
//  MVVMSample
//
//  Created by Hari Kunwar on 5/16/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

class TeamViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var data = [CellRepresentable]()
    
    lazy var viewModel: TeamViewModel = {
        return TeamViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.reloadTableViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        viewModel.initTeams()
    }
}

extension TeamViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.cellInstance(tableView, indexPath: indexPath)
    }
}

extension TeamViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.rowHeight()
    }
}
