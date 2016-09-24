//
//  GameEngine.swift
//
//  Created by Lech Szymanski on 24/07/15.
//  Copyright (c) 2015 Lech Szymanski. All rights reserved.
//

import Cocoa
import SpriteKit
import XCPlayground

public var gameTime: CGFloat = 0
public var maxGameTime: CGFloat = 0
public var view: SKView?

/**
Runs the scene at specified frame rate for specified number
of secons 

- parameter scene: Scene to run
- parameter forTimeInSecons: How long to run the scene for
- parameter atFrameRate: Desired frame rate

*/
public func runScene(scene: Scene, forTimeInSeconds t: CGFloat, atFrameRate fs: CGFloat) {
    
    maxGameTime = t
    
    for object in scene.objects {
        object.start()
    }
    
    view = SKView(frame: CGRectMake(0, 0, scene.width, scene.height))
    // Scale the scene window to fit the Assistant window
    view!.presentScene(scene)
    // Display the scene windo in the Assistant window
    // (this will only work in a playgrounds project)
    XCPlaygroundPage.currentPage.liveView = view
}
