//
//  GameViewController.swift
//  MySpaceship
//
//  Created by Laibit on 2015/5/1.
//  Copyright (c) 2015年 Laibit. All rights reserved.
//

import UIKit
import SpriteKit
import GameKit


class GameViewController: UIViewController {
    
    var ascene : PlayScene?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize game center
        //self.initGameCenter()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        // Detect the screensize
        let sizeRect = UIScreen.mainScreen().applicationFrame
        let width = sizeRect.size.width * UIScreen.mainScreen().scale
        let height = sizeRect.size.height * UIScreen.mainScreen().scale
        
        // Create a fullscreen Scene object
        ascene = PlayScene(size: CGSizeMake(width, height))
        ascene!.scaleMode = .AspectFill
        //ascene!.gameCenterDelegate = self
        
        // Scene should be shown in fullscreen mode
        let scene = GameScene(size: CGSizeMake(width, height))
        // Configure the view.
        let skView = self.view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = false
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .AspectFill
        skView.presentScene(scene)
    }

     override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.LandscapeLeft
    }

    func gameCenterStateChanged() {
        self.ascene!.gamePaused = false
    }

    
    // Initialize Game Center
    func initGameCenter() {
        // Check if user is already authenticated in game center
        if GKLocalPlayer.localPlayer().authenticated == false {
            // Show the Login Prompt for Game Center
            GKLocalPlayer.localPlayer().authenticateHandler = {(viewController, error) -> Void in
                if viewController != nil {
                    self.ascene!.gamePaused = true
                    self.presentViewController(viewController!, animated: true, completion: nil)
                    // Add an observer which calls ‘gameCenterStateChanged’ to handle a changed game center state
                    let notificationCenter = NSNotificationCenter.defaultCenter()
                    notificationCenter.addObserver(self, selector:"gameCenterStateChanged", name: "GKPlayerAuthenticationDidChangeNotificationName", object: nil)
                }
            }
        }
    }

         
}
