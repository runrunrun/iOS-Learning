//
//  SecondViewController.swift
//  AppSearch
//
//  Created by Hari Kunwar on 11/23/15.
//  Copyright © 2015 learning. All rights reserved.
//

import UIKit
import CoreSpotlight
import MobileCoreServices

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var searchableItems: [CSSearchableItem] = []
        
        /*
        You create a CSSearchableItemAttributeSet object, passing in a content type for the item. If your search result links to a photo, for example, you would pass in the kUTTypeImage constant.
        */
        let attributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeItem as String)
        
        /*
        You assign the show's name to the title property of the attribute set. Just like with NSUserActivity, this title is what will appear at the top of your search results.
        */
        attributeSet.title = "Daily Learning for happiness and health"
        
        /*
        Next, you create a descriptive string and assign this to the contentDescription property of your searchable attribute set. This string will be displayed below the result's title in Spotlight.
        */
        attributeSet.contentDescription = "Life is all about learning"
        
        /*
        You create an array of keywords form the search result just as you did with NSUserActivity.
        */
        let keywords = ["life", "learning", "fun"]
        attributeSet.keywords = keywords
        
        /*
        Lastly, you create a CSSearchableItem with a unique item identifier, unique domain identifier to group items together, and an attribute set. Unlike with NSUserActivity, which returns the user activity from the search result, the unique identifiers you use for a CSSearchableItem are the only information that you receive from the operating system when your search result is selected by the user. You need to use these identifiers to restore your app back to the correct state.
        */
        let item = CSSearchableItem(uniqueIdentifier: "learn.something.today", domainIdentifier: "tv-shows", attributeSet: attributeSet)
        searchableItems.append(item)
        
        CSSearchableIndex.default().indexSearchableItems(searchableItems) { (error) -> Void in
            if error != nil {
                print(error?.localizedDescription)
            }
            else {
                // Items were indexed successfully
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
