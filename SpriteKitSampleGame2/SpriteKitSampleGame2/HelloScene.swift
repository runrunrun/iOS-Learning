//
//  HelloScene.swift
//  SpriteKitSampleGame2
//
//  Created by Hari Kunwar on 5/13/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import SpriteKit

class HelloScene: SKScene {
    
    let labelNode = "helloNode"
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = UIColor.blueColor()

        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.name = labelNode
        myLabel.text = "Hello, World!"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(myLabel)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        if let helloNode = self.childNodeWithName(labelNode) {
            helloNode.name = nil
            let moveUp = SKAction.moveByX(0, y: 100.0, duration: 0.5)
            let zoom = SKAction.scaleTo(2.0, duration: 0.25)
            let pause = SKAction.waitForDuration(0.5)
            let fadeAway = SKAction.fadeOutWithDuration(0.25)
            let remove = SKAction.removeFromParent()
            let moveSequence = SKAction.sequence([moveUp, zoom, pause, fadeAway, remove])
            
            helloNode.runAction(moveSequence, completion: {
                let spaceshipScene = SpaceshipScene(size: self.size)
                let doors = SKTransition.doorsOpenVerticalWithDuration(0.5)
                self.view?.presentScene(spaceshipScene, transition: doors)
            })
        }
        
        
    }
}
