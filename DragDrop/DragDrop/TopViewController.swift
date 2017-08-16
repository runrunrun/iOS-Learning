//
//  TopViewController.swift
//  DragDrop
//
//  Created by Hari Kunwar on 8/15/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit
import MobileCoreServices

class TopViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var items = ["NY", "CA", "CO", "MI", "SI", "VIR"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dropDelegate = self
        tableView.dragDelegate = self
        tableView.dragInteractionEnabled = true
    }
}

extension TopViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topTableCell")!
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    // Local drags inside same tableView will use this method.
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedItem = items[sourceIndexPath.row]
        items.remove(at: sourceIndexPath.row)
        items.insert(movedItem, at: destinationIndexPath.row)
    }
}

extension TopViewController: UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let text = items[indexPath.row]
        guard let data = text.data(using: .utf8) else {
            return []
        }
        
        let itemProvider = NSItemProvider(item: data as NSData, typeIdentifier: kUTTypePlainText as String)
        
        return [UIDragItem(itemProvider: itemProvider)]
    }
}

extension TopViewController: UITableViewDropDelegate {
    
    /**
     This delegate method is the only opportunity for accessing and loading
     the data representations offered in the drag item. The drop coordinator
     supports accessing the dropped items, updating the table view, and specifying
     optional animations. Local drags with one item go through the existing
     `tableView(_:moveRowAt:to:)` method on the data source.
     */
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        let destinationIndexPath: IndexPath

        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = indexPath
        } else {
            let section = tableView.numberOfSections - 1
            let row = tableView.numberOfRows(inSection: section)
            destinationIndexPath = IndexPath(row: row, section: section)
        }

        coordinator.session.loadObjects(ofClass: NSString.self) { (items) in
            guard let droppedStrings = items as? [String] else {
                return
            }

            var indexPaths = [IndexPath]()

            for (index, string) in droppedStrings.enumerated() {
                let indexPath = IndexPath(row: destinationIndexPath.row + index, section: destinationIndexPath.section)
                self.items.insert(string, at: index)
                indexPaths.append(indexPath)
            }

            tableView.insertRows(at: indexPaths, with: .automatic)
        }
    }
}

