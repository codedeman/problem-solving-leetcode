import UIKit


//MARK: Result

let solution = Solution()
let anotherSolution = AnotherSolution()

func createLinkedList(_ array: [Int]) -> ListNode? {
    guard !array.isEmpty else { return nil }
    let head = ListNode(array[0])
    var current = head
    for value in array.dropFirst() {
        current.next = ListNode(value)
        current = current.next!
    }
    return head
}


func printLinkedList(_ node: ListNode?) {
    var current = node
    while current != nil {
        print(current!.val, terminator: " -> ")
        current = current?.next
    }
    print("nil")
}

public class SinglyLinkedListNode {
    public var data: Int
    public var next: SinglyLinkedListNode?
    public init(_ data: Int, _ next: SinglyLinkedListNode? = nil) {
        self.data = data
        self.next = next
    }
}



func insertNodeAtPosition(
    llist: SinglyLinkedListNode?,
    data: Int,
    position: Int
) -> SinglyLinkedListNode? {

    let newNode: SinglyLinkedListNode? = SinglyLinkedListNode(data)

    // If the position is 0, insert the new node at the head
    if position == 0 {
        newNode?.next = llist
        return newNode
    }

    var current = llist
    var currentPosition = 0

    // Traverse the list to find the node just before the insertion position
    while current != nil && currentPosition < position-1  {
        current = current?.next
        currentPosition += 1
    }

    // If the current node is not nil, insert the new node after it
    if current != nil {
        newNode?.next = current?.next
        current?.next = newNode
    }

    return llist

}

func deleteNode(llist: SinglyLinkedListNode?, position: Int) -> SinglyLinkedListNode? {
    // Write your code here

    if llist == nil || position < 0 {
        return nil
    }

    // If deleting the head node
    if position == 0 {
        return llist?.next
    }

    var current = llist
    var currentPosition = 0
    // Traverse the list to find the node before the one to be deleted

    while  current != nil && currentPosition < position-1  {
        current = current?.next
        currentPosition += 1
    }
    // If the position is out of bounds or there's no next node to delete

    if current == nil && current?.next == nil {
        return llist
    }
    // Skip the node to be deleted
    current?.next = current?.next?.next
    return llist

}


func reversePrint(llist: SinglyLinkedListNode?) -> Void {
    // Write your code here

    var current = llist
    var stack: [Int] = []
    while current != nil {
        stack.append(current?.data ?? 0)
        current = current?.next
    }

    for num in stack.reversed() {
        print(num)
    }

}

func reverse(llist: SinglyLinkedListNode?) -> SinglyLinkedListNode? {
    // Write your code here
    
    var next: SinglyLinkedListNode? = nil
    var prev: SinglyLinkedListNode? = nil
    var current = llist

    while current != nil {
        next = current?.next
        current?.next = prev
        prev = current
        current = next
    }
    return prev
}

func removeDuplicates(llist: SinglyLinkedListNode?) -> SinglyLinkedListNode? {
    // Write your code here

    var hashMap: [Int: Bool] = [:]

    var current = llist
    var prev: SinglyLinkedListNode? = nil
    let dummy = SinglyLinkedListNode(0)
    dummy.next = current

    while current != nil {
        if let value = hashMap[current?.data ?? 0] {
            prev?.next = current?.next?.next
        } else {
            hashMap[current!.data] = true
            prev = current
        }
        current = current?.next
    }


    return llist

}

let list2 = ListNode(1, .init(3, .init(4)))

func testReorderList() {
    let solution = AnotherSolution()

    let testCases: [([Int], [Int])] = [
        ([1, 2, 3, 4], [1, 4, 2, 3]),
        ([1, 2, 3, 4, 5], [1, 5, 2, 4, 3]),
        ([], []),
        ([1], [1]),
        ([1, 2], [1, 2])
    ]

    for (input, expected) in testCases {
        let head = buildLinkedList(input)
        solution.reorderList(head)
        let result = linkedListToArray(head)
        assert(result == expected, "Failed for input \(input): got \(result), expected \(expected)")
    }

    print("All tests passed.")
}

// Run the test
//let solution = AnotherSolution()

//testReorderList()
func testOddEvenList() {
    let solution = Solution()

    // Define test cases as pairs of input and expected output arrays
    let testCases: [([Int], [Int])] = [
        ([3, 2, 1, 5, 4], [3, 1, 4, 2, 5]),
        ([2, 1, 3, 5, 6, 4, 7], [2, 3, 6, 7, 1, 5, 4]),
        ([], []),
        ([1], [1]),
        ([1, 2], [1, 2])
    ]

    // Iterate over each test case
    for (input, expected) in testCases {
        // Build a linked list from the input array
        let head = buildLinkedList(input)
        // Apply the oddEvenList function
        let result = anotherSolution.oddEvenList(head)
        // Convert the resulting list to an array
        let resultArray = linkedListToArray(result)
        // Assert that the result matches the expected output
        assert(resultArray == expected, "Failed for input \(input): got \(resultArray), expected \(expected)")
    }

    // Print a message if all tests passed
    print("===> All tests passed.")
}

let sorted = anotherSolution.sortList(ListNode(1,ListNode(3,ListNode(2))))
printLinkedList(sorted)

//let newNode = insertNodeAtPosition(llist: SinglyLinkedListNode(0,SinglyLinkedListNode(1,SinglyLinkedListNode(2, SinglyLinkedListNode(3)))), data: 4, position: 1)
//let nodeDelete = deleteNode(llist: SinglyLinkedListNode(0,SinglyLinkedListNode(1,SinglyLinkedListNode(2, SinglyLinkedListNode(3)))), position: 1)
//
//var current = nodeDelete
var reveseNode = removeDuplicates(llist: SinglyLinkedListNode(0,SinglyLinkedListNode(1,SinglyLinkedListNode(2, SinglyLinkedListNode(2)))
                                                             ))

while reveseNode != nil {
    print("data \(String(describing: reveseNode?.data))")
    reveseNode = reveseNode?.next
}
removeDuplicates(llist: SinglyLinkedListNode(0,SinglyLinkedListNode(1,SinglyLinkedListNode(2, SinglyLinkedListNode(3)))
))
//reversePrint(
//    llist: SinglyLinkedListNode(0,SinglyLinkedListNode(1,SinglyLinkedListNode(2, SinglyLinkedListNode(3))))
//)


class Bird {
    func fly() {
        print("Flying")
    }
}

class Sparrow: Bird {
    override func fly() {
        print("Sparrow flying")
    }
}

class Penguin: Bird {
    override func fly() {
        fatalError("Penguins can't fly")
    }
}

func letBirdFly(_ bird: Bird) {
    bird.fly()
}


//Example: [1,1,4,4,5,5,7,8,8];
//Output: 7
    /*
     1: Given a sorted array consisting of only integers where each element appears two except for one element which appears once, design an algorithm to find and return the element that appears only once. Your solution must achieve O(log n) time complexity and O(1) space complexity.

     Example: [1,1,4,4,5,5,7,8,8];
     Output: 7
     */

/*
 2, I have a continuous stream of data pouring in from the device. Define an architecture to upload data to the server, ensuring three factors:
 Data is uploaded securely and completely.
 Data is uploaded in the correct order.
 Control over fixed resources of the device is maintained.
 - first check permission
 - size file want to upload
 - encrypt the file send to server
 - for each we have unique id or index to acesss
  Retry pattern
    Sequence numbering
    Batch Upload

 */



anotherSolution.strStr1("aaa", "aaaa")
anotherSolution.strStr1("a", "a")

var arr = [1,2,3]

//for value in 0...arr.count {
//    print("value \(arr[value])")
//}
//anotherSolution.reverseWords("the sky is blue")
