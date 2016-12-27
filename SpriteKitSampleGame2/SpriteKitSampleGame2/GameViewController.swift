//
//  GameViewController.swift
//  SpriteKitSampleGame2
//
//  Created by Hari Kunwar on 5/13/16.
//  Copyright (c) 2016 Learning. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let hello = HelloScene(size: self.view.bounds.size)
        hello.scaleMode = .aspectFill
        
        let skView = self.view as! SKView
        skView.presentScene(hello)
        
        skView.showsDrawCount = true
        skView.showsNodeCount = true
        skView.showsFPS = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
}
