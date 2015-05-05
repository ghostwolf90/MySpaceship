//
//  GameScene.swift
//  MySpaceship
//
//  Created by Laibit on 2015/5/1.
//  Copyright (c) 2015年 Laibit. All rights reserved.
//

import SpriteKit
import GameKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let playButton = SKSpriteNode(imageNamed:"play")
    
    override func didMoveToView(view: SKView) {
        self.playButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        self.addChild(self.playButton)
        
        /* Setup your Label here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Run, Spaceship!";
        myLabel.fontSize = 90;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame),
                                   y:CGRectGetMidY(self.frame) + (self.playButton.size.height * 2));

        self.addChild(myLabel)
        
        let LaiBit = SKLabelNode(fontNamed: "Chalkduster")
        LaiBit.text = "作者:LaiBit"
        LaiBit.fontSize = 30;
        LaiBit.position = CGPoint(x:CGRectGetMidX(self.frame),
            y:CGRectGetMidY(self.frame) - (self.playButton.size.height * 2));
        self.addChild(LaiBit)


        //self.backgroundColor = UIColor(hex: 0x80D9FF)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        for touch: AnyObject in touches{
            let location = touch.locationInNode(self)
            if self.nodeAtPoint(location) == self.playButton{
                var scene = PlayScene(size: self.size)
                let skView = self.view
                skView!.ignoresSiblingOrder = true
                scene.scaleMode = .ResizeFill
                scene.size = skView!.bounds.size
                skView?.presentScene(scene)
            }
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }

    
}
