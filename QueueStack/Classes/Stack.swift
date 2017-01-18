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
public struct Stack<T> {

    public init() {}
    
    /// An array to store elements in the stack. 
    fileprivate var array = [T]()

    /// Adds an element to the top of the stack.
    /// - Parameter item: The element to be added to the stack
    public mutating func push(_ item: T) {
        array.append(item)
    }

    /// Removes the element at the top of the stack and return it.
    /// - Returns: element at the top of the stack
    /// - Throws: StackError.EmptyStack
    public mutating func pop() throws -> T {
        if isEmpty {
            throw StackError.emptyStack
        }
        return array.removeLast()
    }

    /// Returns, but does not remove, the element at the top of the stack.
    /// - Returns: element at the top of the stack
    /// - Throws: StackError.EmptyStack
    public func peek() throws -> T {
        if isEmpty {
            throw StackError.emptyStack
        }
        return array.last!
    }

    /// The number of elements currently in the stack.
    public var count: Int {
        return array.count
    }

    /// Whether the stack is empty.
    public var isEmpty: Bool {
        return array.isEmpty
    }

    /// Removes all elements in the stack.
    public mutating func removeAll() {
        array.removeAll()
    }

    /// Returns an array of the elements in their respective pop order, i.e.
    /// first element in the array is the first element to be popped.
    /// - Returns: array of elements in their respective pop order
    public func toArray() -> [T] {
        return array.reversed()
    }
}
