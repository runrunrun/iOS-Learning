// Playground - noun: a place where people can play

import Cocoa

//Hello World
println("Hello World")

//Variables
var string1 :String = "Swift"
var string2 = "Swift"

var double1 :Double = 1.0
var double2 = 1.0

var int1: Int = 1

//Bool cannot take YES and NO
var isBool: Bool = true

//Constants
let constantString1 = "Swift"

//Values are never implicitly converted to another type
let wash1 = "Wash car yourself " + String(10) + " times"

//Use \() to get values
let wash2 = "Wash car yourself \(10) times"
"Wash car yourself \(10) times"
"Wash car yourself \(wash1) times"

//Create Array
var shoppingList = ["apple", "oranges", "mangos"]

//Create Dictionary
var occupations = ["A": "Software engineer", "B": "Teacher"]

//Create empty Array
var emptyArray = String[]()

//Create empty dictionary
var emptyDictionary = Dictionary<String, String>()

//If type information can be inferred
emptyArray = []
emptyDictionary = [:]

//for loop
let scores = [75, 43, 103, 87, 12]
var sum = 0
for score in scores {
    sum += score
}
sum

//if condition
if sum > 100 {
    sum = 0
}

//Optional contains a value or nil
//Cannot set nil to non optional var
var optionalString: String? = "Hello"
optionalString = nil

var optionalName: String? = "Hari Kunwar"

if optionalName {
    var greeting = "Hello \(optionalName)"
}


//Switch statements
let fruit = "apple"
switch fruit {
case "orange":
    let comment = "orange"
case "mangos":
    let comment = "mangos"
case "apple":
    let comment = "apple"
case "banana", "watermelon":
    let comment = "banana and watermelon"
default:
    let comment = "no fruit"
}


//for in loop
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square":[1, 4, 9, 16, 25]
]

var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
largest

//for in range
sum = 0
for i in 1...10 {
    sum++
}
sum

//
for var i = 0; i < 3; i++ {
    sum += i
}
sum

//while loop
var n = 2
while n < 100 {
    n = n * 2
}
n

//functions
func sum(a: Int, b:Int) -> Int {
    return a + b
}
sum(1, 4)


//function returning tuple
func gasPrices() -> (Double, Double, Double) {
    return (3.2, 3.5, 4)
}
gasPrices()

//Function with variable number of parameter
func average(numbers: Double...) -> Double {
    var sum = 0.0
    for number in numbers {
        sum += number
    }
    let count = Double(numbers.count);
    
    return sum/Double(numbers.count)
}

average(1,2,3,10)


//Nested functions

func getAverage(numbers: Double...) -> Double {
    
    func getSum(numbers: Double...) -> Double {
        var sum = 0.0
        for number in numbers {
            sum += number
        }
        return sum
    }
    
    return getSum(numbers)/Double(numbers.count)
}
















