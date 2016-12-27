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
    
    override func didMove(to view: SKView) {
        self.backgroundColor = UIColor.blue

        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.name = labelNode
        myLabel.text = "Hello, World!"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
        
        self.addChild(myLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        
        if let helloNode = self.childNode(withName: labelNode) {
            helloNode.name = nil
            let moveUp = SKAction.moveBy(x: 0, y: 100.0, duration: 0.5)
            let zoom = SKAction.scale(to: 2.0, duration: 0.25)
            let pause = SKAction.wait(forDuration: 0.5)
            let fadeAway = SKAction.fadeOut(withDuration: 0.25)
            let remove = SKAction.removeFromParent()
            let moveSequence = SKAction.sequence([moveUp, zoom, pause, fadeAway, remove])
            
            helloNode.run(moveSequence, completion: {
                let spaceshipScene = SpaceshipScene(size: self.size)
                let doors = SKTransition.doorsOpenVertical(withDuration: 0.5)
                self.view?.presentScene(spaceshipScene, transition: doors)
            })
        }
        
        
    }
}
