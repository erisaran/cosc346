//
//  Queue.swift
//  prog5.1
//
//  Created by Benjaman Dutton on 8/17/16.
//  Copyright © 2016 Benjaman Dutton. All rights reserved.
//

import Foundation

class Queue<T> : LinkedList<T> {
    
    override var description: String {
        return "(Queue)<---"+super.description+"<--"
    }
    
    override init(list: LinkedList<T>? = nil) {
        super.init(list: list)
    }
    
    func put(object: T) {
        self.addObject(object);
    }
    
    /**
     Gets an an object from the start of the queue
     
     - returns: AnyT? Object removed from the start of the queue,
     nil if queue is empy.
     */
    func get() -> T? {
        if let n = head {
            self.removeNode(n)
            return n.object
        } else {
            return nil
        }
    }
}