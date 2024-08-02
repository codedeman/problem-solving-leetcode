import Foundation

public struct Queue<T> {
  private var items: [T] = []

    public mutating func enqueue(_ item: T) {
    items.append(item)
  }

public mutating func dequeue() -> T? {
    guard !items.isEmpty else { return nil }
    return items.removeFirst()
  }

    public var isEmpty: Bool {
    return items.isEmpty
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


// Definition for doubly-linked list.
public class DoublyLinkedListNode {
    public var data: Int
    public var next: DoublyLinkedListNode?
    public var prev: DoublyLinkedListNode?
    public init(data: Int, next: DoublyLinkedListNode? = nil, prev: DoublyLinkedListNode? = nil) {
        self.data = data
        self.next = next
        self.prev = prev
    }
}
