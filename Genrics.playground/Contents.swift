//: Playground - noun: a place where people can play

import UIKit

// MARK: Simple addition.

// Add two numbers
func add<T: Numeric>(_ x: T,_ y: T) -> T {
    return x + y
}

// Int addition
add(10, 20)

// Float addition
add(10.2, 20.2)

// MARK: Extending an Existing Type
protocol Summable {
    static func +(lhs: Self, rhs: Self) -> Self
}

extension Int: Summable {}
extension Double: Summable {}
extension String: Summable {}

func sum<T: Summable>(_ x: T, _ y: T) -> T {
    return x + y
}

sum(20, 30)
sum("Hello ", "World")

// MARK: Associated Types
//  An associated type gives a placeholder name to a type that is used as part of the protocol.
// The actual type to use for that associated type isn’t specified until the protocol is adopted.
// Associated types are specified with the associatedtype keyword.

// T from earlier, behaves similarly to dataType.
protocol BinaryTree {
    associatedtype dataType
    mutating func insert(data: dataType)
    func index(i: Int) -> dataType
    var data: dataType { get }
}

// MARK: Where Clause
// We can enforce that associated types or variables within a protocol are the same type.
// We can assign a protocol to an associated type.

// The first requirement, B.dataType == T.dataType, states that the associated types of the two binary trees should be the same. This means that their data objects should be of the same type.
// The second set of requirements, B.dataType: Comparable, T.dataType: Comparable, states that the associated types of both must conform to the Comparable protocol.
func twoMax<B: BinaryTree, T: BinaryTree> (treeOne: B, treeTwo: T) -> Bool where B.dataType == T.dataType, B.dataType: Comparable, T.dataType: Comparable {
    return true
}

// MARK: Extensions with a Generic Where Clause
struct Stack<Element> {
    var items = [Element]()
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

extension Stack where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        return true
    }
}








