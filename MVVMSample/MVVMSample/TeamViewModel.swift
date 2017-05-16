//
//  TeamViewModel.swift
//  MVVMSample
//
//  Created by Hari Kunwar on 5/16/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

struct TeamViewModel: CellRepresentable {
    var team: Team
    var rowHeight: CGFloat = 60
    
    init(team: Team) {
        self.team = team
    }
    
    func cellInstance(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as! TeamCell
        
        cell.setup(vm: self)
        
        return cell
    }
}
