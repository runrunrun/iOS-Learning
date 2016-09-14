//
//  Show.swift
//  CloudKitSample
//
//  Created by Hari Kunwar on 8/22/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import Foundation

class Show {
    var title:String?
    var duration:Float?
    var season:Int?
    var episode:Int?
    var identifier: String? {
        get {
            var identifier: String?
            if let seasonNumber = season, episodeNumber = episode, titleName = title {
                identifier = String(seasonNumber) + String(episodeNumber) + titleName;
            }
            return identifier
        }
    }
    
}