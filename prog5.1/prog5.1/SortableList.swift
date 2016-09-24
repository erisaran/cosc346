//
//  SortableList.swift
//  prog5.1
//
//  Created by Benjaman Dutton on 8/17/16.
//  Copyright © 2016 Benjaman Dutton. All rights reserved.
//

import Foundation


extension Node {
    
    func swapObjectsWith(n: Node<T>) {
        let temp: T = self.object
        self.object = n.object
        n.object = temp
    }
}

class SortableList<T> : LinkedList<T> {
    
    override init(list: LinkedList<T>? = nil) {
        super.init(list:list)
    }
    
    func getNodeAtIndex(index: Int) -> Node<T>? {
        var node: Node<T>? = head;
        
        if index > 0 {
            for _ in 1...index {
                if let n = node {
                    node = n.next;
                } else {
                    return nil;
                }
            }
        }
        return node;
    }
    
    func sort(isObject: (T, smallerThan: T) -> Bool) {
        
        while true {
            var swap: Bool = false;
            var nodeLeft: Node<T>? = head
            
            while let nLeft = nodeLeft {
                if let nRight = nLeft.next {
                    if(isObject(nRight.object, smallerThan: nLeft.object)) {
                        nLeft.swapObjectsWith(nRight)
                        swap = true
                    }
                }
                nodeLeft = nLeft.next
            }
            if !swap {
                break;
            }
        }
    }
}