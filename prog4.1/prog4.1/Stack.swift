//
//  Stack.swift
//  prog4.1
//
//  Created by Benjaman Dutton on 8/6/16.
//  Copyright © 2016 Benjaman Dutton. All rights reserved.
//

import Foundation

class Stack : LinkedList {
    
    override var description: String {
        return "(Stack)"+super.description+"<-->"
    }
    
    func push(object: Any) {
        self.addObject(object);
    }
    
    func pop() -> Any? {
        if let n = tail {
            self.removeNode(n)
            return n.object
        } else {
            return nil
        }
    }
}