//
//  TestMatrixVector.swift
//  Assignment
//
//  Created by Benjaman Dutton on 9/1/16.
//  Copyright © 2016 Benjaman Dutton. All rights reserved.
//

import Foundation

/**
 
 The way these tests work is that each test is contained within a function, the tests contain a string/strings with the expected output. The test then creates specified matrix/vector objects and calls a function of matrix/vector. The resulting matrix/vector or other output from the function is then compared to the expected output. This is done with a function called cc (check corrrectness), if the expected output string and the string represenation of the matrix/vector object match the cc function returns true and the test will return true if all cc calls are true, if the test fails and the expected and actual output differ the test will print out what was expected and what was actually got.
 
 */
public class TestMatrixVector {
    
    public init() {
    }
    
    /** Test basic matrix and vector
    */
    public func test1() -> Bool {
        // expected output
        let di = Int()
        let df = Float()
        let dd = Double()
        let e1 = "\(di) \(di) \(di) \(di)\n\(di) \(di) \(di) \(di)"
        let e2 = "\(df) \(df) \(df) \(df)\n\(df) \(df) \(df) \(df)"
        let e3 = "\(dd) \(dd) \(dd) \(dd)\n\(dd) \(dd) \(dd) \(dd)"
        //create the matrix
        let m1 = Matrix<Int>(rows: 2, columns: 4)
        let m2 = Matrix<Float>(rows: 2, columns: 4)
        let m3 = Matrix<Double>(rows: 2, columns: 4)
        
        print("Test 1 - create a zero value matrix of Int, Float and Double with 2 rows and 4 columns")
        return cc(e1, m: "\(m1)") && cc(e2, m: "\(m2)") && cc(e3, m: "\(m3)")
        
    }
    
    /** creates zero value complex and fraction matrices
    */
    public func test1fraccomp() -> Bool {
        let df = Fraction()
        let dc = Complex()
        let e1 = "\(df) \(df) \(df)\n\(df) \(df) \(df)"
        let e2 = "\(dc) \(dc) \(dc)\n\(dc) \(dc) \(dc)"
        let m1 = Matrix<Fraction>(rows: 2, columns: 3)
        let m2 = Matrix<Complex>(rows: 2, columns: 3)
        
        print("Test 1 (Fraction and complex) - creates a 2 by 3 matrix with default fractions and also with complex")
        return cc(e1, m: "\(m1)") && cc(e2, m: "\(m2)")
    }
    
    /* test the subscript functions
    */
    public func test2() -> Bool {
        //expected output
        let e1 = "1 0 1\n0 1 0"
        let e2 = "0"
        //create basic matrix
        let m1 = Matrix<Int>(rows: 2, columns: 3)
        let m2 = "\(m1[1,2])"
        m1[0,0] = 1
        m1[0,2] = 1
        m1[1,1] = 1
        
        print("Test 2 - test the subscript of matrix and vector")
        return  (cc(e1, m: "\(m1)") && cc(e2, m: m2))
    }
    
    public func test3() -> Bool {
        let e1 = "0\n0\n0\n0"
        let m1 = Matrix<Int>(rows: 1, columns: 4)
        
        print("Test 3 - test transpose matrix")
        return cc(e1, m: "\(m1.transpose)")
    }
    
    /** creates two vectors and computes their dot product
    */
    public func test4() -> Bool {
        let e1 = "17"
        let v1 = Vector<Int>(nums: [4, 1, 2])
        let v2 = Vector<Int>(nums: [2, 3, 3])
        let v3 = v1.dot(v2)
        
        print("Test 4 - test dot product")
        return cc(e1, m: "\(v3)")
    }
    
    /** creates 2 matrices, assigns the result of their multiplication to a variable and checks. This also tests the vector arithmetic as a matrix calls the arithmetic methods of its associated vectors when performing calculations.
    */
    public func test5() -> Bool {
        let e1 = "24 33\n18 27"
        let m1 = Matrix<Int>(nums: [[2,3,4],[4,3,2]])
        let m2 = Matrix<Int>(nums: [[1, 2], [2,3], [4,5]])
        let m3 = m1 * m2
        
        print("Test 5 - test matrix multiplied with matrix and vector * function")
        return cc(e1, m: "\(m3)")
    }
    
    
    /** creates two matrices, assigns the result of their addition and subtraction to new variables and checks they are right
    */
    public func test6() -> Bool {
        let e1 = "3 5 3 5\n4 8 2 4"
        let e2 = "1 3 1 3\n0 0 2 4"
        let m1 = Matrix<Int>(nums: [[2,4,2,4],[2,4,2,4]])
        let m2 = Matrix<Int>(nums: [[1,1,1,1], [2,4,0,0]])
        let m3 = m1 + m2
        let m4 = m1 - m2
        
        print("Test 6 - test matrix-matrix add and subtract and test vector-vector add and subtract")
        return (cc(e1, m: "\(m3)") && cc(e2, m: "\(m4)"))
    }
    
    /** creates a matrix, creates 4 new matrices from the results of performing the 4 maths operations on the matrix with a scalar.
    */
    public func test7() ->Bool {
        let e1 = "3.0 4.0 5.0\n6.0 7.0 8.0"
        let e2 = "-1.0 0.0 1.0\n2.0 3.0 4.0"
        let e3 = "2.0 4.0 6.0\n8.0 10.0 12.0"
        let e4 = "0.5 1.0 1.5\n2.0 2.5 3.0"
        let m1 = Matrix<Double>(nums: [[1, 2, 3],[4, 5, 6]])
        let n1: Double = 2.0
        let m2 = m1 + n1
        let m3 = m1 - n1
        let m4 = m1 * n1
        let m5 = m1 / n1
        
        print("Test 7 - test matrix/vector-scalar add, subtract, multiply and divide")
        return cc(e1, m: "\(m2)") && cc(e2, m: "\(m3)") && cc(e3, m: "\(m4)") && cc(e4, m: "\(m5)")
    }
    
    /** creates a vector and matrix
     creates a copy assigned to new variables
     checks if they match their originals
     sets values at postion [2] in the copied vector and [0,2] in the matrix
     checks to see that the originals are unchanged but the copies are
    */
    public func test8() -> Bool {
        let v1 = Vector<Int>(nums: [1,2,4,3])
        let m1 = Matrix<Int>(withVectors: [v1, v1])
        let e1 = "\(v1)"
        let e2 = "\(m1)"
        let v2 = v1.copy()
        let m2 = m1.copy()
        let b: Bool = cc(e1, m: "\(v2)") && cc(e2, m: "\(m2)")
        v2[2] = 5
        m2[0,2] = 5
        let e3 = "1 2 5 3"
        let e4 = "1 2 5 3\n1 2 4 3"
        
        print("Test 8 - test copy function")
        return b && cc(e1, m: "\(v1)") && cc(e3, m: "\(v2)") && cc(e2, m: "\(m1)") && cc(e4, m: "\(m2)")
    }
    
    /** tests the matrix view and vector view
    */
    public func test9() -> Bool {
        let v: Vector<Float> = Vector<Float>(size: 3)
        let A: Matrix<Float> = v.matrixview
        let M: Matrix<Float> = Matrix<Float>(rows:2, columns: 3)
        let arow: Vector<Float> = M.row(1)
        let acol: Vector<Float> = M.column(0)
        let B = arow.matrixview
        let C = acol.matrixview
        let e1 = "0.0 0.0 0.0"
        let e2 = "0.0\n0.0"
        let D = B.vectorview
        
        print("Test 9 - test vectorview and matrixview")
        return cc(e1, m: "\(A)") && cc(e1, m: "\(B)") && cc(e2, m: "\(C)") && cc(e1, m: "\(D)")
    }
    
    /** subselection tests
    */
    public func test10() -> Bool {
        let m1 = Matrix<Double>(nums: [[0,0,0,0], [1,1,1,1],[2,2,2,2], [3,3,3,3]])
        let v1 = m1.row(2)
        let v2 = m1.column(1)
        let e1 = "2.0 2.0 2.0 2.0"
        let e2 = "0.0 1.0 2.0 3.0"
        
        print("Test 10 - Test matrix sub selection")
        return cc(e1, m: "\(v1)") && cc(e2, m: "\(v2)")
    }
    
    /** turn a columm from a matrix to a vector then back to a single column matrix
    */
    public func test11() -> Bool {
        let m1 = Matrix<Float>(nums: [[1,1],[2,2],[3,3],[4,4],[5,5]])
        let e1 = "1.0 2.0 3.0 4.0 5.0"
        let v1 = m1.column(1)
        let e2 = "1.0\n2.0\n3.0\n4.0\n5.0"
        let m2 = v1.matrixview
        
        print("Test 11 - Use the column method to turn a column to vector and then back to a single column matrix")
        return cc(e1, m: "\(v1)") && cc(e2, m: "\(m2)")
    }
    
    /** check if the expected output matches with the string representation of the matrix
    */
    private func cc(e: String, m: String) -> Bool {
        if e == m {
            return true
        }else {
            print("expected\n\(e)\ngot\n\(m)")
            return false
        }
    }
}