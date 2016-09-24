//
//  CircleCollider.swift
//
//  Created by Lech Szymanski on 24/07/15.
//  Copyright (c) 2015 Lech Szymanski. All rights reserved.
//

import Cocoa
import SpriteKit

/**
Circular collider game object

Provides visualisation as well as computations for
collisions between two circle colliders

*/
public class CircleCollider: Collider {
    // Radius of the collider
    let radius: CGFloat
    
    /**
    Designated initialiser

    - parameter radius: Radius of the collider
    */
    public init(radius: CGFloat) {
        self.radius = radius
        print("Circle:", terminator: "")
        super.init()
    }

    /**
    Game object code to run before
    starting the game loop
    */
    override public func start() {

        if let scene = self.scene {
            // If scene is in debug mode, add a visualisation of the
            // collider to the scene - a green circle
            if scene.debug {
                let shape = SKShapeNode(circleOfRadius: self.radius);
                shape.strokeColor = NSColor.greenColor()
                self.render = shape
                scene.registerGameObject(self)
            }
        }
    }
    
    /**
    Code doing the actual collision detection for
    this collider
    */
    override public func inCollisionWith(other: Collider) -> Bool {

        if other is CircleCollider {
            // If the other collider is a circle
            // the objects are in collision if distance
            // between their centres is less or equal to
            // the sum of their radii
            let otherCircle = other as! CircleCollider

            // Computed difference vector between two
            // centres of the colliders
            let distVect = self.absolutePosition - otherCircle.absolutePosition
            // Compute the distance between the two centres
            let dist = sqrt(distVect.x*distVect.x+distVect.y*distVect.y)
            // Check if the distance is less or equal than sum
            // of the radii
            if dist <= self.radius + otherCircle.radius {
                return true
            }
        } else if other is RectangleCollider {
            // Use RectangleCollider's method, which supports collisions
            // between circle and rectangular colliders
            return other.inCollisionWith(self)
        }
        
        // If other collider unknown, return default anser
        // provided by the parent
        return super.inCollisionWith(other)
    }
    
    deinit {
        print("Circle:", terminator: "")
    }
}