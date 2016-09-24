//
//  LinkedList.swift
//  prog3.1
//
//  Created by Lech Szymanski on 2/05/15.
//  Copyright (c) 2015 Lech Szymanski. All rights reserved.
//

/**
 A list node containing a reference to an object
 and a reference to the next node
 
 */
class Node<T> {
    
    // STORED PROPERTIES
    
    var object: T  //Reference to the listed object
    var next : Node<T>?       //Optional reference to the next node
    
    // INITIALISERS
    
    /**
     Designated initialiser
     
     - parameter object: Object referenced by the node
     */
    init(object: T) {
        self.object = object
        // By default, this node
        // doesn't have a next node
        // to point to
        self.next = nil;
    }
}

/**
 Linked list of objects
 
 */
class LinkedList<U> : CustomStringConvertible {
    
    // STORED PROPERTIES
    
    var head: Node<U>?  // Reference to the head node
    var tail: Node<U>?  // Reference to the tail node
    
    // COMPUTED PROPERTIES
    
    /**
     Checks if list is empty
     
     - returns: Bool True if list is empty, false otherwise.
     */
    var empty: Bool {
        if tail != nil {
            return false
        } else {
            return true
        }
    }
    
    /**
     Counts the number of the items in the list
     
     - returns: Int Number of items in the list.
     */
    var count: Int {
        
        var nodeCount: Int = 0
        
        //Starting with the head, walk
        //through the list until the next
        //node points to nil
        var node: Node<U>? = head;
        while let n = node {
            //Count the node
            nodeCount += 1
            //Get the reference to the next node
            node = n.next
        }
        
        return nodeCount
    }
    
    /**
     String representation of the list
     
     - returns: String String representation of the list.
     */
    var description: String {
        
        //The beginning of the list is marked
        //with the left-square bracket
        var descStr: String = "["
        
        //Walk through all the nodes and a string
        //representation of each object's contents
        //to descStr
        var node: Node<U>? = head
        while let n = node {
            descStr += "\(n.object)"
            node = n.next
            if(node != nil) {
                descStr += ", "
            }
        }
        //Close the description string
        //with the right-square bracket
        descStr += "]"
        return descStr
        
    }
    
    // INITIALISERS
    
    /**
     Designated initialiser
     
     - parameter list: Linked list to initialise with (nil by default)
     */
    init(list: LinkedList<U>? = nil) {
        
        //Set the list to empy
        self.head = nil
        self.tail = nil
        
        //If argument is not nil, then
        //add objects form that list to
        //this one
        if let newList = list {
            var node: Node? = newList.head
            while let n = node {
                self.addObject(n.object)
                node = n.next
            }
        }
        
    }
    
    // METHODS
    
    /**
     Adds an object to the list
     
     - parameter object: Object to add to the list
     */
    func addObject(object: U) {
        //Create a new node pointing to the
        //object to be added
        let node: Node<U> = Node<U>(object: object)
        
        //Add the node to the list
        if let t = tail {
            // If list is not empty, point its
            // last node to the new node and
            // point the tail to the new node
            t.next = node
            tail = node
        } else {
            // If list is empty, point the
            // head and tail to the new node
            head = node
            tail = node
        }
    }
    
    /**
     Removes a node from list
     
     - parameter node: Node to remove from the list
     - returns: Bool True if node found in the list and removed,
     false otherwise.
     */
    func removeNode(node: Node<U>) -> Bool {
        
        var nodeFound = false
        
        //Find the node preceding the one
        //to be removed - list is not double
        //linked, so we need to walk through it
        //form the head until we find the node
        //with next link to the node to be removed
        var prevNode: Node<U>? = nil
        var nextNode: Node<U>? = head
        while let n = nextNode {
            //Check if next node is the node
            //to be removed...the === is an
            //address comparison operator;
            //the n is the unwrapped
            //optional
            if(n === node) {
                nodeFound = true
                break;
            }
            prevNode = nextNode;
            nextNode = n.next
        }
        
        
        if nextNode !== node {
            prevNode = nil;
        }
        
        // If node to be removed is
        // the last one in the list,
        // set tail to the previous node,
        if tail === node {
            nodeFound = true
            if let n = prevNode {
                n.next = nil
            }
            tail = prevNode
            prevNode = nil
        }
        
        // If the list is empty,
        // set head to nil as well
        if tail == nil {
            head = nil
        }
        
        // If node to be removed is
        // the first one in the list,
        // set head to the next node
        if head === node {
            nodeFound = true
            head = node.next
        }
        
        // If head points to nil,
        // then we have empty list
        // and need to set tail accordingly
        if head == nil {
            tail = nil
        }
        
        // Relink the node preceeding
        // the one that we are removing
        // to the node following the one
        // that we are removing
        if let n = prevNode {
            n.next = node.next
        }
        return nodeFound
    }
    
    /**
     
     Removes all objects from the list
     
     */
    func removeAll() {
        head = nil
        tail = nil
    }
    
    
    
}