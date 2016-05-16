//
//  GameScene.swift
//  ZombieHunt
//
//  Created by Hari Kunwar on 5/16/16.
//  Copyright (c) 2016 Learning. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let spaceship : SKSpriteNode?
    let starsBackground : SKSpriteNode?
    
    override func didMoveToView(view: SKView) {

        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
