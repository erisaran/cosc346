//
//  Array.swift
//  prog5.1
//
//  Created by Benjaman Dutton on 8/17/16.
//  Copyright © 2016 Benjaman Dutton. All rights reserved.
//

import Foundation

class Array<T> : SortableList<T> {
    
    private var _count: Int;
    
    override var count: Int {
        return self._count;
    }
    
    override init(list: LinkedList<T>? = nil) {
        self._count = 0;
        super.init(list: list);
    }
    
    override func addObject(object: T) {
        super.addObject(object);
        self._count += 1
    }
    
    override func removeNode(node: Node<T>) -> Bool {
        let nodeRemoved: Bool = super.removeNode(node);
        if nodeRemoved {
            self._count -= 1
        }
        return nodeRemoved
    }
    
    override var description: String {
        return "(Array) 0->\(super.description)<-\(self.count - 1)"
    }
    
    func getObject(i: Int) -> T {
        return getNodeAtIndex(i)!.object
    }
    
    func setObject(o: T, at i: Int) {
        if i > 0 {
            let n: Node<T> = (getNodeAtIndex(i))!
            n.swapObjectsWith(Node<T>(object: o))
        }
    }
    
    subscript(index: Int) -> T {
        get {
            return self.getObject(index)
        }
        set(newObject) {
            self.setObject(newObject, at: index)
        }
    }
}