//
//  GameOverScene.swift
//  SpriteKitSimpleGame
//
//  Created by Kunwar on 5/12/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene {
    
    init(size: CGSize, won:Bool) {
        super.init(size: size)
        backgroundColor = SKColor.whiteColor()
        let message = won ? "You Won!" : "You Lose :["
        let label = SKLabelNode(fontNamed: "Chalkduster")
        label.text = message
        label.fontSize = 40
        label.fontColor = SKColor.blackColor()
        label.position = CGPoint(x: size.width/2, y: size.height/2)
        addChild(label)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        runAction(SKAction.sequence([
            SKAction.waitForDuration(3.0),
            SKAction.runBlock() {
                let reveal = SKTransition.flipHorizontalWithDuration(0.5)
                if let gameScene = GameScene(fileNamed: "GameScene") {
                    gameScene.size = self.size
                    self.view?.presentScene(gameScene, transition:reveal)
                }
            }
            ]))
    }
}
