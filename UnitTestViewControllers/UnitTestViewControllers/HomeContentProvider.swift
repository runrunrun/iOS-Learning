//
//  HomeContentProvider.swift
//  UnitTestViewControllers
//
//  Created by Hari Kunwar on 2/4/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit

class HomeContentProvider: NSObject {
    weak var tableView: UITableView?
    var cellIdentifier = ""
    var numberOfSections = 1
    var numberOfRows = 10
    
    init(tableView: UITableView) {
        super.init()
        self.tableView = tableView
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
    }
}

extension HomeContentProvider: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        return cell
    }
}

extension HomeContentProvider: UITableViewDelegate {
    
}
