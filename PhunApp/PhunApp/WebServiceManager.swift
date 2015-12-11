//
//  WebServiceManager.swift
//  PhunApp
//
//  Created by Hari Kunwar on 12/10/15.
//  Copyright © 2015 learning. All rights reserved.
//

import UIKit

class WebServiceManager: NSObject {
    
//    class func fetchDataFromUrl(url:String, completionHandler: (AFHTTPRequestOperation, [AnyObject]) -> Void) {
//        
//        let manager = AFHTTPRequestOperationManager()
//        manager.responseSerializer = AFHTTPResponseSerializer()
//        manager.GET(url, parameters: nil, success: { (operation: AFHTTPRequestOperation, responseObject: AnyObject) -> Void in
//            
//            do {
//                let JSON = try NSJSONSerialization.JSONObjectWithData(responseObject as! NSData, options:NSJSONReadingOptions(rawValue: 0))
//                guard let JSONArray :[AnyObject] = JSON as? [AnyObject] else {
//                    print("Not a Dictionary")
//                    return
//                }
//                completionHandler(operation, JSONArray)
//            }
//            catch let JSONError as NSError {
//                print("\(JSONError)")
//            }
//
//            },
//            failure: { (operation: AFHTTPRequestOperation?, error: NSError!) in
//                print("Error: " + error.localizedDescription)
//            }
//        )
//        
//    }
    
    class func fetchDataFromUrl(urlString: String, completionHandler: ([AnyObject], NSError) -> Void ) {
        
        guard let url: NSURL = NSURL(string: urlString) else {
            print("Invalid url")
            return
        }
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
            do {
                let JSON = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions(rawValue: 0))
                guard let JSONArray :[AnyObject] = JSON as? [AnyObject] else {
                    print("Not a data array")
                    return
                }
                
                // Call back in main queue
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    completionHandler(JSONArray, error!)
                })
            }
            catch let JSONError as NSError {
                print("\(JSONError)")
            }
        })
        
        task.resume()
    }
    
}
