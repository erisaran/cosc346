//
//  main.swift
//  prog4.1
//
//  Created by Benjaman Dutton on 8/5/16.
//  Copyright © 2016 Benjaman Dutton. All rights reserved.
//

import Foundation

let str1: String = "Item V";
let str2: String = "Item E";
let str3: String = "Item S";
let str4: String = "Item M";

var list: LinkedList = LinkedList()
print("\(list)")

list.addObject(str1)
list.addObject(str2)
list.addObject(str3)
list.addObject(str4)
print("\(list)")

var queue: Queue = Queue(list: list)
print("\n\(queue)")

if let item1 = queue.get() {
    print("Got item: \(item1 as! String)")
}
print("\(queue)")

print("Putting item: \(str2)")
queue.put(str2)
print("\(queue)")

var stack: Stack = Stack(list: list)
print("\n\(stack)")

if let item2 = stack.pop() {
    print("Popped item: \(item2 as! String)")
}
print("\(stack)")
print("Pushing item: \(str2)")
stack.push(str2)
print("\(stack)")

var array: Array = Array(list: list)
print("\n\(array)")

print("Setting array[2] to \(str1)")
array[2] = str1
print("\(array)")

print("Sorting array")
array.sort({o1, o2 in (o1 as! String) < (o2 as! String)})
for index in 0..<array.count {
    print("array[\(index)]=\(array[index])")
}