//
//  PhunModel.swift
//  PhunApp
//
//  Created by Hari Kunwar on 11/30/15.
//  Copyright (c) 2015 learning. All rights reserved.
//

import UIKit

class PhunModel: NSObject {
    var title: String?
    var summary: String?
    var location1: String?
    var location2: String?
    var phone: String?
    var date: String?
    var timeStamp: String?
    var imageUrl: String?
    
    class func modelWithDictionary(dict: [String: AnyObject]) -> PhunModel {
        let model = PhunModel()
        model.title = dict["title"] as? String
        model.summary = dict["description"] as? String
        model.location1 = dict["locationline1"] as? String
        model.location1 = dict["locationline2"] as? String
        model.phone = dict["phone"] as? String
        model.date = dict["date"] as? String
        model.timeStamp = dict["timestamp"] as? String
        model.imageUrl = dict["image"] as? String
        return model
    }
}
