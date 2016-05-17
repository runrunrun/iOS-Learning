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
    static let Asteroid     : UInt32 = 0b001
    static let Projectile   : UInt32 = 0b010
    static let Spaceship    : UInt32 = 0b100
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
        if let spaceship = self.childNodeWithName("spaceship") as? SKSpriteNode {
            self.spaceship = spaceship
            spaceship.physicsBody?.dynamic = true // 2
            spaceship.physicsBody?.categoryBitMask = PhysicsCategory.Spaceship
            spaceship.physicsBody?.contactTestBitMask = PhysicsCategory.Asteroid 
            spaceship.physicsBody?.collisionBitMask = PhysicsCategory.Asteroid
        }
        
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
        asteroid.physicsBody?.contactTestBitMask = PhysicsCategory.Spaceship | PhysicsCategory.Projectile
        asteroid.physicsBody?.collisionBitMask = PhysicsCategory.Spaceship | PhysicsCategory.Projectile
        
        // Determine where to spawn the asteroid along the Y axis
        let actualY = random(min: asteroid.size.height/2, max: size.height - asteroid.size.height/2)
        
        // Position the asteroid slightly off-screen along the right edge,
        // and along a random position along the Y axis as calculated above
        asteroid.position = CGPoint(x: size.width + asteroid.size.width/2, y: actualY)
        
        // Add asteroid to array
        self.asteroids.append(asteroid)
        
        // Add the asteroid to the scene
        addChild(asteroid)
        
        // Determine speed of the asteroid
        let actualDuration = random(min: CGFloat(5.0), max: CGFloat(10.0))
        
        // Create the actions
        let actionMove = SKAction.moveTo(CGPoint(x: -asteroid.size.width/2, y: actualY), duration: NSTimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        asteroid.runAction(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    // MARK :- Collision handling
    private func projectileDidCollideWithAsteroid(projectile: SKSpriteNode, asteroid: SKSpriteNode) {
        print("Hit")
        projectile.removeFromParent()
        asteroid.removeFromParent()
    }
    
    private func spaceshipDidCollideWithAsteroid(spaceship: SKSpriteNode, asteroid: SKSpriteNode) {
        print("Game over")
        
        // Create the actions
        let actionExplosion = SKAction.animateWithTextures([SKTexture(imageNamed: "explosion")], timePerFrame: 0.5)
        let actionExplosionDone = SKAction.removeFromParent()

        spaceship.runAction(SKAction.sequence([actionExplosion, actionExplosionDone])) { 
            // Show gameover screen
            let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC)))
            dispatch_after(delayTime, dispatch_get_main_queue()) {
                let reveal = SKTransition.flipHorizontalWithDuration(2.0)
                let gameOverScene = GameOverScene(size: self.size, won: false)
                self.view?.presentScene(gameOverScene, transition: reveal)
            }
        }
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
        
        // Step 1. Bitwise OR the bodies' categories to find out what kind of contact we have
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        switch contactMask {
        case PhysicsCategory.Asteroid | PhysicsCategory.Spaceship:
            // Destroy asteroid and spaceship
            
            // Step 2. Disambiguate the bodies in the contact
            if contact.bodyA.categoryBitMask == PhysicsCategory.Asteroid {
                spaceshipDidCollideWithAsteroid(contact.bodyB.node as! SKSpriteNode, asteroid: contact.bodyA.node as! SKSpriteNode)
            } else {
                spaceshipDidCollideWithAsteroid(contact.bodyA.node as! SKSpriteNode, asteroid: contact.bodyB.node as! SKSpriteNode)
            }
            
        case PhysicsCategory.Asteroid | PhysicsCategory.Projectile:
            // Destroy asteroid and projectile
            // Here we don't care which body is which, the scene is ending
            if contact.bodyA.categoryBitMask == PhysicsCategory.Asteroid {
                projectileDidCollideWithAsteroid(contact.bodyB.node as! SKSpriteNode, asteroid: contact.bodyA.node as! SKSpriteNode)
            } else {
                projectileDidCollideWithAsteroid(contact.bodyA.node as! SKSpriteNode, asteroid: contact.bodyB.node as! SKSpriteNode)
            }
        default:
            
            // Nobody expects this, so satisfy the compiler and catch
            // ourselves if we do something we didn't plan to
            fatalError("other collision: \(contactMask)")
        }
        
    }

}
