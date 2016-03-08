//
//  MasterViewController.swift
//  ReplayKitSample
//
//  Created by Hari Kunwar on 3/7/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit
import ReplayKit

class MasterViewController: UITableViewController, RPPreviewViewControllerDelegate {

    var detailViewController: DetailViewController? = nil
    var objects = [AnyObject]()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()

        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(sender: AnyObject) {
        objects.insert(NSDate(), atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    
    @IBAction func startRecording(sender: AnyObject) {
        if RPScreenRecorder.sharedRecorder().available {
            RPScreenRecorder.sharedRecorder().startRecordingWithMicrophoneEnabled(true, handler: { (error: NSError?) -> Void in
                if error == nil { // Recording has started
                    sender.removeTarget(self, action: "startRecording:", forControlEvents: .TouchUpInside)
                    sender.addTarget(self, action: "stopRecording:", forControlEvents: .TouchUpInside)
                    sender.setTitle("Stop Recording", forState: .Normal)
                    sender.setTitleColor(UIColor.redColor(), forState: .Normal)
                } else {
                    // Handle error
                }
            })
        } else {
            // Display UI for recording being unavailable
        }
    }
    
    func stopRecording(sender: UIButton) {
        RPScreenRecorder.sharedRecorder().stopRecordingWithHandler { (previewController: RPPreviewViewController?, error: NSError?) -> Void in
            if previewController != nil {
                let alertController = UIAlertController(title: "Recording", message: "Do you wish to discard or view your gameplay recording?", preferredStyle: .Alert)
                
                let discardAction = UIAlertAction(title: "Discard", style: .Default) { (action: UIAlertAction) in
                    RPScreenRecorder.sharedRecorder().discardRecordingWithHandler({ () -> Void in
                        // Executed once recording has successfully been discarded
                    })
                }
                
                let viewAction = UIAlertAction(title: "View", style: .Default, handler: { (action: UIAlertAction) -> Void in
                    previewController!.previewControllerDelegate = self
                    self.presentViewController(previewController!, animated: true, completion: nil)
                })
                
                alertController.addAction(discardAction)
                alertController.addAction(viewAction)
                
                self.presentViewController(alertController, animated: true, completion: nil)
                
                // Revert record button to previous state
                sender.removeTarget(self, action: "stopRecording:", forControlEvents: .TouchUpInside)
                sender.addTarget(self, action: "startRecording:", forControlEvents: .TouchUpInside)
                sender.setTitle("Start Recording", forState: .Normal)
                sender.setTitleColor(UIColor.blueColor(), forState: .Normal)
            } else {
                // Handle error
            }
        }
    }
    
    // MARK: - 
    
    func previewControllerDidFinish(previewController: RPPreviewViewController) {
        previewController.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }


    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row] as! NSDate
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let object = objects[indexPath.row] as! NSDate
        cell.textLabel!.text = object.description
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

