//
//  Collider.swift
//
//  Created by Lech Szymanski on 24/07/15.
//  Copyright (c) 2015 Lech Szymanski. All rights reserved.
//

import Cocoa
import SpriteKit

/**
Collider is a game object capable of detecting collisions with other colliders

This class is a boiler plate for colliders of specific shape.  It provides
a default method for detecting collisions, which is meant to overwritten
of specific shape, inehriting from this one
*/
public class Collider: GameObject {
    
    override init() {
        print("Collider:", terminator: "")
        super.init()
    }
    
    
    /**
    New method specific to all colliders that detects
    collisions between different objects.  The computations
    is different for different type of collider, so this
    is just a template always returning false.  A collier
    inheriting from this one should override this method
    
    - parameter other: Collider to check for collision with
    
    */
    public func inCollisionWith(other: Collider) -> Bool {
        return false
    }
    
    deinit {
        print("Collider:", terminator: "")
    }
}