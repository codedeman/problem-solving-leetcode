import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?

    public init() {
        self.val = 0
        self.next = nil
    }

    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }

    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }


}
extension ListNode: CustomStringConvertible {
    public var description: String {
       guard let next = next else {
         return "\(val)"
       }
       return "\(val) -> " + String(describing: next) + " "
     }
}



public struct LinkedList {

    var head: ListNode?
    var tail: ListNode?

    public var isEmpty: Bool {
        head == nil
    }

    public mutating func push(_ value: Int) {
        let newNode = ListNode(value)
        if head == nil {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }

    mutating func findMiddleNode(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head

        // Move fast pointer twice as fast as slow pointer
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }

        // At this point, slow pointer is at the middle node
        return slow
    }
    //MARK: 160. Intersection of Two Linked Lists
/*
    Step1 get height of list
    Step2 aligh with the leght of each nodes
 */
    public mutating func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        // Ensure headA and headB are not nil
        guard let headA = headA, let headB = headB else {
            return nil
        }

        var lengthA = getLength(head: headA)
        var lengthB = getLength(head: headB)
        var nodeA: ListNode? = headA
        var nodeB: ListNode? = headB

        // Move pointers of the longer list to align start
        while lengthA > lengthB {
            nodeA = nodeA?.next
            lengthA -= 1
        }

        while lengthB > lengthA {
            nodeB = nodeB?.next
            lengthB -= 1
        }

        // Traverse and compare nodes
        while nodeA != nil && nodeB != nil {
            if nodeA === nodeB { // Intersection found
//                print("list a", headA)
//                print("list b", headB)
                return nodeA
            }
            nodeA = nodeA?.next
            nodeB = nodeB?.next
        }



        return nil // No intersection found
    }
    public mutating func getIntersectionNode2(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {

        var nodeA = headA
        var nodeB = headB
        while nodeA !== nodeB {
            nodeA = nodeA?.next ?? headB // Move nodeA to next or reset to headB if it reaches the end
            nodeB = nodeB?.next ?? headA // Move nodeB to
        }
        return nodeA
    }



    func getLength(head: ListNode?) -> Int {
        var length = 0
        var current = head
        while current != nil {
            length += 1
            current = current?.next
        }
        return length
    }


    public mutating func recusiveHelper(_ node: ListNode?) -> ListNode? {
        guard let head = node, let nextNode = head.next else { return nil }
        if head.next == nil {
            return head
        }
        let reversed = recusiveHelper(nextNode.next)
        nextNode.next = head
        head.next = nil
        return reversed
    }


    mutating func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var dummyNode = ListNode(0)
        dummyNode.next = head
        var prev: ListNode? = dummyNode
        var current = head
        var set = Set<Int>()
        while  current != nil {
            if set.contains(current?.val ?? 0) {
                prev?.next = current?.next
            } else {
                prev = current
            }
            set.insert(current?.val ?? 0)
            current = current?.next
        }
        return dummyNode.next
    }

    public mutating func reverseList() {
       head = recusiveHelper(head)
        print("===>",head!)
    }



    public mutating func reverse() {
        var prev: ListNode? = nil
        var current = head
        while current != nil {
            let next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        tail = head
        head = prev
    }


    mutating func sort() {
        var current = head
        var isSwapped = false
        repeat {
            isSwapped = false
            current = head
            while let node = current?.next {
                if node.val > current!.val {
                    swap(node, current!)
                    isSwapped = true
                }
                current = node
            }
        } while isSwapped


    }

    private mutating func swap(_ node1: ListNode, _ node2: ListNode) {
        let temp = node1.val
        node1.val = node2.val
        node2.val = temp

    }

    /*
     Step1: initilize array interate through elelemt
     */

    public func isPralindome() -> Bool {

        var stack: [Int] = []

        var current = head

        while current != nil {
            stack.append(current?.val ?? 0)
            current = current?.next
        }

        current = head

        while current != nil {
            if current?.val == stack.popLast() {
                return true
            }
            current = current?.next
        }

        return false
    }


    public mutating func apend(_ value: Int) {
        guard !isEmpty else {
            push(value)
            return
        }
        // 2
        tail?.next = ListNode(value)
        tail = tail?.next
    }
    @discardableResult
    public mutating func insert(_ value: Int,
                                after node: ListNode
    ) -> ListNode {
        guard tail !== node else {
            apend(value)
            return tail!
        }
        node.next = ListNode(value)
        return node.next!

    }
    @discardableResult

    public mutating func pop() -> Int {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil

            }
        }
        return head!.val
    }
    @discardableResult

    public mutating func remove(after node: ListNode) -> Int {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next!.val
    }

    public mutating func findAdjacentElements() {

        var current = head
        while let currentNode = current {
            if let nextNode = current?.next {
                swap(currentNode, nextNode)
            }
            current = current?.next

        }
    }

    func removeElements(
        _ head: ListNode?,
        _ val: Int
    ) -> ListNode? {

        let head = head
        let dumyNode = ListNode(0)
        dumyNode.next = head
        var current = head
        var prev: ListNode? = dumyNode

        while current != nil {
            if current?.val == val {
                prev?.next = current?.next
            } else {
                prev = current
            }
            current = current?.next
        }

        return dumyNode.next
    }


    func removeElements2(_ head: ListNode?, _ val: Int) -> ListNode? {
        var head = head
        var dumyNode = ListNode(0)
        dumyNode.next = head
        var current = head
        var prev: ListNode? = dumyNode

        while current != nil {
            if current?.val == val {
                prev?.next = current?.next
            } else {
                prev = current
            }
            current = prev?.next
        }

        return dumyNode.next
    }



    public mutating func append(_ value: Int) {

      // 1
      guard !isEmpty else {
        push(value)
        return
      }

      // 2
      tail!.next = ListNode(value)

      // 3
      tail = tail!.next
    }

    mutating func swapPairs() {
        let dummy = ListNode(0)
        dummy.next = head

        var prev: ListNode? = dummy
        var current = head // Initialize current to the head

        while let node1 = current, let node2 = current?.next {
                // Swap node1 and node2
                prev?.next = node2
                node1.next = node2.next
                node2.next = node1

                // Move prev and current pointers forward for next iteration
                prev = node1
            print("node 1", node1.val, node1.next ?? 0)
                current = node1.next
            }

        print("dummy", dummy.next!)

    }





    //MARK: 82. Remove Duplicates from Sorted List II
    /*

     Step1: Declare new dic
     iterate through list node with each value we icrease 1
     */

    mutating func deleteDuplicates2(_ head: ListNode?) -> ListNode? {
        var dict = [Int: Int]() // Dictionary to keep track of node counts
        var current = head

        while current != nil {
            dict[current?.val ?? 0, default: 0] += 1
            current = current?.next
        }

        let dummyNode = ListNode(0)
        dummyNode.next = head
        var prev: ListNode? = dummyNode
        current = head

        while current != nil {
            if let count = dict[current?.val ?? 0], count > 1 {
                prev?.next = current?.next
            } else {
                prev = current
            }
            current = current?.next
        }

        return dummyNode.next
    }

    //MARK: 19. Remove Nth Node From End of List

    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummyNode = ListNode(0)
        dummyNode.next = head

        var fast: ListNode = dummyNode
        var slow: ListNode = dummyNode

        for _ in 0..<n {
            fast = fast.next!

        }

        while fast.next != nil {
            fast = fast.next!
            slow = slow.next!
        }
        slow.next = slow.next?.next

        return dummyNode.next
    }
    //MARK: 143. Reorder List
    /*
     Step 1: Find the midle of the list
     Step 2: Reverse the second half of the list
     Step 3: Merger second half and first half of the list
     */
    mutating func reorderList() {
        var slow = head
        var fast = head
        // find the midlle of the node
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }

        // Reverse the second half of the list

        var prev: ListNode? = nil
        var current: ListNode? = slow?.next

        while current != nil {
            let next = current?.next
            current?.next = prev
            prev = current
            current = next
        }

        slow?.next = nil

        var first: ListNode? = head
        var second: ListNode? = prev


        while second != nil {
            print("===>",second!)
            second = second?.next
        }

        // Merge two node into one
        while second != nil {
            let nextFirstHalf = first?.next
            let nextSecondHalf = second?.next

            first?.next = second
            second?.next = nextFirstHalf

            first = nextFirstHalf
            second = nextSecondHalf
        }

    }

    //MARK: 21. Merge Two Sorted Lists

    /*
        Step1: Check if list1 > list2
            return list1.next  = recusive function
            else list2 > list1
            return list2.next = recusive function
     */
    mutating func mergeTwoLists(
        _ list1: ListNode?,
        _ list2: ListNode?
    ) -> ListNode? {

        // Check if either list1 or list2 is empty
        guard list1 != nil else {
            return list2
        }
        guard list2 != nil else {
            return list1
        }

        let list1Pointer = list1
        let list2Pointer = list2

        if let node1 = list1Pointer, let node2 = list2Pointer {
            if node1.val <= node2.val {
                node1.next = mergeTwoLists(node1.next, node2)
                return node1
            } else {
                node2.next = mergeTwoLists(node1, node2.next)
                return node2
            }
        }
        return nil
    }



    func swapPairs(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head

        var prev: ListNode? = dummy
        var current = head // Initialize current to the head

        while let node1 = current, let node2 = current?.next {
                // Swap node1 and node2
                prev?.next = node2
                node1.next = node2.next
                node2.next = node1

                // Move prev and current pointers forward for next iteration
                prev = node1
                print("node 1", node1.val, node1.next)
                current = node1.next
            }

            return dummy.next // Return the new head which is after the dummy node

    }

    //MARK: 1721. Swapping Nodes in a Linked List
    func swapNodes(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let head = head, k > 0 else { return head }
        var length = 0
        var currentNode = head

        while currentNode != nil {
            length += 1
            currentNode = currentNode.next!
        }

        if k > length {
            return head
        }

          // Find the kth node from the beginning
          var firstNode: ListNode? = nil
          currentNode = head
          for i in 0..<length {
            if i == k-1 {
              firstNode = currentNode
              break
            }
              currentNode = currentNode.next!
          }

          // Find the (n-k+1)th node (kth from the end)
          var secondNode: ListNode? = nil
          currentNode = head
          for i in 0..<length {
            if i == length - k {
              secondNode = currentNode
              break
            }
              currentNode = (currentNode.next)!
          }

          // Swap the values of the nodes (or the nodes themselves if needed)
          if let first = firstNode, let second = secondNode {
            let temp = first.val
            first.val = second.val
            second.val = temp
          }

          return head

//
//
//              var firstPrev: ListNode? = nil
//              var firstNode: ListNode? = nil
//              var secondNode: ListNode? = nil
//              var secondPrev: ListNode? = nil
//
//              var dummy = ListNode(0)
//              dummy.next = head
//
//              var count = 0
//
//              while current != nil {
//                  count += 1
//                  if count == k {
//                      firstPrev = current
//                      firstNode = current
//                  }
//
//                  if count == k || count == (count - k+1) {
//                      secondPrev = firstPrev
//                      secondNode = current
//                  }
//
//                  current = current.next!
//              }
//
//              let temp = firstNode?.val
//              firstNode?.val = secondNode!.val
//              secondNode?.val = temp!
              return  head

    }
    
    public mutating func deleteNode(value: Int) {
        var temp = head
        var prev: ListNode? = nil

        if temp != nil && temp?.val == value {
            self.head = temp
            return
        }

        while temp != nil && temp?.val != value {
            prev = temp
            temp = temp?.next
        }

        if temp == nil {
            return
        }

        prev?.next = temp?.next


    }





}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }

    public func printAll() {
        var current = head
        while let currentNode = current {
            print(currentNode.val)
            current = currentNode.next
        }
    }
}
