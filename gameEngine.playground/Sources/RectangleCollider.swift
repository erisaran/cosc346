//
//  RectangleCollider.swift
//
//  Created by Lech Szymanski on 24/07/15.
//  Copyright (c) 2015 Lech Szymanski. All rights reserved.
//


import Cocoa
import SpriteKit

/**
Circular collider game object

Provides visualisation as well as computations for
collisions between rectangular colliders (also supports
collisions with circle colliders)

Only axis aligned rectangular colliders are
supported
*/
public class RectangleCollider: Collider {
    // Width and height of the rectangle
    let width, height: CGFloat

    /**
    Designated initialiser

    - parameter widht: Width of the collider
    - parameter height: Height of the collider
    */
    public init(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
        print("Rectangle:", terminator: "")
        super.init()
    }
    
    /**
    Game object code to run before
    starting the game loop
    */
    override public func start() {
        if let scene = self.scene {
            if scene.debug {
                // If scene is in debug mode, add a visualisation of the
                // collider to the scene - a green rectangle
                let shape = SKShapeNode(rectOfSize: CGSize(width: self.width, height: self.height))
                shape.strokeColor = NSColor.greenColor()
                self.render = shape
                scene.registerGameObject(self)
            }
        }
    }

    /**
    Detect collsion between line segment and a circle - the underscores signify the
    absence of the named parameters - that allows the method to be invoked without providing
    the names of the parameters.  The method is private, so that calling it without parameter
    names is just less verbose
    
    - parameter p0: One end point of the line segment
    - parameter p1: Other end opoint of the line segment
    - parameter q: Centre of the circle
    - parameter radius: Radius of the circle
    
    - returns: Bool True if line segment intersects the circle, false otehrwise
    */
    private func EdgeIntersectCircle(p0: CGPoint, _ p1: CGPoint, _ q: CGPoint, _ radius: CGFloat) -> Bool {
        
        // First compute perpandicular projection from circle centre q
        // to the the line going through p0 and p1 and find
        // point r on the line that is closest to q
        let a = p1.x-p0.x
        let b = p1.y-p0.y
        let c = p0.y-p1.y
        let d = p1.x-p0.x
        let e = q.x*(p1.x-p0.x)+q.y*(p1.y-p0.y)
        let f = p0.y*(p1.x-p0.x)-p0.x*(p1.y-p0.y)
        
        let y = (a*f-c*e)/(a*d-b*c)
        
        var x: CGFloat
        if p1.x==p0.x {
            x = (f-d*y)/b
        } else {
            x = (e-b*y)/a
        }
        
        // r is the point on line going through p0 and p1
        // that is closest to q
        let r = CGPoint(x: x, y: y)
        
        // Check distance between q and r - if that distance
        // is more than circle's radius, then the line is
        // definitely not crossing the circle
        let qr = q-r
        let distance = sqrt(qr.x*qr.x+qr.y*qr.y)
        
        if distance > radius {
            return false
        }
        
        // Check whether point r lies between p0 and p1 - if
        // not, then the line definitely doesn't cross the cricle
        let d1 = p0-r
        let d2 = p1-r
        
        let dotp1 = d1.x*d2.x+d1.y*d2.y
        
        
        if dotp1 > 0 {
            return false
        }
        
        
        // If we get to here, this means the closest point between
        // circle's centre and the line going through p0 and p1 is
        // falls between p0 and p1 and is within radius distance - 
        // the line segment crosses the circle
        return true
    }
    
    /**
    Code doing the actual collision detection for
    this collider
    */
    override public func inCollisionWith(other: Collider) -> Bool {
        
        // Convert self to CG rectangle
        let size = CGSize(width: self.width, height: self.height)
        let pos = self.absolutePosition
        let origin = pos-CGPoint(x: self.width/2, y: self.height/2)
        let rect = CGRect(origin: origin, size: size)
     
        if other is RectangleCollider {
            // If other collider is also a rectangle collider,
            // convert it to CG recntangle and use Cocoa's
            // provided library for checking intersect of two
            // rectangles
            let rectangle = other as! RectangleCollider
            let sizeOther = CGSize(width: rectangle.width, height: rectangle.height)
            let posOther = rectangle.absolutePosition
            let originOther = posOther-CGPoint(x: rectangle.width/2, y: rectangle.height/2)
            let rectOther = CGRect(origin: originOther, size: sizeOther)

            return CGRectIntersectsRect(rect, rectOther)
            
        } else if other is CircleCollider {
            // If other collider is a circle, first use 
            // Cocoa's provided libary to check if the rectangle
            // collider contains point where circle's centre is
            // located
            let circle = other as! CircleCollider
            let circleCentre = other.absolutePosition
            if CGRectContainsPoint(rect, circleCentre) {
                return true
            }
            // Otherwise, check for intersection between the edges of
            // the rectangle and the circle
            let e1 = pos+CGPoint(x: -self.width/2, y: -self.height/2)
            let e2 = pos+CGPoint(x: -self.width/2, y: self.height/2)
            let e3 = pos+CGPoint(x: self.width/2, y: self.height/2)
            let e4 = pos+CGPoint(x: self.width/2, y: -self.height/2)
            
            let radius = circle.radius
            
            // Check if left vertical edge intersects the circle collider
            if EdgeIntersectCircle(e1, e2, circleCentre, radius) {
                return true
            }
            
            // Check if top horizontal edge intersects the circle collider
            if EdgeIntersectCircle(e2, e3, circleCentre, radius) {
                return true
            }
            
            // Check if right vertical edge intersects the circle collider
            if EdgeIntersectCircle(e3, e4, circleCentre, radius) {
                return true
            }
            
            // Check if bottom horizontal edge intersects the circle collider
            if EdgeIntersectCircle(e4, e1, circleCentre, radius) {
                return true
            }
            
            // If circle centre is not within the rectangle of this
            // collider, nor do any of its edges cross the circle,
            // then there is no collision
            return false
        }
        
        // If other collider unknown, return default anser
        // provided by the parent
        return super.inCollisionWith(other)
    }
    
    deinit {
        print("Rectangle:", terminator: "")
    }
    
}