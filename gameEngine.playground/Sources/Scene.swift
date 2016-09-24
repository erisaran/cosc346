//
//  Scene.swift
//
//  Created by Lech Szymanski on 24/07/15.
//  Copyright (c) 2015 Lech Szymanski. All rights reserved.
//

import Cocoa
import SpriteKit
import XCPlayground

/**
Scene where game objects can be placed and rendered.  It's a rectangular canvas
of certain widht (w) and height (h).  The coordinate system for the
scene is

    (-w/2,h/2)                  (w/2,h/2)
        ----------------------------
        |                          |
        |                          |
        |                          |
        |          (0,0)           |
        |                          |
  y     |                          |
  ^     |                          |
  |     ----------------------------
  | (-w/2,-h/2)                (w/2,-h/2)
  |
  ----> x

*/
public class Scene : SKScene {
    
    // Root game object in the scene - created
    // when scene is instantiated.  Every object
    // in the scene is a child of the root.  This
    // object is used to set up cooordinate system
    // centered at the middle of the scene
    private let root: GameObject = GameObject()
    
    // Objects in the scene
    var objects: [GameObject] = []

    private var lastTime: NSTimeInterval?
    
    // Debug flag - indicates whether scene is
    // running in debug mode or not.  Debug mode
    // is disabled by default
    var debug = false
    
    
    var width: CGFloat = 0.0
    var height: CGFloat = 0.0
    /**
    Designated initialiser - creates a new scene

    - parameter width: The width of the screen canvas
    - parameter height: The height of the screen canvas
    
    */
    public init(width: CGFloat, height: CGFloat, debug: Bool = false) {
        self.width = width
        self.height = height
        // SpriteKit scene origin is in the left bottom corner.
        // The puprose of the root game object (of which every
        // other game object in the scene is a child) is to
        // repostition the origing to screen's centre.
        self.root.position = CGPoint(x: width/2, y: height/2)
        super.init(size: CGSizeMake(width, height))
        self.scaleMode = SKSceneScaleMode.AspectFit
        self.root.scene = self
        self.debug = debug
        print("Scene init.")
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /**
    Registers an object in the scene - not meant to be
    used externally.
    
    - parameter object: Game object to register in the scene
    
    */
    func registerGameObject(object: GameObject) {
        // Set object's scene
        object.scene = self

        // If object specifies a renderer, add it
        // to the SpriteKit scene
        if let node = object.render {
            node.position = object.absolutePosition
            self.addChild(node)
        }
        // Update the list of objects in the
        // scene if it's not already on that list
        for objectInTheScene in self.objects {
            if objectInTheScene === object {
                return
            }
        }
        self.objects.append(object)
    }

    override public func update(currentTime: NSTimeInterval) {
        
        var dt: CGFloat = 0.0
        if let prevTime = lastTime {
            dt = CGFloat(currentTime-prevTime)
        }
        
        maxGameTime -= dt
        if(maxGameTime < 0) {
            view?.presentScene(nil)
            self.removeFromParent()
            return
        }
        
        //gameTime += dt
        lastTime = currentTime
        
        // Iterate over all objects in the scene
        for i in 0..<objects.count {
            let object = objects[i]
                
            //Check if the object's collider is
            // set
            if let collider = object.collider {
                    
                // Iterate of objects that haven't
                // been checked for collision with current
                // object
                for j in i+1..<objects.count {
                    let otherObject = objects[j]
                        
                    // Check if other object's collider
                    // is set
                    if let otherCollider = otherObject.collider {
                            
                        // Check for collision
                        if collider.inCollisionWith(otherCollider)  {
                            // If in collision, then send
                            // collidedWith message to both
                            // objects
                            object.collidedWith(otherObject)
                            otherObject.collidedWith(object)
                        }
                    }
                }
            }
                
            // Update object's state
            object.update(dt)
            // Redraw the object
            object.draw(dt)
        }

        // Clean up the scene - objects marked
        // for removal will be deleted from the
        // scene
            
        // Create a new array for objects to be
        // retained (building an array is often
        // faster than removing items from exisisting
        // one)
        var objectsToRetain: [GameObject] = []
            
        // Iterate over all scene objects in the scene
        for object in self.objects {
            if !object.destroyMe {
                // Retain objects not marked for
                // destruction
                objectsToRetain.append(object)
            } else if let parent = object.parent {
                // For object that is marked for desctruction
                // check if their parent marked for destruction
                if !parent.destroyMe {
                    // If parent not being destroyed, then
                    // remove the current object from the list
                    // of parent's children
                    for i in 0..<parent.children.count {
                        if object === parent.children[i] {
                            parent.children.removeAtIndex(i)
                            break
                        }
                    }
                }
            }
        }
        // Set scene objects to the array of objects
        // to retain
        objects = objectsToRetain
    }
    
    /**
    Adds a game object to the scene.  This method is
    different from registering an object, because it's
    meant to be used externally.  It essentially
    adds the object to the scene as the child of the 
    root game object.  Any game object that is explicitly
    made a child of another game object that is 
    already in the scene does not need to
    be added to the scene with this method.
    
    - parameter object: Game object to add to the scene at the
    top level of game object hierarchy
    
    */
    public func addGameObject(object: GameObject) {
        root.addChild(object)
        if let collider=object.collider {
            object.scene?.registerGameObject(collider)
        }
    }    

    deinit {
        print("Scene deinit.")
    }
}
