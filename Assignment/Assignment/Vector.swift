//
//  Vector.swift
//  Assignment
//
//  Created by Benjaman Dutton on 8/30/16.
//  Copyright © 2016 Benjaman Dutton. All rights reserved.
//

import Foundation

public class Vector<T: MatrixData> : BasicVector, VectorArithmetic, VectorToMatrix {
    
    private var numbers = [T]()
    private var iscol = false

    /**
    Initialiser to create a zero value vector of a specified size
    parameter - Int size of the vector
    */
    public init(size: Int){
        assert(size > 0, "Size must be greater than 0")
        numbers = [T](count: size, repeatedValue: T())
    }
    
    /**
    Initialiser that takes an array of numbers and assigns them to the vector object
    parameter - [T] array representing the values of the vector
 */
    public init(nums: [T]){
        assert(nums.count > 0, "Vector length must be greater than 0")
        numbers = nums
    }
    
    /** Initialiser that takes and array and also sets a boolean flag indicating if the vector is a column
    parameter - [T] nums array of generics representing the values
    parameter - Bool isColumn a boolean of whether or not it is a column
 */
    public init(nums: [T], isColumn: Bool){
        assert(nums.count > 0, "Vector length must be greater than 0")
        numbers = nums
        self.iscol = isColumn
    }
    
    /** description string of the vector
    puts whitespace between the values but does not put any at the beginning or the end
 */
    public var description: String {
        var des = ""
        for i in 0..<numbers.count {
            if i == (numbers.count - 1) {
                des += "\(numbers[i])"
            }else {
                des += "\(numbers[i]) "
            }
        }
        return des
    }
    
    /** Gets or sets the value at the specified index
     parameter - Int index of the value to change
     return - T the value at the index
    */
    public subscript(index: Int) -> T {
        get {
            assert(index >= 0 && index < self.numbers.count, "Index out of range")
            return self.numbers[index]
        }
        set {
            assert(index >= 0 && index < self.numbers.count, "Index out of range")
            self.numbers[index] = newValue
        }
    }
    
    /**
     returns the size of the vector
 */
    public var size: Int {
        get {
            return numbers.count
        }
    }
    /** Returns a matrix representing the vector, if the vector is flagged as a column it will be a single column matrix
     return - Matrix<T> which is the vector as a matrix
    */
    public var matrixview: Matrix<T> {
        get {
            if !iscol {
                return Matrix<T>(withVectors: [self])
            }else {
                var v = [Vector<T>]()
                for i in 0..<self.size {
                    v.append(Vector<T>(nums: [numbers[i]]))
                }
                return Matrix<T>(withVectors: v)
            }
        }
    }
    /**
     makes a deep copy of the vector with the same values
     uses some maths to get the compiler to assign the value to a new T object rather than just referencing the T from the old array
     return - Vector<T> a new vector with the old values
    */
    public func copy() -> Vector<T> {
        var n = [T]()
        for i in 0..<numbers.count {
            n.append(numbers[i] * numbers[i])
            n[i] = n[i] / numbers[i]
        }
        let x = Vector<T>(nums: n)
        return x
    }
    
    /** Computes the dot product of two vectors
     parameter v - Vector<T> to use to compute the dot product of this vector with
     return - T a scalar value of the dot product
    */
    public func dot(v: Vector<T>) -> T {
        assert(self.size == v.size, "Vectors must be the same size")
        var product = self.numbers[0] * v[0]
        for i in 1..<self.size {
            product = product + self.numbers[i] * v[i]
        }
        return product
    }
}


private func *<T: MatrixData>(a: T, b: T) -> T{
    return a * b
}

private func +<T: MatrixData>(a:T , b: T) -> T {
    return a + b
}

private func -<T: MatrixData>(a: T, b: T) -> T {
    return a - b
}

private func /<T: MatrixData>(a: T, b: T) -> T {
    return a / b
}

public func *<T: MatrixData>(lhs: Vector<T>, rhs: Vector<T>) -> T {
    return lhs.dot(rhs)
}

public func +<T: MatrixData>(lhs: Vector<T>, rhs: Vector<T>) -> Vector<T> {
    assert(lhs.size == rhs.size, "Vectors must be same size")
    var a = [T]()
    for i in 0..<lhs.size {
        a.append(lhs[i] + rhs[i])
    }
    return Vector<T>(nums: a)
}

public func -<T: MatrixData>(lhs: Vector<T>, rhs: Vector<T>) -> Vector<T> {
    assert(lhs.size == rhs.size, "Vectors must be same size")
    var a = [T]()
    for i in 0..<lhs.size {
        a.append(lhs[i] - rhs[i])
    }
    return Vector<T>(nums: a)
}

public func +<T: MatrixData>(lhs: Vector<T>, rhs: T) -> Vector<T> {
    var a = [T]()
    for i in 0..<lhs.size {
        a.append(lhs[i] + rhs)
    }
    return Vector<T>(nums: a)
}

public func -<T: MatrixData>(lhs: Vector<T>, rhs: T) -> Vector<T> {
    var a = [T]()
    for i in 0..<lhs.size {
        a.append(lhs[i] - rhs)
    }
    return Vector<T>(nums: a)
}

public func *<T: MatrixData>(lhs: Vector<T>, rhs: T) -> Vector<T> {
    var a = [T]()
    for i in 0..<lhs.size {
        a.append(lhs[i] * rhs)
    }
    return Vector<T>(nums: a)
}

public func /<T: MatrixData>(lhs: Vector<T>, rhs: T) -> Vector<T> {
    var a = [T]()
    for i in 0..<lhs.size {
        a.append(lhs[i] / rhs)
    }
    return Vector<T>(nums: a)
}