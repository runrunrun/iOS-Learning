//: Playground - noun: a place where people can play

import UIKit


func *(text: String, multiplier: Int) -> String {
    var newText = text
    for _ in 2...multiplier {
        newText += text
    }
    return newText
}

"hello"*3
