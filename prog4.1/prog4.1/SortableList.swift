//
//  SortableList.swift
//  prog4.1
//
//  Created by Benjaman Dutton on 8/6/16.
//  Copyright © 2016 Benjaman Dutton. All rights reserved.
//

import Foundation

extension Node {
    
    func swapObjectsWith(n: Node) {
        let temp: Any = self.object
        self.object = n.object
        n.object = temp
    }
}

class SortableList : LinkedList {
    
    func getNodeAtIndex(index: Int) -> Node? {
        var node: Node? = head;
        
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
    
    func sort(isObject: (Any, smallerThan: Any) -> Bool) {
        
        while true {
            var swap: Bool = false;
            var nodeLeft: Node? = head
            
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