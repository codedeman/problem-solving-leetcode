import Foundation


class Node<T> {
    var value: T
    var next: Node<T>?

    init(value: T) {
        self.value = value
    }
}


class LinkedList<T> {
    private var head: Node<T>?

    func isEmpty() -> Bool {
        return head == nil
    }

    func append(value: T) {
        let newNode = Node(value: value)
        if let head = head {
            newNode.next = head
        }
        head = newNode
    }

//    func removeFirst() 
}
