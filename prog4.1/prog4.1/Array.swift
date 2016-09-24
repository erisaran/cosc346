//
//  Array.swift
//  prog4.1
//
//  Created by Benjaman Dutton on 8/6/16.
//  Copyright © 2016 Benjaman Dutton. All rights reserved.
//

import Foundation

class Array : SortableList {
    
    private var _count: Int;
    
    override var count: Int {
        return self._count;
    }
    
    override init(list: LinkedList? = nil) {
        self._count = 0;
        super.init(list: list);
    }
    
    override func addObject(object: Any) {
        super.addObject(object);
        self._count += 1
    }
    
    override func removeNode(node: Node) -> Bool {
        let nodeRemoved: Bool = super.removeNode(node);
        if nodeRemoved {
            self._count -= 1
        }
        return nodeRemoved
    }
    
    override var description: String {
        return "(Array) 0->\(super.description)<-\(self.count - 1)"
    }
    
    func getObject(i: Int) -> Any {
        return getNodeAtIndex(i)!.object
    }
    
    func setObject(o: Any, at i: Int) {
        if i > 0 {
            let n: Node = (getNodeAtIndex(i))!
            n.swapObjectsWith(Node(object: o))
        }
    }
    
    subscript(index: Int) -> Any {
        get {
            return self.getObject(index)
        }
        set(newObject) {
            self.setObject(newObject, at: index)
        }
    }
}