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
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = UIColor.whiteColor()
        
        fixedShip = self.newSpaceship()
        fixedShip.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 150)
        
        // Move hull in a sequence
        let hover = SKAction.sequence([
            SKAction.waitForDuration(1.0),
            SKAction.moveByX(100, y: 50.0, duration: 1.0),
            SKAction.waitForDuration(1.0),
            SKAction.moveByX(-100, y: -50, duration: 1.0)
            ])
        
        fixedShip.runAction(SKAction.repeatActionForever(hover)) {
        }
        
        self.addChild(fixedShip)
        
        
        freeShip = self.newSpaceship()
        freeShip.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        
        self.addChild(freeShip)
    }
    
    func newSpaceship() -> SKSpriteNode {
        let hull = SKSpriteNode(color: SKColor.grayColor(), size: CGSizeMake(64, 32))
        
        // Add lights
        let light1 = self.newLight()
        light1.position = CGPointMake(-28.0, 6.0)
        hull.addChild(light1)
        
        let light2 = self.newLight()
        light2.position = CGPointMake(28.0, 6.0)
        hull.addChild(light2)
        
        return hull
    }
    
    func newLight() -> SKSpriteNode {
        let light = SKSpriteNode(color: SKColor.yellowColor(), size: CGSizeMake(8,8))
        
        let blink = SKAction.sequence([
            SKAction.fadeOutWithDuration(0.25),
            SKAction.fadeInWithDuration(0.25)
            ])
        
        let blinkForever = SKAction.repeatActionForever(blink)
        
        light.runAction(blinkForever) { 
            
        }
        
        return light
    }
    
    override func update(currentTime: CFTimeInterval) {
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
        
        freeShip.position = CGPointMake(currentPosition.x + CGFloat(xIncrement), currentPosition.y + CGFloat(yIncrement))
    }
    
    override func didFinishUpdate() {
    
    }
    
    func didFinishUpdateForScene(scene: SKScene) {
    
    }


}
