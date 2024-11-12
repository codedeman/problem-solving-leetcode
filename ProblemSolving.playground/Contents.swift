import UIKit


//MARK: Result

let solution = Solution()
let anotherSolution = AnotherSolution()
let test = Test()
//
//binaryGen(&b, n: b.count)
//print(b)



//var num = [0,1,0,3,12]
//anotherSolution.moveZeroes(&num)
//print(num)
// Helper function to print the linked list
func printList(_ head: ListNode?) {
    var current = head
    while current != nil {
        print(current?.val, terminator: " -> ")
        current = current?.next
    }
    print("nil")
}
//let head = ListNode(3)
//let node2 = ListNode(2)
//let node0 = ListNode(0)
//let node4 = ListNode(-4)
//
//head.next = node2
//node2.next = node0
//node0.next = node4
//node4.next = node2
//print("Original list:")
//printList(head)
//test.swapNodes(head: head, pos1: 1, pos2: 3)

//printList(head)
//
//if let cycleStart = test.detectCycle1(head) {
//    print("cycle detected.")
//
//    printList(cycleStart)
////    print("Cycle starts at node with value: \(cycleStart.val)")
//} else {
//    print("No cycle detected.")
//}
// Manually create the linked list and cycle
// Linked list 1: 2 -> 4 -> 3 (represents 342)
// Create the nodes
// Manually create the nodes
let node1 = ListNode(1)
let node2 = ListNode(2)
let node3 = ListNode(3)
let node4 = ListNode(4)
let node5 = ListNode(5)

// Connect the nodes to form the linked list: 1 -> 2 -> 3 -> 4 -> 5
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

// Define k and apply rotation
let k = 2


//anotherSolution.addTwoNumbers2(l1, l2)
//let result = anotherSolution.oddEvenList(node1)

func buildTree<T: Comparable>(_ values: [T?]) -> TreeNode<T>? {
    // Ensure the array is non-empty and the first value exists
    guard !values.isEmpty, let rootValue = values[0] else { return nil }

    // Initialize the root node
    let root = TreeNode(value: rootValue)
    var queue: [TreeNode<T>] = [root]
    var index = 1

    // Build the tree level by level
    while index < values.count {
        let currentNode = queue.removeFirst()

        // Process left child
        if let leftValue = values[index] {
            let leftNode = TreeNode(value: leftValue)
            currentNode.left = leftNode
            queue.append(leftNode)
        }
        index += 1

        // Process right child, if within bounds
        if index < values.count, let rightValue = values[index] {
            let rightNode = TreeNode(value: rightValue)
            currentNode.right = rightNode
            queue.append(rightNode)
        }
        index += 1
    }

    return root
}
//print("Result Linked List:")
//printList(result)  // Expected Output: 7 -> 0 -> 8 (represents 807)
//[1,3,5,6], target = 5
//test.rotateRight(node1, k)

//[1,3,5,6], target = 2
//test.searchInsert([1,3,5,6], 2)

//[1,3,5,6], target = 7
// Manually creating two intersecting linked lists
let commonNode = ListNode(8)
commonNode.next = ListNode(10)

// First linked list: 1 -> 3 -> 5 -> 8 -> 10
let headA = ListNode(1)
headA.next = ListNode(3)
headA.next?.next = ListNode(5)
headA.next?.next?.next = commonNode

// Second linked list: 2 -> 8 -> 10
let headB = ListNode(2)
headB.next = commonNode

printList(test.getIntersectionNode(headA, headB))
let head = ListNode(2)
head.next = ListNode(1)
head.next?.next = ListNode(5)

anotherSolution.nextLargerNodes(head)

anotherSolution.searchRange([5,7,7,8,8,10], 8)
//if let intersection = test.getIntersectionNode(headA, headB) {
//    print("Intersection found at node with value: \(intersection.val)")
//} else {
//    print("No intersection found.")
//}

//test.nextLargerNodes(head)

//print(Array(array.prefix(2+1)))
//let k = 2
//test.sortKMessedArray(arr: array, k: 2)
//test.sortKMessedArray2(array, 2)
//let array =  [3,2,1,5,6,4]
//
//anotherSolution.findKthLargest(array, 2)

// Manually creating the nodes
//let root = TreeNode<Int>(value: 3)
//root.left = TreeNode<Int>(value: 9)
//root.right = TreeNode<Int>(value: 20)
//root.right?.left = TreeNode<Int>(value: 15)
//root.right?.right = TreeNode<Int>(value: 7)
//
//test.maxDepth(root)


print(test.subsets2([1, 2, 2]))

anotherSolution.minimumDeletions("aababbab")

//anotherSolution.maxDepth2(root)
let values: [Int?] = [3, 9, 20, nil, nil, 15, 7]

let root = buildTree(values)

anotherSolution.levelOrder(root)
