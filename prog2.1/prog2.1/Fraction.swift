//
//  Fraction.swift
//  prog2.1
//
//  Created by Benjaman Dutton on 7/20/16.
//  Copyright © 2016 Benjaman Dutton. All rights reserved.
//

import Foundation

class Fraction {
    
    private let num: Int;
    private let den: Int;
    
    var decimal: Float {
        get {
            return Float(self.num)/Float(self.den);
        }
    }
    
    var description: String {
        if (den == 1){
            return "\(self.num)"
        }else if (num > den) {
            return "\(self.num/self.den) \(self.num%self.den)/\(self.den)"
        }else {
            return "\(self.num)/\(self.den)"
        }
    }
    
    convenience init() {
        self.init(num: 0, den: 1)
    }
    
    init(num : Int, den : Int){
        assert(den != 0, "Denominator cant be 0")
        var num = num;
        var den = den;
        if(den < 0){
            num = -num;
            den = -den;
        }
        for gcd in (1...den).reverse(){
            if(num%gcd == 0 && den%gcd == 0) {
                num /= gcd;
                den /= gcd;
                break;
            }
        }
        self.num = num
        self.den = den
    }
    
    convenience init(num : Int){
        self.init(num: num, den: 1);
    }
    
    func add(f: Fraction) -> Fraction {
        return Fraction(num: self.num*f.den + self.den*f.num, den: self.den*f.den)
    }
    
    func subtract(f: Fraction) -> Fraction {
        return Fraction(num: self.num*f.den - self.den*f.num, den: self.den*f.den)
    }
    
    func multiply(f: Fraction) -> Fraction {
        return Fraction(num: self.num*f.num, den: self.den*f.den)
    }
    
    func divide(f: Fraction) -> Fraction {
        return Fraction(num: self.num*f.den, den: self.den*f.num)
    }
    
    static func add(f1: Fraction, to f2: Fraction) -> Fraction {
        return Fraction(num: f1.num*f2.den + f1.den*f2.num, den: f1.den*f2.den)
    }
    
    static func subtract(f1: Fraction, from f2: Fraction) -> Fraction{
        return f2.subtract(f1);
    }
    
    
    static func multiply(f1: Fraction, by f2: Fraction) -> Fraction {
        return f1.multiply(f2)
    }
    
    static func divide(f1: Fraction, by f2: Fraction) -> Fraction {
        return f1.divide(f2)
    }
    
    func add(x: Int) -> Fraction {
        return Fraction(num: self.num + self.den*x, den: self.den)
    }
    
    func subtract(x: Int) -> Fraction {
        return Fraction(num: self.num - self.den*x, den: self.den)
    }
    
    func multiply(x: Int) -> Fraction {
        return Fraction(num: self.num*x, den: self.den)
    }
    
    func divide(x: Int) -> Fraction {
        return Fraction(num: self.num, den: self.den*x)
    }

}

func +(f1: Fraction, f2: Fraction) -> Fraction {
    return f1.add(f2)
}

func -(f1: Fraction, f2: Fraction) -> Fraction {
    return f1.subtract(f2)
}

func *(f1: Fraction, f2: Fraction) -> Fraction {
    return f1.multiply(f2)
}

func /(f1: Fraction, f2: Fraction) -> Fraction {
    return f1.divide(f2)
}

func +(f1: Fraction, x: Int) -> Fraction {
    return f1.add(x)
}

func -(f1: Fraction, x: Int) -> Fraction {
    return f1.subtract(x)
}

func *(f1: Fraction, x: Int) -> Fraction {
    return f1.multiply(x)
}

func /(f1: Fraction, x: Int) -> Fraction {
    return f1.divide(x)
}