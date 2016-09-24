//
//  GameObject.swift
//
//  Created by Lech Szymanski on 24/07/15.
//  Copyright (c) 2015 Lech Szymanski. All rights reserved.
//

import Cocoa
import SpriteKit

/**
The work horse of this game engine.  This class is a template for
all game objects in the scene.  It contains all the optional 
properties and template methods (now empty) that can be overrriden 
with desired behaviour by classes inheriting from this one

*/
public class GameObject {
    // Reference to the scene where objects is placed
    weak var scene: Scene?

    // Object's parent in scene's hierarchy
    weak var parent: GameObject?
    // Object's children in scene's hierarchy
    var children: [GameObject] = []
    
    
    // Position of the object - relative to its parent
    public var position: CGPoint = CGPoint(x: 0, y: 0)
    
    /**
    Render object - if set defines how game object
    is renderend in the scene.  Nil by default - object
    does not get rendered - it remains in the scene
    though and behaves as normal
    */
    var render: SKNode?

    // Refernce to object's collider - nil by default
    private var _collider: Collider?

    // Flag that marks object for destruction (set to
    // false by default)
    var destroyMe: Bool = false
    
    
    /** 
    Setter and getter for object's collider.
    The setter  adds the collider to game object
    hierarchy as a child of this object
    */
    public var collider: Collider? {
        get {
            return self._collider
        }
        set(newCollider) {
            if let collider = newCollider {
                self._collider = collider
                // Add the collider as a child
                // of the current GameObject
                self.addChild(collider)
            }
        }
    }
    
    /**
    Computes absolute position in the
    scene
    */
    var absolutePosition: CGPoint {
        if let parent = self.parent {
            // If the object has a parent, add own
            // position to parent's absolute position
            return self.position + parent.absolutePosition
        } else {
            // If the object has no parent, absolute
            // position is just position
            return self.position
        }
    }

    init() {
        print("GameObject(\(unsafeAddressOf(self))) init.")
    }
    
    /**
    Adds a game object to the scene as a child of the
    current object
    
    - parameter object: Object to add as a child
    */
    public final func addChild(object: GameObject) {
        // Set self as object's parent
        object.parent = self
        // Set child's scene reference
        // to parent's
        object.scene = self.scene
        // Add object to array of self's
        // children
        self.children.append(object)
        // Register child object in the
        // scene
        self.scene?.registerGameObject(object)
    }
    
    /**
    Mark self and all children for
    removal from the scene
    */
    public final func destroy() {
        // Destroy object's children as well
        for child in self.children {
            child.destroy()
        }

        if let node = self.render {
            node.removeFromParent()
            self.render = nil
        }
        
        // Mark self for destruction - will be
        // removed from the scene at the end of
        // the frame loop
        self.destroyMe = true
    }
    
    /**
    Called by the Game Engine once per frame.
    Redraws the object in the scene - in fact
    all the drawing is done by SpriteKit - this
    method just adds an action to SKNode.
    SpriteKit runs set of actions like an
    animation.
    */
    final func draw(dt: CGFloat) {
        // Only objects with set renderer
        // are drawn
        if let node = render {
            node.position = self.absolutePosition
        }
    }
    
    /**
    Called by the Game Engine once at the beginning of the scene.
    
    Good place to put game object initialisation code that has to
    run once before the game loop begins
    */
    public func start() {
        
    }
    
    /**
    Called by the Game Engine once
    per frame.  It's a template method for specifying
    the changes in object state

    - parameter dt: Time difference since last frame
    */
    public func update(dt: CGFloat) {
        
    }
    
    /**
    Called by the Game Engine when object's 
    collider is in collision with another object's collider.
    It's a template method for overriding with
    object specific behaviour
    
    - parameter other: Object colliding with this object
    */
    public func collidedWith(other: GameObject) {
        
    }

    deinit {
        /**
        Register action that removes
        renderer from SpriteKit
        */
        if let node = self.render {
            node.removeFromParent()
        }
        
        print("GameObject(\(unsafeAddressOf(self))) deinit.")
    }

    
}