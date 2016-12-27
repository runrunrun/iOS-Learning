// Playground - noun: a place where people can play

import Cocoa

////First code
println("Hello, world")

////Simple Values

//let declares constant values
let myConstant = 10

//var declares variables
var myVariable = 10

//Implict type declaration
let implicitIntegerConstant = 10
var implicitIntegerVariable = 10

//Explict type declaration
let explicitIntegerConstant : Integer = 10
var explicitIntegerVariable : Integer = 10

//Values are never implicitly converted to another type
let label = "width is"
let width = 10
let widthString = label + " " + String(width)

//Simpler way to include values in a string
let apples = 5
let oranges = 6
let fruitSummary = "I have \(apples) apples and  \(oranges) oranges"

//Array
var shoppingList = ["catfish", "water", "tulips"]
var explictShoppingList : String[] = ["catfish", "water", "tulips"]

shoppingList[0]//read
shoppingList[1] = "bottle of water"//edit
shoppingList.append("boo")//add
shoppingList[3]

let emptyArray : String[] = String[]()//explicit

//Dictionary
var occupations = ["Mal": "Captain", "Kalyee": "Mechanic"];

occupations["Mal"]//read
occupations["Jay"] = "HR"//add one more item

let emptyDictionary : Dictionary<String, Float> = Dictionary <String, Float>()//explicit







































