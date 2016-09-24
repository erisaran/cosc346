//
//  Stack.swift
//  prog5.1
//
//  Created by Benjaman Dutton on 8/17/16.
//  Copyright © 2016 Benjaman Dutton. All rights reserved.
//

import Foundation

class Stack<T> : LinkedList<T> {
    
    override var description: String {
        return "(Stack)"+super.description+"<-->"
    }
    
    override init(list: LinkedList<T>? = nil) {
        super.init(list: list)
    }
    
    func push(object: T) {
        self.addObject(object);
    }
    
    func pop() -> T? {
        if let n = tail {
            self.removeNode(n)
            return n.object
        } else {
            return nil
        }
    }
}