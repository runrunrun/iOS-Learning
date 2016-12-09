//: Playground - noun: a place where people can play

import UIKit


//func *(text: String, multiplier: Int) -> String {
//    var newText = text
//    for _ in 2...multiplier {
//        newText += text
//    }
//    return newText
//}
//
//"hello"*3


// Generic Operators
protocol Type {
    static func +=( lhs: inout Self, rhs:Self)
    static func +(lhs: Self, rhs: Self) -> Self
}

extension String: Type {}
extension Int: Type {}
extension Double: Type {}
extension Float: Type {}


func *<T: Type>(lhs: T, rhs: Int) -> T {
    var result = lhs
    for _ in 2...rhs {
        result = result + lhs
    }
    return result
}

"Hello"*3
3.0*4



// Custom Operators

infix operator ** {associativity left precedence 150}

func **<T: Type>(lhs: T, rhs: Int) -> T {
    var result = lhs
    for _ in 2...rhs {
        result = result + lhs
    }
    return result
}

"abc"**4


// Compound Operators

infix operator **= {associativity left precedence 150}

func **=<T: Type>(lhs: inout T, rhs: Int) {
    lhs = lhs ** rhs
}
var o = "abc"
o **= 5

var q = 2
q **= 5


