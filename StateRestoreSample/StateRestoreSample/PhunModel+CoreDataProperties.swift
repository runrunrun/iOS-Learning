//
//  PhunModel+CoreDataProperties.swift
//  PhunHomework
//
//  Created by Hari Kunwar on 12/17/15.
//  Copyright © 2015 Learning. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import UIKit
import CoreData

extension PhunModel {
    
    @NSManaged var title: String?
    @NSManaged var summary: String?
    @NSManaged var location1: String?
    @NSManaged var location2: String?
    @NSManaged var phone: String?
    @NSManaged var date: String?
    @NSManaged var timeStamp: String?
    @NSManaged var imageUrl: String?

    class func modelWithDictionary(dict: [String: AnyObject]) -> PhunModel {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

        let model = NSEntityDescription.insertNewObjectForEntityForName("PhunModel", inManagedObjectContext: appDelegate.managedObjectContext) as! PhunModel
        model.title = dict["title"] as? String
        model.summary = dict["description"] as? String
        model.location1 = dict["locationline1"] as? String
        model.location1 = dict["locationline2"] as? String
        model.phone = dict["phone"] as? String
        model.date = dict["date"] as? String
        model.timeStamp = dict["timestamp"] as? String
        model.imageUrl = dict["image"] as? String
        
        do {
            try appDelegate.managedObjectContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }

        return model
    }
    
    class func fetchModels() -> [PhunModel] {
        var models: [PhunModel] = []
        // Initialize Fetch Request
        let fetchRequest = NSFetchRequest()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

        // Create Entity Description
        let entityDescription = NSEntityDescription.entityForName("PhunModel", inManagedObjectContext: appDelegate.managedObjectContext)
        
        // Configure Fetch Request
        fetchRequest.entity = entityDescription
        
        do {
            if let result = try appDelegate.managedObjectContext.executeFetchRequest(fetchRequest) as? [PhunModel] {
                models = result
            }
            
        } catch {
            let fetchError = error as NSError
            print(fetchError)
        }
     
        return models
    }
    
    class func fetchModel(title: String) -> PhunModel? {
        var models: [PhunModel] = []
        
        // Initialize Fetch Request
        let fetchRequest = NSFetchRequest()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // Create Entity Description
        let entityDescription = NSEntityDescription.entityForName("PhunModel", inManagedObjectContext: appDelegate.managedObjectContext)
        
        // Configure Fetch Request
        fetchRequest.entity = entityDescription
        
        fetchRequest.predicate = NSPredicate(format: "title == %@", title)
        
        do {
            if let result = try appDelegate.managedObjectContext.executeFetchRequest(fetchRequest) as? [PhunModel] {
                models = result
            }
            
        } catch {
            let fetchError = error as NSError
            print(fetchError)
        }
        
        return models.first
    }

}
