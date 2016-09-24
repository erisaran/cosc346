//
//  Matrix.swift
//  Assignment
//
//  Created by Benjaman Dutton on 8/30/16.
//  Copyright © 2016 Benjaman Dutton. All rights reserved.
//

import Foundation

public class Matrix<T: MatrixData> : BasicMatrix, MatrixArithmetic, MatrixToVector{
    
    private var row: Int
    private var column: Int;
    private var contents = [Vector<T>]()
    
    /** creates a zero value matrix with a specified number of rows and columns
     parameter rows - Int for the number of rows
     parameter columns - Int number of columns
    */
    public init(rows: Int, columns: Int) {
        assert(rows > 0 && columns > 0,"Rows and columns must be greater than 0")
        self.row = rows
        self.column = columns
        for _ in 0..<rows {
            contents.append(Vector<T>(size: columns))
        }
    }
    
    /*creates a matrix from an array of arrays
     parameter nums - [[T]] an array of arrays of numbers
    */
    public init(nums: [[T]]){
        assert(nums.count > 0 && nums[0].count > 0, "Rows and columns must be greater than 0")
        self.row = nums.count
        self.column = nums[0].count
        for i in 0..<nums.count {
            contents.append(Vector<T>(nums: nums[i]))
        }
    }
    
    /**creates a matrix from a set of vectors
     parameter withVectors - [Vector<T>] an array of Vector<T> objects
    */
    public init(withVectors: [Vector<T>]){
        assert(withVectors.count > 0, "Not enough Vectors")
        let s = withVectors[0].size
        for i in 0..<withVectors.count {
            assert(withVectors[i].size == s,"Vectors must all be the same size")
        }
        row = withVectors.count
        column = withVectors[0].size
        contents = withVectors
    }
    
    /** calls the description function of the constituent vectors and arranges them as a matrix
    */
    public var description: String {
        var des = ""
        for i in 0..<contents.count {
            if i == (contents.count - 1) {
                des += ("\(contents[i].description)")
            } else {
                des += ("\(contents[i].description)\n")
            }
        }
        return des
    }
    
    /** gets the number of rows of the matrix object
    */
    public var rows: Int {
        get {
            return self.row
        }
    }
    /** gets the number of columns of the matrix object
    */
    public var columns: Int {
        get {
            return self.column
        }
    }
    
    /** transposes the matrix object and returns a new matrix with the transposed values
    */
    public var transpose: Matrix<T> {
        get {
            var v = [Vector<T>]()
            for i in 0..<column {
                var n = [T]()
                for j in 0..<row {
                    n.append(contents[j][i])
                }
                v.append(Vector<T>(nums: n))
            }
            return Matrix<T>(withVectors: v)
        }
    }
    
    /** gives the vector representation of a single column or single row matrix
    */
    public var vectorview: Vector<T> {
        get {
            assert(row == 1 || column == 1, "The matrix must have either one row or one column")
            if row == 1 {
                return contents[0]
            }else {
                var a = [T]()
                for i in 0..<contents.count {
                    a.append(contents[i][0])
                }
                return Vector<T>(nums: a, isColumn: true)
            }
        }
    }
    
    /** returns a vector that represents a specified row of the matrix
     parameter Int - index of the row to return
     return - Vector<T> representing the row
    */
    public func row(index: Int) -> Vector<T> {
        assert(index >= 0 && index < self.row, "Index out of range")
        return contents[index]
    }
    
    /** returns a vector representing a specified column, this vector will have a flag set to indicate it is a column
     parameter Int - index of the column to return
     return - Vector<T> representing the row
     */
    public func column(index: Int) -> Vector<T> {
        assert(index >= 0 && index < self.column, "Index out of range")
        var a = [T]()
        for i in 0..<row {
            a.append(contents[i][index])
        }
        return Vector<T>(nums: a, isColumn: true)
    }
    
    /** finds the value at the specified indices
     parameter Int - row to get
     parameter Int - column to get
     return - T generic of the value
    */
    public subscript(row: Int, column: Int) -> T {
        get {
            assert(row >= 0 && row < self.row && column >= 0 && column < self.column, "Index out of range")
            return (contents[row])[column]
        }
        set {
            assert(row >= 0 && row < self.row && column >= 0 && column < self.column, "Index out of range")
            (contents[row])[column] = newValue
        }
    }
    
    /** gets the vector at the index specified in this matrix
     parameter Int - row to fetch
     return - Vector<T> at the index
    */
    public subscript(row: Int) -> Vector<T> {
        get {
             return self.row(row)
        }
    }
    
    /** copies the Matrix, uses calls to its constituent vector's copy methods
     return - Matrix<T> that has the same values
    */
    public func copy() -> Matrix<T> {
        var new = [Vector<T>]()
        for i in 0..<contents.count {
            new.append(contents[i].copy())
        }
        let x = Matrix<T>(withVectors: new)
        return x
    }
    
    
}

public func *<T: MatrixData>(lhs: Matrix<T>, rhs: Matrix<T>) -> Matrix<T> {
    assert(lhs.columns == rhs.rows,"Columns of lhs must be the same as rows of lhs")
    let b = rhs.transpose
    var v = [Vector<T>]()
    for i in 0..<lhs.rows {
        var a = [T]()
        for j in 0..<b.rows {
            a.append(lhs[i].dot(b[j]))
        }
        v.append(Vector<T>(nums: a))
    }
    return Matrix<T>(withVectors: v)
}

public func +<T: MatrixData>(lhs: Matrix<T>, rhs: Matrix<T>) -> Matrix<T> {
    assert(lhs.rows == rhs.rows && lhs.columns == rhs.columns, "Matrices must have same number of rows and columns")
    var v = [Vector<T>]()
    for i in 0..<lhs.rows {
        v.append(lhs[i] + rhs[i])
    }
    return Matrix<T>(withVectors: v)
}

public func -<T: MatrixData>(lhs: Matrix<T>, rhs: Matrix<T>) -> Matrix<T> {
    assert(lhs.rows == rhs.rows && lhs.columns == rhs.columns, "Matrices must have same number of rows and columns")
    var v = [Vector<T>]()
    for i in 0..<lhs.rows {
        v.append(lhs[i] - rhs[i])
    }
    return Matrix<T>(withVectors: v)
}

public func +<T: MatrixData>(lhs: Matrix<T>, rhs: T) -> Matrix<T> {
    var v = [Vector<T>]()
    for i in 0..<lhs.rows {
        v.append(lhs[i] + rhs)
    }
    return Matrix<T>(withVectors: v)
}

public func -<T: MatrixData>(lhs: Matrix<T>, rhs: T) -> Matrix<T> {
    var v = [Vector<T>]()
    for i in 0..<lhs.rows {
        v.append(lhs[i] - rhs)
    }
    return Matrix<T>(withVectors: v)
}

public func *<T: MatrixData>(lhs: Matrix<T>, rhs: T) -> Matrix<T> {
    var v = [Vector<T>]()
    for i in 0..<lhs.rows {
        v.append(lhs[i] * rhs)
    }
    return Matrix<T>(withVectors: v)
}

public func /<T: MatrixData>(lhs: Matrix<T>, rhs: T) -> Matrix<T> {
    var v = [Vector<T>]()
    for i in 0..<lhs.rows {
        v.append(lhs[i] / rhs)
    }
    return Matrix<T>(withVectors: v)
}
