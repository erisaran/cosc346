//
//  main.swift
//  Assignment
//
//  Created by Benjaman Dutton on 8/30/16.
//  Copyright © 2016 Benjaman Dutton. All rights reserved.
//

import Foundation

func runtest(t: Bool) {
    if t {
        print("passed\n")
    }else {
        print("failed\n")
    }
}

let t = TestMatrixVector()

runtest(t.test1())
runtest(t.test1fraccomp())
runtest(t.test2())
runtest(t.test3())
runtest(t.test4())
runtest(t.test5())
runtest(t.test6())
runtest(t.test7())
runtest(t.test8())
runtest(t.test9())
runtest(t.test10())
runtest(t.test11())


/*
//basic input
var n = [1, 2, 3]
var a = Vector<Int>(nums: n)
print("Print vector 1\n\(a)\n")
var c = [[1, 2, 3], [4, 5, 6], [7, 8, 10], [11, 12, 13]]
var b = Matrix<Int>(nums: c)
print("Print matrix 1\n\(b)")
var m2 = Matrix<Double>(rows: 2, columns: 3)
var v = Vector<Float>(size: 3)
print("print zero value vector with 2 rows and 3 columns\n\(v)\n")
print("print zero value matrix with 2 rows and 3 columns\n\(m2)")

// test subscript
print("get value at [2,1] from matrix 1\n\(b[2,1])\n")
b[2,1] = 9
print("set value at [2,1] to 9\n\(b[2,1])\n")


//test transpose
var m3 = Matrix<Int>(rows: 1, columns: 4)
var t2 = m3.transpose
var t = b.transpose
print("transpose matrix 1\n\(t)")
print("\(t2)\n")

//test dot product
var v1 = Vector<Int>(nums: [2, 3, 2])
var v2 = Vector<Int>(nums: [4, 1, 3])
var vp = v1.dot(v2)
print("computing dot product of \(v1) and \(v2)\n\(vp)\n")


//test arthemetic
var m4 = Matrix<Int>(nums: [[2, 3, 4], [2, 3, 4]])
var m5 = Matrix<Int>(nums: [[2, 3], [4,5], [6,1]])
print("multiply\n\(m4)by\n\(m5)\n")
print("\(m4*m5)\n")

var m6 = Matrix<Int>(nums: [[1, 1, 1], [2, 2, 2]])
print("add - subtract\n\(m4)\nto\n\(m6)\nadd\n\(m4+m6)\nsubtract\n\(m4-m6)")

//test swapping matrix--vector
var ve: Vector<Float> = Vector<Float>(size: 3)
var A: Matrix<Float> = v.matrixview
var M: Matrix<Float> = Matrix<Float>(rows:2, columns: 3)
var arow: Vector<Float> = M.row(1)
var acol: Vector<Float> = M.column(0)
var B = arow.matrixview
var C = acol.matrixview

print("swaps\n\(A)\n\(B)\n\(C)\n")

//test complex/fraction
var m7 = Matrix<Fraction>(rows: 1, columns: 2)
m7[0,0] = Fraction(num: 3, den: 4)
m7[0,1] = Fraction(num: -1, den: 2)
print("Fraction\n\(m7)")
var m8 = Matrix<Complex>(rows: 3, columns:2 )
m8[0,0] = Complex(real: 3.0,imag: -3.0)
print("Complex\n\(m8)")
*/