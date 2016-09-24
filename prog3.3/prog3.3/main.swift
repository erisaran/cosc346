//
//  main.swift
//  prog3.3
//
//  Created by Benjaman Dutton on 8/3/16.
//  Copyright © 2016 Benjaman Dutton. All rights reserved.
//

import Foundation

var x: Complex = Complex(real: 1.2, imag: -3.6)
print("x=\(x)")

var y: Complex = Complex(real: -0.5, imag: 2.3)
print("y=\(y)")

var z: Complex = x.copy()
z.imag = 1.0
print("z=\(z)")

print("x+y=\(x+y)")
print("x-y=\(x-y)")
print("x*y=\(x*y)")
print("x/y=\(x/y)")

print("x+3.0=\(x+3.0)")
print("x-2.1=\(x-2.1)")
print("x*7.5=\(x*7.5)")
print("x/4.2=\(x/4.2)")