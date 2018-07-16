//
//  ViewController.swift
//  Search
//
//  Created by Hari Kunwar on 7/16/18.
//  Copyright © 2018 Learning. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let allStudents = ["Jon", "Ron", "Tom", "Jim", "Jerry", "Brad"]
    var searchedStudents = [String]()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar
            .rx.text
            .orEmpty
            .subscribe(onNext: { [unowned self] (query) in
            self.searchedStudents = self.allStudents.filter({ $0.hasPrefix(query)})
            self.tableView.reloadData()
        }).disposed(by: disposeBag)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = searchedStudents[indexPath.row]
        return cell
    }
}

