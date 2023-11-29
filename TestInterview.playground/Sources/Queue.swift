import Foundation

//public struct Queue<T> {
//
//    public var elements: [T] = []
//
//    public init() { }
//
//    public mutating func enQueue(element: T) {
//        elements.append(element)
//    }
//
//    public mutating func deQueue() -> T{
//        guard !elements.isEmpty else { return }
//        elements.removeFirst()
//    }
//
//    public var head: T? {
//        return elements.first
//    }
//
//    public var tail: T? {
//        return elements.last
//    }
//
//    public var count: Int {
//        return elements.count
//    }
//
//
//}
//
//
//public struct Stack<T> {
//
//    var queue: Queue<T>
//
//    public init(queue: Queue<T>) {
//        self.queue = queue
//    }
//
//    public mutating func push(value: T) {
//        queue.enQueue(element: value)
//    }
//
//    public mutating func pop(value: T) ->T? {
//        var count = queue.count-1
//        while count < 0 {
//            let element = queue.deQueue()
//            queue.enQueue(element: element )
//            count -= 1
//        }
//        return queue.deQueue() 
//    }
//
//}
