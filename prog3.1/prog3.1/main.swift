//
//  main.swift
//  prog3.1
//
//  Created by Benjaman Dutton on 8/2/16.
//  Copyright © 2016 Benjaman Dutton. All rights reserved.
//

import Foundation

var x: SimpleOptional;

x = NIL
print("x=\(x)")

if x == NIL {
    print("x has no value")
}else {
    print("x has a value of \(x.unwrap)")
}

x = SimpleOptional(value: 3)

print("x=\(x)")

if x != NIL {
    print("x has a value of \(x.unwrap)")
}else {
    print("x has no value")
}

var z: SimpleOptional

z = SimpleOptional(value: Fraction(num: 1, den: 3))

print("z=\(z)")

if z != NIL {
    print("z has a value of \(z.unwrap)")
    
    let v = z.unwrap as! Fraction
    
    print("The decimal property of z's value is \(v.decimal)")
} else {
    print("z has no value")
}