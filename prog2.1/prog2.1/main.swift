//
//  main.swift
//  prog2.1
//
//  Created by Benjaman Dutton on 7/20/16.
//  Copyright © 2016 Benjaman Dutton. All rights reserved.
//

import Foundation

var u: Fraction
u = Fraction(num: 2, den: 3)
var x: Fraction = Fraction(num: -5)

print("u=\(u.description)")
print("decimal value of u=\(u.decimal)")

print("x=\(x.description)")
print("decimal value of x= \(x.decimal)")

var v = Fraction(num: -7, den: 9)

print("v=\(v.description)")
print("decimal value of v=\(v.decimal)")

var f: Fraction

f = u+v
print("(" + u.description + ")+(" + v.description + ")=" + f.description)

f = v-u
print("(" + u.description + ")+(" + v.description + ")=" + f.description)

f = u*v
print("(" + u.description + ")+(" + v.description + ")=" + f.description)

f = u/v
print("(" + u.description + ")+(" + v.description + ")=" + f.description)

f = u+3
print("(" + u.description + ")+3=" + f.description)

let z: Int = 2
f = u/z
print("(" + u.description + ")/\(z)=" + f.description)