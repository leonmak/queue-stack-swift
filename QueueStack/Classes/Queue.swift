// Copyright (c) 2017 NUS CS3217. All rights reserved.

/**
 An enum of errors that can be thrown from the `Queue` struct.
 */
enum QueueError: Error {
    /// Thrown when trying to access an element from an empty queue.
    case emptyQueue
}


/**
 A generic `Queue` class whose elements are first-in, first-out.

 - Authors: CS3217
 - Date: 2017
 */
public struct Queue<T> {
    
    public init() {}
    
    /// An array to store elements in the queue
    fileprivate var array = [T]()
    
    /// Adds an element to the tail of the queue.
    /// - Parameter item: The element to be added to the queue
    public mutating func enqueue(_ item: T) {
        array.append(item)
    }

    /// Removes an element from the head of the queue and return it.
    /// - Returns: item at the head of the queue
    /// - Throws: QueueError.EmptyQueue
    public mutating func dequeue() throws -> T {
        if isEmpty {
            throw QueueError.emptyQueue
        }
        return array.removeFirst()
    }

    /// Returns, but does not remove, the element at the head of the queue.
    /// - Returns: item at the head of the queue
    /// - Throws: QueueError.EmptyQueue
    public func peek() throws -> T {
        if isEmpty {
            throw QueueError.emptyQueue
        }
        return array.first!
    }

    /// The number of elements currently in the queue.
    public var count: Int {
        return array.count
    }

    /// Whether the queue is empty.
    public var isEmpty: Bool {
        return array.isEmpty
    }

    /// Removes all elements in the queue.
    public mutating func removeAll() {
        array.removeAll()
    }

    /// Returns an array of the elements in their respective dequeue order, i.e.
    /// first element in the array is the first element to be dequeued.
    /// - Returns: array of elements in their respective dequeue order
    public func toArray() -> [T] {
        return array
    }
}
