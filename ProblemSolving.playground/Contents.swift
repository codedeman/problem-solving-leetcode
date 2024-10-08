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
//let head = ListNode(1)
//head.next = ListNode(2)
//head.next?.next = ListNode(3)
//
//anotherSolution.splitListToParts(head, 5)
////[3,5,2,6], k = 2
//anotherSolution.mostCompetitive([3,5,2,6], 2)
//anotherSolution.mostCompetitive([71,18,52,29,55,73,24,42,66,8,80,2], 3)
//Input: nums = [1, 3, -1, -3, 5, 3, 6, 7], k = 3

anotherSolution.maxSlidingWindow([1, 3, -1, -3, 5, 3, 6, 7], 3)

let test = Test()
var arr = [5,4,7,5,3,2]
//[1,3,2]
//[3,2,1]
test.permuteUnique([1,1,2])
//test.letterCasePermutation("a1b2")
print(arr)
func binaryGen(_ b: inout [Int], n: Int) {
    var i = n - 1 // Chỉ số bắt đầu từ 0 trong Swift, nên giảm 1
    while i >= 0 && b[i] == 1 {
        b[i] = 0
        i -= 1
    }
    if i < 0 {
        return
    } else {
        b[i] = 1
    }
}
//var b = [0, 0, 0, 0] // Chuỗi nhị phân ban đầu
//
//binaryGen(&b, n: b.count)
//print(b)



//var num = [0,1,0,3,12]
//anotherSolution.moveZeroes(&num)
//print(num)

let head = ListNode(1)
head.next = ListNode(2)
head.next?.next = ListNode(2)
head.next?.next?.next = ListNode(1)

//test.isPalindrome(head)
test.isPalindrome("madam")

test.isPalindrome("A man, a plan, a canal: Panama")
let arr1 = [1, 3, 5, 7]
let arr2 = [2, 4, 6, 8]

test.mergeSortedArrays(arr1, arr2)
//[1,2,2,1], nums2 = [2,2]
test.intersection([1,2,2,1], [2,2])
//[4,9,5], nums2 = [9,4,9,8,4]
test.intersection([4,9,5], [9,4,9,8,4])

test.intersection2([4,9,5], [9,4,9,8,4])
