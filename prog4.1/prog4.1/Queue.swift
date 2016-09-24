//
//  Queue.swift
//  prog4.1
//
//  Created by Benjaman Dutton on 8/5/16.
//  Copyright © 2016 Benjaman Dutton. All rights reserved.
//

import Foundation

class Queue : LinkedList {
    
    override var description: String {
        return "(Queue)<---"+super.description+"<--"
    }
    
    func put(object: Any) {
        self.addObject(object);
    }
    
    func get() -> Any? {
        if let n = head {
            self.removeNode(n)
            return n.object
        } else {
            return nil
        }
    }
}