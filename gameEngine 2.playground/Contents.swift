///: Playground - noun: a place where people can play
//
//  Created by Lech Szymanski on 24/07/15.
//  Copyright (c) 2015 Lech Szymanski. All rights reserved.
//

///: Playground - noun: a place where people can play
//
//  Created by Lech Szymanski on 24/07/15.
//  Copyright (c) 2015 Lech Szymanski. All rights reserved.
//

/**
 When you open this project first time wait patiently for all the support code to compile - it might take some time.  Support code is compiled just once.  Afterwards you can make changes to the code below, and playgrounds should be pretty "swift" in recompling just this part and reruning the program.
 
 The game engine library can be found in project Sources.  If you can't see the Sources, select "View->Navigators->Show Project Navigator" from the main menu and expand the folder under the plaground there.  Projec navigator will show Sources as well as the Resources, where new images can be added.
 
 The game demo is rendered in the Assistant Editor - to see the editor select "View->Assistant Editor->Show Assistant Editor"
 
 The game engine library provides game objects that can be placed in a scene.  The game engine will run the game logic for specified amount of time at specified frame rate.
 
 The inheritance hierarchy of the game object classes provided by the library is as follows:
 
 
                        GameObject
                        /     \
                       /       \
                      /         \
                     /           \
                    /             \
                   /               \
               Sprite            Collider
                                 /     \
                                /       \
                               /         \
                              /           \
                             /             \
                     CircleCollider    RectangularCollider
 
 
 The code below specifies the behaviour of Sprite objects by creating a Player and Enemy
 subclasses.  Both classes override GameObject's update method specifying the movement of these new game objects in the scene.  The Player game object also overrides the method that is invoked when its collider is in collision with another object's collider.
 
 Below is a pseudocode diagram showing invocations of the methods for every game object in the scene when the engine is running.
 
        -----------
        | start() |
        -----------
             |
             V
          /-----\
         /       \     No
 /----->/ next    \-------------------> end scene
 |      \  frame? /
 |       \       /
 |        \-----/
 |           |
 |           | Yes
 |           V
 |        /-----\
 |       /       \
 |      /collider \  No
 |      \ is nil? /-------\
 |       \       /        |
 |        \-----/         V
 |           |         /-----\
 |           |        / colli-\
 |           |  No   /sion with\
 |           |<----- \ other   /
 |           |        \object?/
 |           |         \-----/
 |           |            |
 |           |            |Yes
 |           |            V
 |           |   ------------------------
 |           |   | collidedWith(other:) |
 |           |   ------------------------
 |           |            |
 |           |<-----------/
 |           |
 |           V
 |     ---------------
 |     | update(dt:) |
 |     ---------------
 |           |
 \-----------/
 
 */

import Cocoa

/*
Game object with behaviour specific to the player

*/
class Player: Sprite {

    override init(imageNamed: String, scale: CGFloat) {
        print("Player:", terminator: "")
        super.init(imageNamed: imageNamed, scale: scale)
    }
    
    /**
    Specifies object behaviour when collided with another
    object
    
    - parameter other: Game object with which there was a collision
    */
    override func collidedWith(other: GameObject) {
        // If collided with an Enemy game object,
        // destory self
        if other is Enemy {
            self.destroy()
        }
    }

    /**
    Specifies object state change in each frame
    
    - parameter dt: Time passed since last update
    */
    override func update(dt: CGFloat) {
        // Define the velocity vector (magnitude is
        // speed, direction is the direction of movement)
        let velocity = CGVector(dx: -20, dy: 0)
        
        // Compute the change in position based on
        // velocity and time passed since last update
        self.position.x += velocity.dx*dt
        self.position.y += velocity.dy*dt
    }
    
    deinit {
        print("Player:", terminator: "")
    }
}

/**
Game object with behaviour specific to an enemy

*/
class Enemy: Sprite {


    override init(imageNamed: String, scale: CGFloat) {
        super.init(imageNamed: imageNamed, scale: scale)
    }
    
    /**
    Specifies object state change in each frame
    
    - parameter dt: Time passed since last update
    */
    override func update(dt: CGFloat) {
        // Define the velocity vector (magnitude is
        // speed, direction is the direction of movement)
        let velocity = CGVector(dx: 70, dy: -70)
        
        // Compute the change in position based on
        // velocity and time passed since last update
        self.position.x += velocity.dx*dt
        self.position.y += velocity.dy*dt
    }
}


repeat {
    // Create a new scene
    var scene: Scene = Scene(width: 600, height: 600)
    
    // Create a static background sprite
    // and add it to the scene - default position is (0,0)
    scene.addGameObject(Sprite(imageNamed: "sun.png", scale: 0.5))


    // Create player object and add it to the scene - default
    // position is (0,0)
    var rocket = Player(imageNamed: "rocket.png", scale: 0.5)
    rocket.collider = RectangleCollider(width: 120, height: 60)
    scene.addGameObject(rocket)

    // Create enemy object, palce it at position (-150,150)
    // and add it to the scene
    var asteroid = Enemy(imageNamed: "asteroid.png", scale: 0.2)
    asteroid.position = CGPoint(x: -150, y: 150)
    asteroid.collider = CircleCollider(radius: 20)
    scene.addGameObject(asteroid)

    // Run the game engine
    runScene(scene, forTimeInSeconds: 5, atFrameRate: 10)
} while(false)

