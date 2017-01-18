// Copyright (c) 2017 NUS CS3217. All rights reserved.

/**
 An enum of errors that can be thrown from the `Stack` struct.
 */
enum StackError: Error {
    /// Thrown when trying to access an element from an empty stack.
    case emptyStack
}

/**
 A generic `Stack` class whose elements are last-in, first-out.

 - Authors: CS3217
 - Date: 2017
 */
struct Stack<T> {

    /// An array to store elements in the stack. 
    fileprivate var array = [T]()

    /// Adds an element to the top of the stack.
    /// - Parameter item: The element to be added to the stack
    mutating func push(_ item: T) {
        array.append(item)
    }

    /// Removes the element at the top of the stack and return it.
    /// - Returns: element at the top of the stack
    /// - Throws: StackError.EmptyStack
    mutating func pop() throws -> T {
        if isEmpty {
            throw StackError.emptyStack
        }
        return array.removeLast()
    }

    /// Returns, but does not remove, the element at the top of the stack.
    /// - Returns: element at the top of the stack
    /// - Throws: StackError.EmptyStack
    func peek() throws -> T {
        if isEmpty {
            throw StackError.emptyStack
        }
        return array.last!
    }

    /// The number of elements currently in the stack.
    var count: Int {
        return array.count
    }

    /// Whether the stack is empty.
    var isEmpty: Bool {
        return array.isEmpty
    }

    /// Removes all elements in the stack.
    mutating func removeAll() {
        array.removeAll()
    }

    /// Returns an array of the elements in their respective pop order, i.e.
    /// first element in the array is the first element to be popped.
    /// - Returns: array of elements in their respective pop order
    func toArray() -> [T] {
        return array.reversed()
    }
}
