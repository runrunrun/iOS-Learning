//
//  TeamViewModel.swift
//  MVVMSample
//
//  Created by Hari Kunwar on 5/16/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

class TeamViewModel {
    private var teams: [Team] = []
    fileprivate var cellViewModels: [TeamCellViewModel] = [TeamCellViewModel]() {
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    
    var reloadTableViewClosure: (()->())?

    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    func initTeams() {
        // Init models
        teams = [Team(name: "Chelsea", rank: 1),
                Team(name: "Tottenham", rank: 2),
                Team(name: "Liverpool", rank: 3),
                Team(name: "Man City", rank: 4),
                Team(name: "Arsenal", rank: 5),
                Team(name: "Man United", rank: 6),
                Team(name: "Everton", rank: 7),
                Team(name: "West Brom", rank: 8)]
        
        // Init cell view models.
        var teamCellVMs: [TeamCellViewModel] = []
        for team in teams {
            teamCellVMs.append(TeamCellViewModel(team: team))
        }
        
        // This will trigger reloadData.
        self.cellViewModels = teamCellVMs
    }
}

extension TeamViewModel: CellRepresentable {
    func rowHeight() -> CGFloat {
        return 60
    }
    
    func cellInstance(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as! TeamCell

        let cellVM = cellViewModels[indexPath.row]
        cell.rankLabel.text =  cellVM.rank
        cell.teamNameLabel.text = cellVM.teamName
        
        return cell
    }
}


struct TeamCellViewModel {
    let teamName: String
    let rank: String
    
    init(team: Team) {
        self.teamName = team.name
        self.rank = "Rank: \(team.rank)"
    }
}
