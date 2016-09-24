//
//  Complex.swift
//  prog3.3
//
//  Created by Benjaman Dutton on 8/3/16.
//  Copyright © 2016 Benjaman Dutton. All rights reserved.
//

import Foundation

class Complex : CustomStringConvertible {
    
    var real: Float;
    var imag: Float;
    
    var magnitude: Float {
        return real*real + imag*imag
    }
    
    var description: String {
        return ("\(self.real)+\(self.imag)i")
    }
    
    init(real: Float, imag : Float) {
        self.real = real
        self.imag = imag
    }
    
    convenience init() {
        self.init(real: 0,imag: 0)
    }
    
    static func add(c1: Complex, to c2: Complex) -> Complex {
        return Complex(real: c1.real+c2.real,imag: c1.imag + c2.imag)
    }
    
    static func subtract(c1: Complex, from c2: Complex) -> Complex {
        return Complex(real: c1.real - c2.real, imag: c1.imag - c2.imag)
    }
    
    static func multiply(c1: Complex, by c2: Complex) -> Complex {
        return Complex(real: c1.real*c2.real - c1.imag*c2.imag,imag: c1.real*c2.imag + c1.imag*c2.real)
    }
    
    static func divide(c1: Complex, by c2: Complex) -> Complex {
        return Complex(real: (c1.real*c2.real + c1.imag*c2.imag)/c2.magnitude,imag: (c1.imag*c2.real - c1.real*c2.imag)/c2.magnitude)
    }
    
    func copy() -> Complex{
        return Complex(real: self.real, imag: self.imag)
    }
}

func +(c1: Complex, c2: Complex) -> Complex {
    return Complex.add(c1,to: c2)
}

func -(c1: Complex, c2: Complex) -> Complex {
    return Complex.subtract(c1, from: c2)
}

func *(c1: Complex, c2: Complex) -> Complex {
    return Complex.multiply(c1, by: c2)
}

func /(c1: Complex, c2: Complex) -> Complex {
    return Complex.divide(c1, by: c2)
}

func +(c: Complex, x: Float) -> Complex {
    return Complex.add(c, to: Complex(real:x, imag: 0))
}

func -(c: Complex, x: Float) -> Complex {
    return Complex.subtract(c,from: Complex(real:x, imag: 0))
}

func *(c: Complex, x: Float) -> Complex {
    return Complex.multiply(c, by: Complex(real: x, imag: 0))
}

func /(c: Complex,x: Float) -> Complex {
    return Complex.divide(c, by: Complex(real: x, imag: 0))
}