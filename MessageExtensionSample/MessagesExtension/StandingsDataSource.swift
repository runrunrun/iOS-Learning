//
//  StandingsDataSource.swift
//  WatchTable
//
//  Created by Hari Kunwar on 12/25/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import Foundation
import WatchKit

struct StandingsDataSource {
    var standings: [Team] {
        let chelsea = Team(name: "Chelsea", logo: #imageLiteral(resourceName: "chelsea"))
        let liverpool = Team(name: "Liverpool", logo: #imageLiteral(resourceName: "liverpool"))
        let manCity = Team(name: "Man. City", logo: #imageLiteral(resourceName: "mancity"))
        let arsenal = Team(name: "Arsenal", logo: #imageLiteral(resourceName: "arsenal"))
        let tottenham = Team(name: "Tottenham", logo: #imageLiteral(resourceName: "tottenham"))
        let manu = Team(name: "Man United", logo: #imageLiteral(resourceName: "manunited"))
        let southampton = Team(name: "Southampton", logo: #imageLiteral(resourceName: "southampton"))
        let westBrom = Team(name: "West Brom", logo: #imageLiteral(resourceName: "westbrom"))
        let everton = Team(name: "Everton", logo: #imageLiteral(resourceName: "everton"))
        let bournemouth = Team(name: "Bournemouth", logo: #imageLiteral(resourceName: "bournemouth"))
        let standings = [chelsea, liverpool, manCity, arsenal, tottenham, manu, southampton, westBrom, everton, bournemouth]
        return standings
    }
}
