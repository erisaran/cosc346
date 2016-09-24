//
//  Sprite.swift
//
//  Created by Lech Szymanski on 24/07/15.
//  Copyright (c) 2015 Lech Szymanski. All rights reserved.
//

import Cocoa
import SpriteKit

/**
  Game object that renders an image
*/
public class Sprite: GameObject {
    let imageName: String
    /**
    Designated initialiser that loads image as SKSpriteNode.  

    - parameter imageNamed: File name of the image to load - no path is needed,
    but the image must be added to project Resources
    - parameter scale: Scale factor - default value is 1, same size as the
    original image
    */
    public init(imageNamed: String, scale: CGFloat = 1.0) {
        self.imageName = imageNamed
        print("Sprite \"\(self.imageName)\":", terminator: "")
        super.init()
        let sprite = SKSpriteNode(imageNamed: imageNamed)
        var size = sprite.size
        size.height *= scale
        size.width *= scale
        sprite.size = size
        self.render = sprite
    }
    
    deinit {
        print("Sprite(\"\(self.imageName)\"):", terminator: "")
    }
    
}