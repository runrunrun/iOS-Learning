//
//  MasterViewController.swift
//  3DTouchPeek
//
//  Created by Hari Kunwar on 12/15/15.
//  Copyright © 2015 Learning. All rights reserved.
//

import UIKit

// Peek and Pop effect is setup in storyboard. 

class MasterViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let names = ["life", "love", "death", "birth", "age"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.names[indexPath.row]
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailText = self.names[indexPath.row]
            }
        }
        else if let cell = sender as? UITableViewCell, segue.identifier == "showDetailPeek" {
            let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
            if let indexPath = self.tableView.indexPath(for: cell) {
                controller.detailText = self.names[indexPath.row]
            }
        }
    }
}
