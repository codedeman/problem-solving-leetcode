import Foundation

public class Queue {

    var elements: [Int] = []

    public init() { }

    public func push(_ x: Int) {
        elements.append(x)
    }

    public var head: Int? {
        return elements.first
    }

    public func pop() -> Int {
        elements.popLast()!
    }

    public var tail: Int? {
        return elements.last
    }

    public var count: Int? {
        return elements.count
    }

    public func isEmpty() -> Bool{
        return elements.isEmpty
    }

}

public struct MonotonicStack<T: Comparable> {
    private var stack: [T] = []

    public init(stack: [T]) {
        self.stack = stack
    }

    public mutating func push(_ element: T) {
        while !stack.isEmpty && stack.last! < element {
            stack.removeLast()
        }
        stack.append(element)
    }

    public mutating func pop() -> T? {
        return stack.removeLast()
    }

    public func peek() -> T? {
        return stack.last
    }

    public func isEmpty() -> Bool {
        return stack.isEmpty
    }
    public  var count: Int {
        return stack.count
    }
}


