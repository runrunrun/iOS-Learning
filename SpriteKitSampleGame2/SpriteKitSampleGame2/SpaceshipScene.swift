//
//  SpaceshipScene.swift
//  SpriteKitSampleGame2
//
//  Created by Hari Kunwar on 5/13/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import SpriteKit

class SpaceshipScene: SKScene, SKSceneDelegate {
    var freeShip: SKSpriteNode! = nil
    var fixedShip: SKSpriteNode! = nil
    
    var movingRight = true
    var movingUp = true
    
    override func didMove(to view: SKView) {
        self.backgroundColor = UIColor.white
        
        fixedShip = self.newSpaceship()
        fixedShip.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 150)
        
        // Move hull in a sequence
        let hover = SKAction.sequence([
            SKAction.wait(forDuration: 1.0),
            SKAction.moveBy(x: 100, y: 50.0, duration: 1.0),
            SKAction.wait(forDuration: 1.0),
            SKAction.moveBy(x: -100, y: -50, duration: 1.0)
            ])
        
        fixedShip.run(SKAction.repeatForever(hover), completion: {
        }) 
        
        self.addChild(fixedShip)
        
        
        freeShip = self.newSpaceship()
        freeShip.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        
        self.addChild(freeShip)
    }
    
    func newSpaceship() -> SKSpriteNode {
        let hull = SKSpriteNode(color: SKColor.gray, size: CGSize(width: 64, height: 32))
        
        // Add lights
        let light1 = self.newLight()
        light1.position = CGPoint(x: -28.0, y: 6.0)
        hull.addChild(light1)
        
        let light2 = self.newLight()
        light2.position = CGPoint(x: 28.0, y: 6.0)
        hull.addChild(light2)
        
        return hull
    }
    
    func newLight() -> SKSpriteNode {
        let light = SKSpriteNode(color: SKColor.yellow, size: CGSize(width: 8,height: 8))
        
        let blink = SKAction.sequence([
            SKAction.fadeOut(withDuration: 0.25),
            SKAction.fadeIn(withDuration: 0.25)
            ])
        
        let blinkForever = SKAction.repeatForever(blink)
        
        light.run(blinkForever, completion: { 
            
        }) 
        
        return light
    }
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
        
        let currentPosition = freeShip.position

        // check x bounds
        if currentPosition.x >= self.frame.maxX && movingRight == true{
            movingRight = false
        }
        else if currentPosition.x <= self.frame.minX && movingRight == false{
            movingRight = true
        }
        let xIncrement = movingRight ? 1 : -1

        // check y bounds
        if currentPosition.y >= self.frame.maxY && movingUp == true {
            movingUp = false
        }
        else if currentPosition.y <= self.frame.minY  && movingUp == false{
            movingUp = true
        }
        let yIncrement =  movingUp ? 1 : -1
        
        freeShip.position = CGPoint(x: currentPosition.x + CGFloat(xIncrement), y: currentPosition.y + CGFloat(yIncrement))
    }
    
    override func didFinishUpdate() {
    
    }
    
    func didFinishUpdate(for scene: SKScene) {
    
    }


}
