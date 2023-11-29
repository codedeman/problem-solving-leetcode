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

