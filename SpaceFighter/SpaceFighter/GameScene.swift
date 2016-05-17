//
//  GameScene.swift
//  SpaceFighter
//
//  Created by Hari Kunwar on 5/16/16.
//  Copyright (c) 2016 Learning. All rights reserved.
//

import SpriteKit

struct PhysicsCategory {
    static let None         : UInt32 = 0
    static let All          : UInt32 = UInt32.max
    static let Asteroid     : UInt32 = 0x1 << 1       // 1
    static let Projectile   : UInt32 = 0x1 << 2      // 2
    static let Spaceship    : UInt32 = 0x1 << 3      // 3
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var spaceship : SKSpriteNode?
    var asteroids: [SKSpriteNode] = []

    var lastTouch: CGPoint? = nil

    let playerSpeed: CGFloat = 150.0

    override func didMoveToView(view: SKView) {
        
        // Setup physics words contact delegate
        physicsWorld.contactDelegate = self
        
        // Setup spaceship
        spaceship = self.childNodeWithName("spaceship") as? SKSpriteNode
   
    
        // Setup asteroids
        runAction(SKAction.repeatActionForever(
            SKAction.sequence([
                SKAction.runBlock(addAsteroid),
                SKAction.waitForDuration(1.0)
                ])
            ))
        
        physicsWorld.gravity = CGVectorMake(0, 0)
        physicsWorld.contactDelegate = self
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        handleTouches(touches)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        handleTouches(touches)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        handleTouches(touches)
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    override func didSimulatePhysics() {
        if let _ = spaceship {
            updateSpaceship()
        }
    }
    
    
    private func handleTouches(touches: Set<UITouch>) {
        for touch in touches {
            let touchLocation = touch.locationInNode(self)
            lastTouch = touchLocation
        }
    }
    
    private func updateSpaceship() {
        if let touch = lastTouch {
            let currentPosition = spaceship!.position
            if shouldMove(currentPosition: currentPosition, touchPosition: touch) {
                
                let angle = atan2(currentPosition.y - touch.y, currentPosition.x - touch.x) + CGFloat(M_PI)
                let rotateAction = SKAction.rotateToAngle(angle + CGFloat(M_PI*1.5), duration: 0)
                
                spaceship!.runAction(rotateAction)
                
                let velocotyX = playerSpeed * cos(angle)
                let velocityY = playerSpeed * sin(angle)
                
                let newVelocity = CGVector(dx: velocotyX, dy: velocityY)
                spaceship!.physicsBody!.velocity = newVelocity;
            } else {
                spaceship!.physicsBody!.resting = true
            }
        }
        
    }

    // Determines if the player's position should be updated
    private func shouldMove(currentPosition currentPosition: CGPoint, touchPosition: CGPoint) -> Bool {
        return abs(currentPosition.x - touchPosition.x) > spaceship!.frame.width / 2 ||
            abs(currentPosition.y - touchPosition.y) > spaceship!.frame.height/2
    }
    
    
    private func addAsteroid() {
    
        let postfixIndex = Int(random(min: CGFloat(1), max: CGFloat(4)))

        // Create asteroid sprite
        let asteroid = SKSpriteNode(imageNamed: "asteroid" + String(postfixIndex))
        
        asteroid.physicsBody = SKPhysicsBody(rectangleOfSize: asteroid.size)
        asteroid.physicsBody?.dynamic = true // 2
        asteroid.physicsBody?.categoryBitMask = PhysicsCategory.Asteroid
        asteroid.physicsBody?.contactTestBitMask = PhysicsCategory.Projectile | PhysicsCategory.Spaceship
        asteroid.physicsBody?.collisionBitMask = PhysicsCategory.None
        
        // Determine where to spawn the monster along the Y axis
        let actualY = random(min: asteroid.size.height/2, max: size.height - asteroid.size.height/2)
        
        // Position the monster slightly off-screen along the right edge,
        // and along a random position along the Y axis as calculated above
        asteroid.position = CGPoint(x: size.width + asteroid.size.width/2, y: actualY)
        
        // Add the monster to the scene
        addChild(asteroid)
        
        // Determine speed of the monster
        let actualDuration = random(min: CGFloat(5.0), max: CGFloat(10.0))
        
        // Create the actions
        let actionMove = SKAction.moveTo(CGPoint(x: -asteroid.size.width/2, y: actualY), duration: NSTimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        asteroid.runAction(SKAction.sequence([actionMove, actionMoveDone]))
        
//        let loseAction = SKAction.runBlock() {
//            let reveal = SKTransition.flipHorizontalWithDuration(0.5)
//            let gameOverScene = GameOverScene(size: self.size, won: false)
//            self.view?.presentScene(gameOverScene, transition: reveal)
//        }
        
        asteroid.runAction(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    // MARK :- Util
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    // MARK : - SKPhysicsContactDelegate
    func didBeginContact(contact: SKPhysicsContact) {
        
        var asteroidBody: SKPhysicsBody
        var spaceshipBody: SKPhysicsBody
        
//        if ((contact.bodyA.node?.name?.containsString("asteroid")) != nil) {
//            asteroidBody = contact.bodyA
//        }
//        
//        
//        var firstBody: SKPhysicsBody
//        var secondBody: SKPhysicsBody
//        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
//            firstBody = contact.bodyA
//            secondBody = contact.bodyB
//        } else {
//            firstBody = contact.bodyB
//            secondBody = contact.bodyA
//        }
//        
//        if ((firstBody.categoryBitMask & PhysicsCategory.Asteroid != 0) &&
//            (secondBody.categoryBitMask & PhysicsCategory.Projectile != 0)) {
//            projectileDidCollideWithMonster(firstBody.node as! SKSpriteNode, monster: secondBody.node as! SKSpriteNode)
//        }
    }
    
    func didEndContact(contact: SKPhysicsContact) {
    
    }

}
