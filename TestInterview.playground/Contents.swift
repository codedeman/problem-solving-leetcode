import UIKit
import Foundation
import Swift
var greeting = "Hello, playground"
import Combine
protocol Purchaseable {
    func buy()
}


struct Book: Purchaseable {
    func buy() {

    }

}



func fact(num: Int) -> Int {
    if num <= 1 {
        print("stop operator")
        return 1
    } else {
        return num * fact(num: num-1)
    }
}

print("num ==",fact(num: 3))
//
//func twoSum(_ nums: [Int], target: Int) -> [Int] {
//    var dic: [Int: Int] = [:]
//    for i in 0 ..< nums.count {
//        let newIndex = target - nums[i]
//        print("all key",dic.keys, dic.values)
//        print("test value saved:",dic[nums[i]])
//        if let index = dic[nums[i]] {
//            return [index,i]
//        } else {
//            dic[newIndex] = i
//        }
//    }
//    return []
//}
//
//twoSum([3,3], target: 6)

struct Stack {
    var arr: [Int] = []

    mutating func push(_ element: Int) {
        arr.append(element)
    }
    mutating func pop() {
        arr.removeLast()
    }
}


//
//class LinkList<T>: Equatable {
//    static func == (lhs: LinkList<T>, rhs: LinkList<T>) -> Bool {
//        return lhs == rhs
//    }
//
//    var head: Node<T>?
//    var tail: Node<T>?
//    var isFirst: Node<T>? {
//        return head
//    }
//
//    var last: Node<T>? {
//
//        return tail
//    }
//
//    func appendNewElement(items: T) {
//        let nNode = Node(value: items)
//        nNode.next = head
//        head = nNode
//
//    }
//
//    func setDummyNodes() {
//        let two = Node<Int>(value: 2)
//        let one = Node<Int>(value: 1)
//    }
//
//    func showList() {
//        var cNode = head
//        while cNode != nil {
//            Swift.print("showing ==> \(String(describing: cNode?.value))")
//            cNode = cNode?.next
//        }
//        Swift.print("nil")
//    }
//
//    func insertNewNode(item: T) -> LinkList {
//        let newNode = Node(value: item)
//        var count = 0
//
//        if head == nil {
//            head = newNode
//        } else {
//            var currentNode = head
//            while currentNode?.next != nil {
//                currentNode = currentNode?.next
//            }
//            currentNode?.next = newNode
//        }
//
//        return self
//    }
//
//    func push(item: T) {
//        let node = Node(value: item)
//        node.next = head
//        head = node
//    }
//
//    func count(searchFor: T) -> Int where T: Equatable {
//        var currentNode = head
//        var count = 0
//
//        while currentNode != nil {
//            if currentNode?.value == searchFor {
//                count += 1
//            }
//            currentNode = currentNode!.next
//        }
//        return count
//    }
//
//    func gethNth(index: T) -> Int where T: Equatable {
//
//        var currentNode = head
//        var count = 0
//
//        while (currentNode != nil) {
//            count += 1
//            currentNode = currentNode?.next
//        }
//        return count
//
//    }
//
//    func countHowManyNode() -> Int where T: Equatable {
//        var count = 0
//        var currentNode = head
//        while (currentNode != nil) {
//            count += 1
//            currentNode = currentNode?.next
//        }
//        return count
//    }
//
//    func counRecursive(node: Node<T>?, searchFor: T) -> Int  where T: Equatable {
//        var frequency: Int = 0
//        if node?.value == searchFor {
//            frequency += 1
//        }
//        return counRecursive(node: node?.next, searchFor: searchFor)
//    }
//
//    func getCountRec(node: Node<T>?) -> Int where T: Equatable {
//        if node != nil {
//            return 1+getCountRec(node: node?.next)
//        }
//        return 0
//    }
//
//
//    func reverser() -> Node<T>? {
//        var current = head
//        var prev: Node<T>? = nil
//        var next: Node<T>? = nil
//
//        while (current != nil) {
//            next = current?.next
//            current?.next = prev
//            prev = current
//            current = next
//        }
//        return prev
//    }
//
//    func print(node: inout Node<T>?)  {
//        while node != nil {
//            Swift.print("====>",node?.value)
//            node = node?.next
//        }
//    }
//
//    func deleteNodeN(head: inout Node<T>?, position: T?) -> Node<T>?  {
//
//        guard let position = position as? Int else {
//            return nil
//        }
//        var temp: Node? = head
//        var prev = head
//        for i in 0 ..< position {
//            if i == 0 && position == 1 {
//                head = head?.next
//            } else {
//
//
//                if i == position - 1 {
//                    prev?.next = temp?.next
//                } else {
//                    prev = temp
//                    temp = temp?.next!
//
//                }
//            }
//
//        }
//        return head
//
//    }
//
//    func deleteNodeNRec(head: Node<T>?, position: T?) -> Int where T: Equatable {
//        if head == nil {
//            return 0
//        }
//        if head?.value == position {
//            if head?.next != nil {
//                head?.value = (head?.next?.value)!
//                head?.next = head?.next?.next
//                return 1
//            } else {
//                return 0
//            } }
//
//            let result = deleteNodeNRec(head: head?.next, position: position)
//            if result  == 0 {
//                head?.next = nil
//                return 1
//            }
//            return result
//    }
//
//    func deleteNodePrevious(head:  Node<T>?, position: T?) -> Node<T>? where T: Equatable
//    {
//        if head == nil {
//            return nil
//        }
//
//        if head?.value == position  {
//            return head
//        }
////
////        // If node is head
////        if node == head {
////          return nil
////        }
//        return deleteNodePrevious(head: head?.next, position: position)
//
//    }
//
//
//
//
//    func findPreviousPosition(head: Node<T>?,node: Node<T>? ) -> Int  where T: Equatable {
//
//        guard head != nil else {
//            return -1
//        }
//
//        if node == head {
//            return -1
//        }
//
//        if head?.next == node {
//            return 0
//        }
//
//        let previousNode = findPreviousPosition(head: head?.next, node: node)
//
//        if previousNode != -1 {
//            return previousNode+1
//        } else {
//            return -1
//        }
//    }
//
//
//
//
//    func printList( node: inout Node<T>?) {
//          while node != nil {
//              Swift.print("====>",node?.value)
//              node = node!.next
//          }
//      }
//
//
//    func mergeLinkedLists<T: Comparable>(listOne: Node<T>, listTwo: Node<T>) -> Node<T> where T: Equatable {
//
//      var list1 = listOne
//      var list2 = listTwo
//        let resultNodeHead = Node<T>.init(value: T.self as! T)
//      var currentNode = resultNodeHead
//
//      while list1 != nil && list2 != nil {
//        if list1.value < list2.value {
//            currentNode.next = list1
//            list1 = list1.next!
//        } else {
//          currentNode.next = list2
//            list2 = list2.next!
//        }
//        currentNode = currentNode.next!
//      }
//
//      if list1 != nil {
//        currentNode.next = list1
//      } else {
//        currentNode.next = list2
//      }
//
//      return resultNodeHead.next!
//    }
//
//
//
//
//
//}
//
//let myLinkedList = LinkList<Int>()
//
//myLinkedList.push(item: 1)
//myLinkedList.push(item: 2)
//myLinkedList.push(item: 3)
//myLinkedList.push(item: 5)
//
//var header = myLinkedList.reverser()



//let list2 = LinkList<Int>()
//
//list2.push(item: 3)
//list2.push(item: 4)
//list2.push(item: 6)
//var node2 = list2.reverser()
//list2.print(node: &node2)

class LinkedNode<T> {
    var next: LinkedNode<T>?
    var value: T

    init(next: LinkedNode<T>?, value: T) {
        self.next = next
        self.value = value
    }

    func printList() {

        var currentNode = self
        print(value)
        while currentNode.next != nil {
            currentNode = currentNode.next!
            print(currentNode.value)
        }
    }

}

//let linkedNode5 = LinkedNode(next: nil, value: 5)
//let linkedNode4 = LinkedNode(next: linkedNode5, value: 3)
//let linkedNode3 = LinkedNode(next: linkedNode4, value: 2)
//let linkedNode2 = LinkedNode(next: linkedNode3, value: 2)

//func mergeTwoNode(listOne: Node<Int>, listTwo: Node<Int>) -> Node<Int> {
//
//    var mergeHead: Node<Int>?
//    var mergeTail: Node<Int>? = nil
//    if listOne == nil {
//        return listTwo
//    } else {
//        return listTwo
//    }
//
//    if listOne.value < listTwo.value {
//        mergeHead = listOne
//        mergeTail = mergeTwoNode(listOne: listOne.next!, listTwo: listTwo)
//    } else {
//        mergeHead = listTwo
//        mergeTail = mergeTwoNode(listOne: listOne, listTwo: listTwo.next!)
//    }
//    mergeHead?.next = mergeTail
////    printNode(node: mergeTail!)
//    return mergeHead!
//
//}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }

func mergeLinkedLists(listOne: ListNode?, listTwo: ListNode?) -> ListNode? {

    var list1 = listOne // 1
    var list2 = listTwo // 2
    guard listOne != nil && list2 != nil else { return nil }
    let resultNodeHead = ListNode(0, nil) // 3
    var currentNode : ListNode = resultNodeHead // 4

    while list1?.val != nil && list2?.val != nil { // 5

        if list1!.val < list2!.val { // 5
            currentNode.next = list1
            list1 = list1?.next
        } else {
            currentNode.next = list2
            list2 = list2?.next

        }

        currentNode = currentNode.next! // 6
    }

    if list1 != nil { // 7
        currentNode.next = list1
    }

    if list2 != nil { // 7
        currentNode.next = list2
    }

    return resultNodeHead.next
}

func mergeLinkedListsRecursive(listOne: ListNode?, listTwo: ListNode?) -> ListNode {

    if listOne == nil {
        return listTwo!
    } else if listTwo == nil {
        return listOne!
    }
    guard let listOne = listOne else { return listTwo! }
    guard let listTwo = listTwo else { return listOne }
    var resultNodeHead = ListNode(0, nil) // 3
    var currentNode : ListNode = resultNodeHead // 4
    var val1 = listOne.val
        if listOne.val < listTwo.val {
            currentNode = listOne
            resultNodeHead =  mergeLinkedListsRecursive(listOne: listOne.next, listTwo: listTwo)
        } else {
            currentNode = listTwo
            resultNodeHead = mergeLinkedListsRecursive(listOne: listOne, listTwo: listTwo.next)
        }

    currentNode.next = resultNodeHead
    return currentNode

}

func printNode(string: String = "-->", node: ListNode)  {
    print(string,node.val)
    guard let next = node.next else { return }
    printNode(node: next)
}

let listOne = ListNode.init(1, .init(3, .init(5)))

let listTwo = ListNode.init(2, .init(4, .init(6)))



//printNode(node: mergeLinkedListsRecursive(listOne: listOne, listTwo: listTwo))

//

func maxProfit(price: [Int]) -> Int {

    var buy = price[0]
    var profit: Int = 0
    for sell in price {
        if sell > buy {
            profit = max(profit, sell-buy)
        } else {
            buy = sell
        }
    }

    return profit
}





//isPalindrome("A man, a plan, a canal: Panama")
//testinPlindrome("A man hhahha")
//print( txt.replacingOccurrences(of: regex, with: repl, options: [.regularExpression]) )

//let tree = BinaryTree<Int>(value: 10)
//
//tree.insertNode(value: 5)
//tree.insertNode(value: 10)
//tree.insertNode(value: 4)
//tree.insertNode(value: 25)

//tree.deleteNode(root: tree, key: 10)
//tree.deleteNode(root: tree, key: 25)

//tree.printTree()
//tree.preOrderTraversal(node: tree)

//class BinarySearch {
//
//    public init() { }
//
//    public func search(arr: [Int], target: Int) -> Int {
//        var lelft = 0
//        var right = arr.count-1
//
//        while lelft <= right {
//
//            let midle = (lelft+right) / 2
//            print("midle ===> \(midle)")
//            if arr[midle] == target {
//                return midle
//            } else if arr[midle] < target {
//                lelft = midle+1
//                print("lelft ===> \(right)")
//
//            } else  {
//                print("right ===> \(right)")
//                right = midle-1
//            }
//        }
//        return 1
//    }
//}
let binarySearh = BinarySearch()
let arr =  [1, 3, 5, 7, 9, 11]
binarySearh.binarySearchRecursion(arr: arr,
                                  target: 7,
                                  right: arr.count-1
)

let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let target = 8

let index = binarySearh.binarySearchRecursion(arr: numbers,
                                              target: target,
                                              right: numbers.count-1
)
if index != -1 {
    print("Target found at index",index , numbers[index])
} else {
    print("Target not found")
}




func isPalindromeInt(_ x: Int) -> Bool {
    if x < 0 {
        return false
    }
  var num = x
  var reveNum = 0

  while num != 0 {
      reveNum = reveNum * 10 + num % 10
      num /= 10
  }

  if x == reveNum {
      return true
  }
  return false
}

isPalindromeInt(-121)

func isPalindromeRecursion(_ x: Int, reverNum: Int = 0) -> Bool {
    var num = x
    var reverNum = reverNum

    if num < 0 {
        return false
    } else if num == 0 {
        return reverNum == num
    } else {
        reverNum = reverNum * 10 + num % 10
        num /= 10
        if reverNum == x {
            return true
        } else if reverNum > x {
            return false
        }
        return isPalindromeRecursion(num,reverNum: reverNum)
    }

}


isPalindromeRecursion(101)

binarySearh.selectionSort(array: [0,3,2,1,5])

func romanToInt(_ s: String) -> Int {
    let numTable  = ["I": 1,
                                       "V": 5,
                                       "X": 10,
                                       "L": 50,
                                       "C": 100,
                                       "D": 500,
                                       "M": 1000
    ]
    let validate = ["I","V", "X", "L", "C", "D", "M"]

    var result = 0
    var previous = 0
    for character in s {

        if let num = numTable["\(character)"] {
            result += num
            if num > previous {
//                print("num ==> \(num)")
                let testing = result - 2*previous
                print("num ==> \(num) \(result) \(previous)")
            }
            previous = num

        }

    }
    return result
}

func findMax(arr: [Int])  {
    var max = arr[0]
    var arrMax: [Int] = []
    for _ in 0..<arr.count {

    }

    var index = 0
    while index < arr.count  {
        
    }

    for obj in arrMax {
        print("max ==> \(obj)")
    }
}

func removeDuplicates(_ nums: inout [Int]) ->Int {
    var left = nums.count
    var index = 0
    for r in nums where r != nums[index] {
        nums[index] = r
        index += 1
        print("r",r)

    }
    return left
}
var nums = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4]
removeDuplicates(&nums)



//findMax(arr: [0,1,2,3,5,6,7,7])
enum ButtonConfig {

    case primary
    case second
}

enum CVPFormatter {

    case title(content: String)
    case subTitle(content: String)
    struct Content {
        var buttonConfig: ButtonConfig
    }
}

extension CVPFormatter: Equatable {

}


//romanToInt("LVIII")

//romanToInt("IV")
//romanToInt("XC")

/*
 hash = ["I": 1,
 "V": 5,
 "X": 10,
 "L": 50,
 "C": 100,
 "D": 500,
 "M": 1000
]

previous = 0
 - hash value exist
 => result += currentNum
 - current > previous
 => result -= 2*previous



 */
//binarySearh.merged(arr: [4,0,2,1])

//let arr: [Int] = [0,2,3,4,5]
//
//print(arr[0..<3])




func revert(num: Int) -> Int {

    if num == 0 {
        return 0
    } else {
        return revert(num: num%10) + 10 * revert(num: num/10)
    }
}




print("runing ===> \(reversNum(num: 123))")

print("finding ===> \(findGCD(numA: 54, numB: 24))")



func isValid(_ s: String) -> Bool {
    var stack: [Character] = []
    if s.count <= 1 {
        return false
    }

    for str in s {
        switch str {
        case "{":
            stack.append("}")
        case "}":
            stack.popLast()
        case "(":
            stack.append(")")
        case ")":
            stack.popLast()
        case "[":
            stack.append("]")
        case "]":
            if stack.last == "]" {
                stack.popLast()
            }
        default:
            stack.popLast()
        }
    }

    return stack.isEmpty
}

isValid("({{{{}}}))")
//print("executing ==>",digitToWords(num: 3))
protocol AbtractCache {
    associatedtype T
    func save(object: T)
}

final class Cache<T:Encodable>: AbtractCache {

    func save(object: T) {

    }


}

final class UseCase<Cache> where Cache: AbtractCache {
    var cache: Cache

    init(cache: Cache) {
        self.cache = cache
    }
}

func longestCommonPrefix(_ strs: [String]) -> String {
    guard let firstStr = strs.first else { return "" }
    var commonPrefix = ""
    var charIndex = firstStr.startIndex
    print("start index \(charIndex.hashValue)")

    while charIndex < firstStr.endIndex {
        let char = firstStr[charIndex]
        print("char \(char)")
        for index in 1..<strs.count {
            if charIndex >= strs[index].endIndex || strs[index][charIndex] != char {
                return commonPrefix
            }
        }

        commonPrefix.append(char)
        charIndex = firstStr.index(after: charIndex)
    }

    return commonPrefix
}

longestCommonPrefix(["flower","flow","flight"])


//func maxProfit(_ prices: [Int]) -> Int {
//
//    var left = 0
//    var right = left+1
//    var maxProfit = 0
//
//    while right < prices.count {
//
//        if prices[right] > prices[left] {
//            maxProfit =  max(maxProfit, prices[right] - prices[left])
//        } else {
//            left = right
//        }
//        left += 1
//        right += 1
//    }
//    return maxProfit
//}

func maxProfit(_ prices: [Int]) -> Int {
    var left = 0
    var right = left + 1
    var maxProfit = 0

    while right < prices.count {
        if prices[left] < prices[right] {
            maxProfit = max(maxProfit, prices[right] - prices[left])
        } else {
            left = right
        }
        left += 1
        right += 1
    }
    return maxProfit
}


maxProfit([7,1,5,3,6,4])

struct Person {
  var name: String
  var address: Address
}

struct Address {
  var street: String
  var city: String
}

let person = Person(name: "John Doe", address: Address(street: "1 Main St", city: "San Francisco"))

let streetPath = \Person.address
let steet = person[keyPath: streetPath]
print(steet)



//var queue = Queue<String>()
//queue.enQueue(element: "Adam")
//queue.enQueue(element: "Julia")
//queue.enQueue(element: "Ben")

// we have 3 customers to serve, we're going to serve them in order of arrived
//let serving = queue.deQueue()
//let nextToServe = queue.head // J


class MyStack {

    var queue =  Queue()

    init() {
        queue = Queue()
    }

    func push(_ x: Int) {
        queue.push(x)
    }

    func pop() -> Int {
        for _ in 0..<(queue.count ?? 0)-1 {
            queue.push(queue.pop())
        }
        return queue.pop()
    }

    func top() -> Int {
        for element in 0..<((queue.count ?? 0) - 1){
            print("==>",element)
//            queue.push(queue.pop())
        }

      defer {
          queue.push(queue.pop())
      }

        return queue.tail ?? 0
    }

    func empty() -> Bool {
        return queue.count == 0
    }
}

class Queue {

    var elements: [Int] = []

    init() { }

    func push(_ x: Int) {
        elements.append(x)
    }

    var head: Int? {
        return elements.first
    }

    func pop() -> Int {
        elements.popLast()!
    }

    var tail: Int? {
        return elements.last
    }

    var count: Int? {
        return elements.count
    }

    func isEmpty() -> Bool{
        return elements.isEmpty
    }

}



let stack = MyStack()

stack.push(3)
stack.push(5)
stack.push(6)

stack.top()
stack.empty()
stack.pop()
/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Bool = obj.empty()
 */
var arr1 = [1,2,3,4,5]
print(arr1.count-1)
for el in 0..<arr1.count-1 {
    print("element",el)
}

func subArray(arr: [Int], n: Int) {
    for i in 0..<n {
        for j in i..<n {
            for k in i...j {
                print(arr[k])
            }
        }
    }
}

subArray(arr: [1,2,3,4], n: 4)


//void subArray(int arr[], int n)
//{
//    // Pick starting point
//    for (int i=0; i <n; i++)
//    {
//        // Pick ending point
//        for (int j=i; j<n; j++)
//        {
//            // Print subarray between current starting
//            // and ending points
//            for (int k=i; k<=j; k++)
//                cout << arr[k] << " ";
//
//            cout << endl;
//        }
//    }
//}

// Struct containing left and right child of current node and key value
class Node {
    let key: Int
    var left: Node?
    var right: Node?

    init(key: Int) {
        self.key = key
        self.left = nil
        self.right = nil
    }
}


final class BinaryTree {
    var root: Node?

    init(root: Node? = nil) {
        self.root = root
    }

    func printOder(_ node: Node?) {
        guard let node = node else { return }
        printOder(node.left)
        print("key",node.key)
        printOder(node.right)
    }

    func printPreOder(_ node: Node?) {
        guard let node = node else { return }
        print("key printPreOder",node.key)
        printPreOder(node.left)
        printPreOder(node.right)

    }

    func printPostOder(_ node: Node?) {
        guard let node = node else { return }
        printPreOder(node.left)
        printPreOder(node.right)
        print("key printPreOder",node.key)

    }

    



}

let tree = BinaryTree()
tree.root = Node(key: 1)
tree.root?.left = Node(key: 2)
tree.root?.right = Node(key: 3)
tree.root?.left?.left = Node(key: 4)
tree.root?.left?.right = Node(key: 5)
print("Inorder traversal of binary tree is:")
//tree.printOder(tree.root)
tree.printPreOder(tree.root)

func maxSum(nums: [Int], k: Int) -> Int {
    var max = 0
    var sum = 0
    for i in 0..<k {
        sum += nums[i]
        max = sum
    }

    for i in k..<nums.count {
        sum += nums[i] - nums[i - k]
        if sum > max {
            max = sum
        }
    }
    return max

}
let arrT = [1, 4, 2, 10, 2, 3, 1, 0, 20];
let k = 4;
let slide = maxSum(nums: [5,2,-1,0,3] , k: 3)
print("max sum",slide)


func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    var nums = nums.sorted() // Sort for efficient two-pointer and duplicate handling
    var result: [[Int]] = []

    for i in 0..<nums.count - 3 {
        // Skip duplicates for the first element
        if i > 0 && nums[i] == nums[i - 1] { continue }

        var left = i + 1
        var right = nums.count - 1

        while left < right {
            let currentSum = nums[i] + nums[left] + nums[right]

            if currentSum < target { // Optimization: Check for potential sums
                left += 1
            } else if currentSum > target {
                right -= 1
            } else {
                var mid = left + 1
                while mid < right && nums[mid] == nums[mid - 1] { // Skip duplicate mid
                    mid += 1
                }

                result.append([nums[i], nums[left], nums[mid], nums[right]])
                left += 1
                right -= 1

                    // Skip duplicates for left and right
                    while left < right && nums[left] == nums[left - 1] {
                        left += 1
                    }
                    while left < right && nums[right] == nums[right + 1] {
                        right -= 1
                    }
                }
            }
        }

        return result
    }


//public struct ListNode {
//    public var val: Int
//    public var next: ListNode?
//
//    public init(_ val: Int) {
//        self.val = val
//        self.next = nil
//    }
//}

public struct LinkedList {
    public var head: ListNode?
    public var tail: ListNode?

    public var isEmpty: Bool {
        return head == nil
    }

    public mutating func push(_ value: Int) {
        let newNode = ListNode(value)
        if isEmpty {
            head = newNode
            tail = newNode
        } else {
            newNode.next = head
            head = newNode
        }
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

    public mutating func append(_ value: Int) {
        let newNode = ListNode(value)
        if isEmpty {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }

    public mutating func insert(_ value: Int, after node: ListNode) {
        let newNode = ListNode(value)
        if node === tail {
            append(value)
        } else {
            newNode.next = node.next
            node.next = newNode
        }
    }

    @discardableResult
    public mutating func pop() -> Int? {
        guard let oldHead = head else {
            return nil
        }
        defer {
            head = oldHead.next
            if isEmpty {
                tail = nil
            }
        }
        return oldHead.val
    }

    @discardableResult
    public mutating func remove(after node: ListNode) -> Int? {
        guard let nodeToRemove = node.next else {
            return nil
        }
        defer {
            if nodeToRemove === tail {
                tail = node
            }
            node.next = nodeToRemove.next
        }
        return nodeToRemove.val
    }

    public func printAll() {
        var current = head
        while let currentNode = current {
            print("current value:", currentNode.val)
            current = currentNode.next
        }
    }
}

// Create an instance of LinkedList
var list = LinkedList()

// Push elements onto the linked list
list.push(1)
list.push(2)
list.push(3)
list.push(4)

// Print the original list
print("Original list:")
//list.printAll()

// Reverse the list
list.reverse()

// Print the reversed list
print("\nReversed list:",list)
//list.printAll()
let q1 = DispatchQueue(label: "q1", attributes: .concurrent)
let q2 = DispatchQueue(label: "q2", attributes: .concurrent)

var count = 0
//
//func increment(queue: DispatchQueue) {
//    count = count + 1
//    print("write count: \(count) in queue: \(queue.label)")
//}
//
//func read(queue: DispatchQueue) {
//    print("read count: \(count) in queue: \(queue.label)")
//}


//func perform(queue: DispatchQueue) {
//    increment(queue: queue)
//    read(queue: queue)
//}
//
//for _ in 1...5 {
//    q1.async {
//        perform(queue: q1)
//    }
//    q2.async {
//        perform(queue: q2)
//    }
//}
protocol Shape {
    func getArea() -> Double
}

class Rectangle: Shape {
    var width: Double
    var height: Double

    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }

    func getArea() -> Double {
        return width * height
    }
}

func calculateTotalArea(shapes: [Shape]) -> Double {
    var totalArea = 0.0
    for shape in shapes {
        totalArea += shape.getArea() // LSP allows using any Shape subclass here
    }
    return totalArea
}

class Square: Rectangle {

    override init(width: Double, height: Double) {
        super.init(width: width, height: height)
    }
}


// Usage:
let rectangle = Rectangle(width: 5, height: 3)
let square = Square(width: 4, height: 4) // Enforces square dimensions
let shapes: [Shape] = [rectangle, square]
let totalArea = calculateTotalArea(shapes: shapes) // Works for both Rectangle and Square objects
print("Total area: \(totalArea)")


class HeavyWork {

    static func runUserInitiatedTask(seconds: UInt32) {
        Task(priority: .userInitiated) {
            print("🥸 userInitiated: \(Date())")
            sleep(seconds)
        }
    }

    static func runUtilityTask(seconds: UInt32) {
        Task(priority: .utility) {
            print("☕️ utility: \(Date())")
            sleep(seconds)
        }
    }

    static func runBackgroundTask(seconds: UInt32) {
        Task(priority: .background) {
            print("⬇️ background: \(Date())")
            sleep(seconds)
        }
    }
}

// Test 1: Creating Tasks with Same Priority Level
for _ in 1...150 {
    HeavyWork.runUserInitiatedTask(seconds: 3)
}
