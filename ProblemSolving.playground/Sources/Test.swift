import Foundation


public class Test {

    public init() {

    }

    public func inOrderTraversal(_ root: TreeNode<Int>?) {

        guard let node = root else { return }

        inOrderTraversal(node.left)
        print("everynode i visited", node.val)
        inOrderTraversal(node.right)
    }

    public func iterativeInOrderTraversal(_ root: TreeNode<Int>?) {

        var stack: [TreeNode<Int>] = []
        var currentNode = root

        while !stack.isEmpty || currentNode != nil {
            while currentNode != nil {
                stack.append(currentNode!)
                currentNode = currentNode?.left
            }
            currentNode = stack.removeLast()

            print("value visited",currentNode?.val ?? 0)
            currentNode = currentNode?.right

        }
    }

    public func preOrderTraversal(_ root: TreeNode<Int>?) {
        guard let node = root else { return }
        print("preOrderTraversal visited \(node.val)")

        preOrderTraversal(node.left)
        preOrderTraversal(node.right)

    }

    public func preOrderTraversalIterative(_ root: TreeNode<Int>?) {
        var stack: [TreeNode<Int>] = []
        var currentNode = root

        while !stack.isEmpty {
            let current = stack.removeLast()
            print(current.val)

            if let right = current.right {
                stack.append(right)
            }

            if let left = current.left {
                stack.append(left)
            }
        }

    }

    //MARK: 3 Longest Substring Without Repeating Characters
    public func lengthOfLongestSubstring(_ s: String) -> Int {
        let newArray = Array(s)
        var maxLeght = 0
        var hashMap = Set<Character>()
        var left  = 0
        var right = 0
        while right < newArray.count {
            if !hashMap.contains(newArray[right]){
               hashMap.insert(newArray[right])
               maxLeght = max(maxLeght, right - left + 1)
               right += 1
           } else {
               hashMap.remove(newArray[left])
               left += 1
           }

        }

        return maxLeght
    }


//    prices = [7,1,5,3,6,4]
        /*
          0 => 0
         1 => 1 2 =>
         left = 1 right = 3 =>

         left = 1 right = 6 = 5
         left = 1 right = 4


         */

    //MARK: 121. Best Time to Buy and Sell Stock

    public func maxProfit(_ prices: [Int]) -> Int {
        var left = 0
        var right = 0
        var profit = 0
        while right < prices.count {
            if prices[left] < prices[right] {
                profit = max(profit,prices[right] - prices[left])
            } else {
                left = right
            }
            right += 1
        }

        return profit
    }

    public func characterReplacement(_ s: String, _ k: Int) -> Int {

        var right = 0
        var left = 0
        var arrStr = Array(s)
        var maximum = 0
        var maximumCount = 0
        var hashMap: [Character: Int] = [:]

        while right < arrStr.count {
            let char = arrStr[right]
            hashMap[char, default: 0] += 1
            maximum = max(maximum, hashMap[char] ?? 0)
            while (right - left+1) - maximum > k {
                hashMap[arrStr[left]]! -= 1
                left += 1
            }
            maximumCount = max(maximumCount, (right - left+1))
            right += 1
        }
        return maximumCount

    }
    public func nextSmallerElements(_ nums: [Int]) -> [Int] { 
        var result = Array(repeating: -1, count: nums.count)
            var stack: [Int] = []

            for i in 0..<nums.count {
                while !stack.isEmpty && nums[stack.last!] > nums[i] {
                    let index = stack.removeLast()
                    result[index] = nums[i]
                }
                stack.append(i)
            }

            return result
    }

    //MARK:  3217. Delete Nodes From Linked List Present in Array

//    func deleteNode()

    public func modifiedList(_ nums: [Int], _ head: ListNode?) -> ListNode? {
        var current = head
        var prev: ListNode?
        var newHead: ListNode?

        let valuesToDelete = Set(nums)
        while current != nil && valuesToDelete.contains(current!.val) {
            current = current?.next
        }

        newHead = current

        while current != nil {
            if valuesToDelete.contains(current?.val ?? 0) {
                prev?.next = current?.next
            } else {
                prev = current
            }
            current = current?.next
        }

        return newHead

    }

   public func isSubPath(_ head: ListNode?, _ root: TreeNode<Int>?) -> Bool {

        if root == nil { return false }
        func dfs(_ head: ListNode?, _ root: TreeNode<Int>?) -> Bool {
            if head == nil { return true }
            if root == nil || head?.val != root?.val { return false }
            return dfs(head?.next, root?.left) || dfs(head?.next, root?.right)
        }

        return dfs(head, root) || isSubPath(head, root?.left) || isSubPath(head, root?.right)
    }

    public func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {

        var results: [Int]  = Array(repeating: -1, count: nums1.count)

        var hashMap: [Int: Int] = [:]
        var stack: [Int] = []
        for (index, value) in nums1.enumerated() {
            hashMap[value] = index
        }

        for num in nums2 {

            while !stack.isEmpty, let last = stack.last, num > last {
                let lastItems = stack.popLast()!
                if let index = hashMap[lastItems] {
                    results[index] = num
                }
                print("last Item", lastItems)
            }

            stack.append(num)

        }
        return results
    }

    public func generatePermutations(_ nums: [Int]) -> [[Int]] {

        var results: [[Int]] = []
        func backtrack(_ path: [Int], _ remaining: [Int]) {
            if remaining.isEmpty {
                results.append(path)
                return
            }
            for i in 0..<remaining.count {
                var newPath = path
                var newRemaining = remaining
                newPath.append(newRemaining[i])
                newRemaining.remove(at: i)
                backtrack(newPath, newRemaining)
            }

        }
        backtrack([], nums)
        return results
    }
    
    public func permute(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = []
        func backtrack(path: [Int], _ remaining: [Int]) {
            if remaining.isEmpty {
                results.append(path)
            }

            for i in 0..<remaining.count {
                var newPath = path
                var newRemaining = remaining
                print("value", newRemaining[i])
                newPath.append(newRemaining[i])
                newRemaining.remove(at: i)
                backtrack(path: newPath, newRemaining)
            }
        }
        backtrack(path: [], nums)
        return results
    }

    public func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = []
        var path: [Int] = []
        var visited: [Bool] = Array(repeating: false, count: nums.count)
        let sorted = nums.sorted()
        func backtrack() {
            if path.count == sorted.count {
                results.append(path)
                return
            }
            for i in 0..<sorted.count {

                if i > 0 && sorted[i] == sorted[i - 1] && !visited[i-1] {
                    continue
                }
                if !visited[i] {
                    visited[i] = true
                    path.append(sorted[i])
                    backtrack()
                    path.removeLast()
                    visited[i] = false
                }
            }
        }
        backtrack()
        return results


    }

    public func nextPermutation(_ nums: inout [Int]) {
        var i = nums.count - 2

            // Step 1: Find the first decreasing element
            while i >= 0 && nums[i] >= nums[i + 1] {
                i -= 1
            }

            // Step 2: If found, find the next largest element to swap
            if i >= 0 {
                var j = nums.count - 1
                while nums[j] <= nums[i] {
                    j -= 1
                }
                nums.swapAt(i, j)  // Swap nums[i] and nums[j]
            }

            // Step 3: Reverse the subarray starting from i+1
            reverse(&nums, i + 1, nums.count - 1)

    }

    private func reverse(_ nums: inout [Int], _ start: Int, _ end: Int) {
        var left = start
        var right = end
        if left < right {
            nums.swapAt(left, start)
            left += 1
            right -= 1
        }
    }

    public func letterCasePermutation(_ s: String) -> [String] {
        var current = Array(s)
        var results: [String] = []

        func backtrack(_ index: Int) {
            if index == current.count {
                results.append(String(current))
                return
            }

            backtrack(index)
            print("index",index)
            if current[index].isLetter {
                current[index] = current[index].isUppercase ?
                                             Character(current[index].lowercased()) :
                                             Character(current[index].uppercased())
                backtrack(index+1)

                // Backtrack to the original state
//                         current[index] = current[index].isUppercase ?
//                                          Character(current[index].lowercased()) :
//                                          Character(current[index].uppercased())
            }



        }
        backtrack(0)

        return results
       }

    public func maxFrequency(_ nums: [Int], _ k: Int) -> Int {

        var maxFreq: Int = 0
        var nums = nums.sorted()

        var left = 0
        var total = 0

        for right in 0..<nums.count {
            total += nums[right]

            while nums[right] * (right - left + 1) > total {
                total -= nums[left]
                left += 1
            }

            maxFreq = max(maxFreq,right - left + 1)
        }
        return maxFreq
    }

    public func maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count-1
        var maxArea = 0
        while left < right {
            let window = right - left
            let area = window*min(height[left], height[right])
            maxArea = max(maxArea, area)
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        return maxArea
    }

    //MARK: 179. Largest Number
    public func largestNumber(_ nums: [Int]) -> String {

        var numsStr = nums.map { String($0) }

        let n = nums.count
        for i in 0..<n {

            for j in 0..<n-i-1 {
                let a = numsStr[j]
                let b = numsStr[j+1]
                print("===>",a, b, i,j)
                if a + b < b + a {
                    // Swap if the order is incorrect
                    numsStr.swapAt(j, j + 1)
                }
            }
        }
        // Step 3: Join the sorted array of strings
           let result = numsStr.joined()

           // Step 4: Handle edge case where all numbers are zeros
           return result.first == "0" ? "0" : result

       }

   public func isHappy(_ n: Int) -> Bool {

       var seenNumbers = Set<Int>() // Set to track seen numbers
       var current = n

       func sumOfSquare(num: Int) -> Int {
           var sum = 0
           var number = num

           while number > 0 {        // Continue extracting digits until the number is reduced to 0
               let digit = number % 10 // Extract the last digit of the number using modulo 10
               sum += digit * digit    // Square the extracted digit and add it to the sum
               number /= 10            // Remove the last digit by dividing the number by 10
           }
           return sum
       }
       // Loop to detect cycles

       while current != 1 && !seenNumbers.contains(current) {
           seenNumbers.insert(current)
           current = sumOfSquare(num: current)
       }
        return current == 1
    }

    public func detectCycle(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next

            if slow === fast {
                break
            }
        }

        if fast != nil && fast?.next != nil {
            return nil
        }

        slow = head
        while slow !== fast {
            slow = slow?.next
            fast = fast?.next
        }
        return slow
    }

    public func lexicalOrder(_ n: Int) -> [Int] {
        var results: [Int] = []
        for i in 1...n {
            dfs(i, n, &results) // Perform DFS with the current digit and n
        }
        return results
    }

    private func dfs(_ curr: Int, _ n: Int, _ result: inout [Int]) {
        if curr > n {
            return
        }
        result.append(curr)

        for i in 0...9 {
            let next = curr * 10 + i
            if next > n {
                break
            }
            dfs(next, n, &result)
        }

    }

    public func isPalindrome(num: Int) -> Bool {
        var number = num
        var reversedNumber = 0

        while number > 0 {     // Continue extracting digits until the number is reduced to 0
            let digit = number % 10 // Extract the last digit of the number using modulo 10
            reversedNumber = reversedNumber * 10 + digit // build the reversed number 
            number /= 10            // Remove the last digit by dividing the number by 10
        }
        
        if reversedNumber == num {
            return true
        }
        return false
    }

    public func moveZeroes(_ nums: inout [Int]) {
        var left = 0
        for right in 0..<nums.count {
            if nums[right] != 0 {
                nums.swapAt(left, right)
                left += 1
            }
        }
    }

   public func reverseList(_ head: ListNode?) -> ListNode? {

       var current = head
       var prev: ListNode? = nil

       while current != nil {
           let next = current?.next
           current?.next = prev
           prev = current
           current = next
       }

       return prev

   }

    public func isPalindrome(_ head: ListNode?) -> Bool {

        var stack: [Int] = []

        var current = head

        while current != nil {
            print("soft spot", current?.val)
            stack.append(current!.val)
            current = current?.next
        }
        current = head

        var isPalindrome: Bool = false
        while current != nil   {
            print("==>", current?.val)
            if current?.val == stack.popLast()! {
                isPalindrome = true
            }
            current = current?.next
        }
        return isPalindrome

    }

   public func isPalindrome(_ s: String) -> Bool {
       let cleandedString = s.lowercased().filter { $0.isLetter || $0.isNumber}

       let char = Array(s)

        var left = 0
        var right = char.count-1

        while left < right {
            if char[left] != char[right] {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }


    public func mergeSortedArrays(_ arr1: [Int], _ arr2: [Int]) -> [Int] {

        var results: [Int] = []
        var j = 0, i = 0

        while i < arr1.count && j < arr2.count {
            if arr1[i] < arr2[j] {
                results.append(arr1[i])
                i += 1
            } else {
                results.append(arr2[j])
                j += 1
            }

        }

        while i < arr1.count {
            results.append(arr1[i])
            i += 1
        }

        while j < arr2.count {
            results.append(arr2[j])
            j += 1
        }

        
        return results
    }

    func sortList(_ head: ListNode?) -> ListNode? {

        if head == nil || head?.next == nil {
            return head
        }

        let mid = getMiddle(head)
        let right = mid?.next
        mid?.next = nil

        let leftSorted = sortList(head)
        let rightSorted = sortList(head)

        return merge(leftSorted, rightSorted)
      }

    func getMiddle(_ head: ListNode?) -> ListNode? {

        var slow = head
        var fast = head?.next

        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }

        return slow
    }

    func merge(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var tail: ListNode? = dummy
        var l1 = l1
        var l2 = l2

        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                tail?.next = l1
                l1 = l1?.next
            } else {
                tail?.next = l2
                l2 = l2?.next
            }
            tail = tail?.next
        }

        tail?.next = l1 ?? l2
        return dummy.next
    }

    public func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let set1 = Set(nums1)
        let set2 = Set(nums2)
        var results: [Int] = []


//        for num in nums1 {
//            if set1.contains(num) && !results.contains(num) {
//                results.append(num)
//            }
//        }
        return Array(set1.intersection(set2))
    }
    
    public func intersection2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        // Sort both arrays
        let sortedNums1 = nums1.sorted()
        let sortedNums2 = nums2.sorted()

        var pointer1 = 0
        var pointer2 = 0
        var results: [Int] = []

        while pointer1 < sortedNums1.count && pointer2 < sortedNums2.count {
            let num1 = sortedNums1[pointer1]
            let num2 = sortedNums2[pointer2]
            if num1 == num2 {
                if results.isEmpty || results.last != num1 {
                    results.append(num1)
                }
                pointer1 += 1
                pointer1 += 1
            } else if num1 < num2 {
                pointer1 += 1
            } else {
                pointer2 += 1
            }
        }

        return results

    }

   public func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
       let sortedArray = people.sorted()

       var left = 0
       var right = sortedArray.count-1
       var boat = 0

       while left < right {


       }
       return 0
      }

    public func countSubstrings(_ s: String) -> Int {
        let arrStr = Array(s)
        var count = 0
        let n = arrStr.count

        func expandArroundCenter(_ left: Int, _ right: Int) {
            var l = left
            var r = right

            while l >= 0 && r < n && arrStr[l] == arrStr[r]{
                count += 1
                l -= 1
                r += 1
            }
        }

        for i in 0..<n {
            expandArroundCenter(i, i)
            if i+1 < n {
                expandArroundCenter(i, i+1)
            }
        }
        return count
//        for i in 0..<arrStr.count {
//            for j in i..<arrStr.count {
//                let substring = String(arrStr[i...j]) // Use range to create the substring
//                let reverString = String(substring.reversed())
//                if substring == reverString {
//                    count += 1
//                }
//
//            }
//        }
    }

    //MARK: 2. Add Two Numbers
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

        var l1 = l1
        var l2 = l2
        var carry = 0
        let dummy: ListNode = ListNode(0)
        var current: ListNode? = dummy

        while l1 != nil || l2 != nil || carry != 0 {
            var x = l1?.val ?? 0
            var y = l2?.val ?? 0
            let sum = carry + x + y
            carry = sum / 10
            current?.next = ListNode(sum%10)
            current = current?.next
            l1 = l1?.next
            l2 = l2?.next
        }

        return dummy.next
    }

    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {

        var dummy:ListNode?  = ListNode(0)

        dummy?.next = head
        var slow = dummy
        var fast = dummy

        for _ in 0..<n {
            fast = fast?.next
        }

        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next
        }


        slow?.next = slow?.next?.next

        return dummy?.next

    }

    public func oddEvenList(_ head: ListNode?) -> ListNode? {

        var odd = head
        var even = head?.next
        let evenHead = even

        while even != nil || even?.next != nil {
            print("value", even?.next?.val, even?.next?.next?.val)
            odd?.next = odd?.next?.next
            even?.next = even?.next?.next
            even = even?.next
            odd = odd?.next
        }
        
//        print("odd", odd?.next?.val, odd?.val, evenHead?.val, evenHead?.next?.val)
        odd?.next = evenHead
        return head
    }

    public func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {

        var dummyNode = ListNode(0)
        dummyNode.next = head
        var prev: ListNode? = dummyNode

        for i in 1..<left {
            prev = prev?.next
        }
        var start = prev?.next
        var tail = start?.next

        for i in 0..<(right - left) {

            start?.next = tail?.next
            tail?.next = prev?.next
            prev?.next = tail
            tail = start?.next

        }
        return dummyNode.next
       }

    public func swapNodes(head: ListNode?, pos1: Int, pos2: Int) {

        guard let head = head, pos1 != pos2 else { return } // Edge cases
        var node1: ListNode? = head
        var node2: ListNode? = head
        var index1 = 0
        var index2 = 0

        while index1 < pos1 && node1 != nil {
            node1 = node1?.next
            index1 += 1
        }

        // Traverse the list to find the node at pos2

        while index2 < pos2 && node2 != nil {
            node2 = node2?.next
            index2 += 1
        }

        if node1 == nil || node2 == nil {
            print("One or both positions are out of bounds.")
            return
        }
        // Swap the values of the two nodes

        let temp = node1?.val
        node1?.val = node2?.val ?? 0
        node2?.val = temp ?? 0
    }

   public func detectCycle1(_ head: ListNode?) -> ListNode? {
//        guard let head = head else { return nil }

        var slow: ListNode?  = head
        var fast: ListNode?  = head

        while fast != nil,fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next

            if slow === fast {
//                slow = head
//
//                while slow !== fast {
//                    slow = slow?.next
//                    fast = fast?.next
//                }
                return slow
            }
        }
        return nil
    }



    public func mergeTwoLists1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

        var l1 = l1
        var l2 = l2
        let dummy = ListNode(0)
        var current = dummy

        while let node1 = l1, let node2 = l2 {

            if node1.val < node1.val {
                current.next = node1
                l1 = node1.next
            } else {
                current.next = node2
                l2 = node2.next
            }
            current = current.next!
        }
        current.next = l1 ?? l2



        return dummy.next

    }

    public func sortList1(_ head: ListNode?) -> ListNode? {

        // Base case: if head is nil or there is only one node, return head
         if head == nil || head?.next == nil {
             return head
         }

        let midleNode = getMidle(head)
        let nextOfMiddle = midleNode?.next
        midleNode?.next = nil

        let left = sortList(head)
        let right = sortList(nextOfMiddle)

        return mergeTwoLists(left, right)
    }

    func getMidle(_ head: ListNode?) -> ListNode?  {

        if head == nil {
            return nil
        }

        var slow = head
        var fast = head?.next
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }

        return slow
    }

    public func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

        // Base cases: if one list is nil, return the other
           if l1 == nil {
               return l2
           }
           if l2 == nil {
               return l1
           }

           // Compare the values of the two lists and merge
           if let value1 = l1?.val, let value2 = l2?.val, value1 < value2 {
               l1?.next = mergeTwoLists(l1?.next, l2)
               return l1
           } else {
               l2?.next = mergeTwoLists(l1, l2?.next)
               return l2
           }
    }

//    func sortedListToBST(_ head: ListNode?) -> TreeNode<<#T: Comparable#>>? {
//        if head == nil {
//               return nil
//           }
//
//        let (middleNode, startNode) = findMiddle(head)
//        if middleNode == nil {
//            return nil
//        }
//        let root = TreeNode(value: middleNode!.val)
//
//        if middleNode !== startNode {
//            root.left = sortedListToBST(startNode)
//        }
//        root.right = sortedListToBST(middleNode?.next)
//        return root		
//    }

    func findMiddle(_ head: ListNode?) -> (ListNode?, ListNode?) {
        var slow = head
        var fast = head?.next
        var prev: ListNode? = nil
        while fast != nil && fast?.next != nil {
            prev = slow
            slow = slow?.next
            fast = fast?.next?.next
        }
        prev?.next = nil
        return (slow, head)
    }

   public func detectCycle2(_ head: ListNode?) -> ListNode? {
       var slow = head
       var fast = head
       while fast != nil {
           slow = slow?.next
           fast = fast?.next?.next
           if slow === fast {
               break
           }
       }
       if fast == nil || fast?.next == nil {
           return nil
       }


       while slow !== fast {
           slow = slow?.next
           fast = fast?.next
       }

       return slow
    }

    public func searchInsert(_ nums: [Int], _ target: Int) -> Int {

        var left = 0
        var right = nums.count - 1

        while left <= right {
            let mid = left+(right-left)/2
            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                left = mid+1
            } else {
                right = mid-1
            }
        }

        return left
    }

    public func search(_ nums: [Int], _ target: Int) -> Int {

        var left = 0
        var right = nums.count - 1

        while left < right {
            let mid = left+(right - left)/2
            if nums[mid] == target {
                return mid
            }
            if nums[left] <= nums[mid] {
                if nums[left] <= target  && target < nums[mid] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else if nums[mid] < target && target <= nums[right] {
                left = mid+1
            } else {
                right = mid-1
            }
        }
        return -1
     }

    //MARK: 2130. Maximum Twin Sum of a Linked List
    public func pairSum(_ head: ListNode?) -> Int {

        guard let head = head else { return 0}
        // Step 1: Use fast and slow pointers to reach the middle of the list
           var slow = head
           var fast: ListNode? = head
           while fast != nil && fast?.next != nil {
               slow = slow.next!
               fast = fast?.next?.next
           }
        print("slow node")
        // Step 2: Reverse the second half of the list
           var prev: ListNode? = nil
           var curr: ListNode? = slow
           while curr != nil {
               let nextNode = curr?.next
               curr?.next = prev
               prev = curr
               curr = nextNode
           }

        // Step 3: Calculate twin sums and find the maximum
          var maxSum = 0
          var first: ListNode? = head
          var second: ListNode? = prev

        while second != nil {
            maxSum = max(maxSum, (first?.val ?? 0) + (second?.val ?? 0))
            first = first?.next
            second = second?.next
        }
        
        return maxSum

    }

    public func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {

        guard let head = head else { return nil }
        if head.next == nil || k == 0 { return head }

        // Step 1: Find the length and link the last node to the head
           var length = 1
           var tail: ListNode? = head
           while tail?.next != nil {
               tail = tail?.next
               length += 1
           }
        tail?.next = head // Form a circular linked list
        let stepToNewHead = length - k % length


        // Step 2: Calculate the effective rotations needed
        let rotations = k % length
        if rotations == 0 {
            tail?.next = nil // Break the circular link
            return head
        }

//        print("list tail")
//        printList(tail)
//        print("head ")
        printList(head)
        var newTail = head
        for _ in 0..<stepToNewHead - 1 {
            newTail = (newTail.next)!
        }

        let newHead = newTail.next
                // Step 4: Break the circle
//        newTail.next = nil
        return newHead
    }

    public func mySqrt(_ x: Int) -> Int {

        let square = sqrt(Double(x))
        return Int(square)
    }

    public func search(_ nums: [Int], _ target: Int) -> Bool {
             var left = 0
            var right = nums.count - 1

            while left <= right {
                let mid = left+(right - left)/2

                if nums[mid] == target {
                    return true
                }
                if nums[left] == nums[mid], nums[mid] == nums[right] {
                    left += 1
                    right -= 1
                } else if nums[left] <= nums[mid] {
                    if nums[left] <= target  && target < nums[mid] {
                        right = mid - 1
                    } else {
                        left = mid + 1
                    }
                } else if nums[mid] < target && target <= nums[right] {
                    left = mid+1
                } else {
                    right = mid-1
                }
            }
            return false
        }

    public func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var pointerA = headA
        var pointerB = headB

        // Traverse until they either meet or reach the end (both become nil)
        while pointerA !== pointerB {
            pointerA = (pointerA == nil) ? headB : pointerA?.next
            pointerB = (pointerB == nil) ? headA : pointerB?.next
        }

        return pointerA
    }

    //MARK: 1019. Next Greater Node In Linked List
    public func nextLargerNodes(_ head: ListNode?) -> [Int] {
        var current = head
        var stack: [Int] = []
        var values = [Int]()

        while current != nil {
            values.append(current?.val ?? 0)
            current = current?.next
        }

        var results = Array(repeating: 0, count: values.count)

        for i  in 0..<values.count {

            for j in i + 1..<values.count {
                if values[j] > values[i] {
                    results[i] = values[j]
                    break
                }
            }

//            while let last = stack.last, values[i] > values[last] {
//
//                results[stack.removeLast()] = values[i]
//            }
//            stack.append(i)

        }

        return results
    }

    public  func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {


        

        let oneWayArray = matrix.flatMap {$0}.sorted()

        var left = 0
        var right = oneWayArray.count - 1

        while left < right {

            let mid = left + (right - left) / 2

            if oneWayArray[mid] == mid {

                return true
            } else if oneWayArray[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        for col in 0..<matrix.count {
            for row in 0..<matrix[col].count {
                if matrix[col][row] == target {
                    return true
                }
            }
        }

        return false
    }


    public func sortKMessedArray(arr: [Int], k: Int) -> [Int] {

        var result = arr.sorted()
//        var n = arr.count
        var low = 0
        var fast = result.count

        while low < fast {

            let mid = (low + fast) / 2

            if mid < k {
                low = mid + 1
            } else {
                fast = mid
            }
        }
        
        if !result.contains(k) {
            result.insert(k, at: low)
        }

        return result
    }
    
    //MARK: Min Heap 
    public func sortKMessedArray2(_ arr: [Int], _ k: Int) -> [Int] {
        var result: [Int] = []
        var minHeap = Array(arr.prefix(k+1))
        minHeap.sort()
        for i in k+1..<arr.count {

            result.append(minHeap.removeFirst()) // Add the smallest element from the heap
            minHeap.append(arr[i])
            minHeap.sort()

        }
        while !minHeap.isEmpty {
            result.append(minHeap.removeFirst())
        }

        return result
    }

    public func maxDepth(_ root: TreeNode<Int>?) -> Int {

        guard let root = root else { return 0}

        var queue: [TreeNode<Int>?] = [root]
        print("queue", queue.count)
        var level = 0
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let currentNode = queue.removeFirst()
                print("current node", currentNode ?? 0)

                if let left = currentNode?.left {
                    print("right", left)
                    queue.append(left)
                }

                if let right = currentNode?.right {
                    print("right", right)
                    queue.append(right)
                }

            }

            level += 1

        }

        return level

    }

    public func maxDepth2(_ root: TreeNode<Int>?) -> Int {

        guard let root = root else { return 0 }

        var level = 0
        var queue:[(Int, TreeNode<Int>)] = [(1, root)]

        while !queue.isEmpty  {

            let (lenght, currentNode) = queue.removeFirst()
            level = lenght

            if let left = currentNode.left {
                queue.append((lenght+1, left))
            }

            if let right = currentNode.right {
                queue.append((lenght+1, right))
            }

        }

        return level
    }

    public func areSentencesSimilar(_ sentence1: [String], _ sentence2: [String], _ similarPairs: [[String]]) -> Bool {

        for pair in similarPairs {

        }

        return true
    }

    //MARK: Tree

    func preorderTraversal(_ root: TreeNode<Int>?) -> [Int] {

        var results: [Int] = []

        func dfs(_ node: TreeNode<Int>?) {
            guard let node = node else { return }
            results.append(node.val)
            dfs(node.left)
            dfs(node.right)
        }
        dfs(root)

        return results
    }
    //MARK: 112. Path Sum
    public func hasPathSum(_ root: TreeNode<Int>?, _ targetSum: Int) -> Bool {

        func dfs(_ root: TreeNode<Int>?) -> Bool {
            var sum = 0
            guard let newNode = root else { return false}

            let newSum = sum + newNode.val

            if newNode.left == nil && newNode.right == nil {
                print(newNode.val)
                return newSum == targetSum
            }


            return dfs(newNode.left) || dfs(newNode.right)

        }

        return dfs(root)
    }

    public func pathSum(_ root: TreeNode<Int>?, _ targetSum: Int) -> [[Int]] {

        var results: [[Int]] = []
        var paths: [Int] = []
        func dfs(_ node: TreeNode<Int>?,
                 _ newSum: Int,
                 paths: inout [Int],
                 allPaths: inout [[Int]]) {

            guard let node = node else { return }
            paths.append(node.val)
            let sum = newSum + node.val

            if node.left == nil && node.right == nil {
                allPaths.append(paths)
            }

            dfs(node.left, newSum, paths: &paths, allPaths: &allPaths)
            dfs(node.right, newSum, paths: &paths, allPaths: &allPaths)


        }

        dfs(root, 0, paths: &paths, allPaths: &results)


        return results
    }
    //MARK: 46. Permutations
//Input: nums = [1,2,3]
//Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
    public func permute2(_ nums: [Int]) -> [[Int]] {

        var arr = nums
        var results: [[Int]] = []
        func dfs(_ level: Int)  {

            if level == arr.count {
                results.append(arr)
                return
            }

            for i in level..<arr.count {
                arr.swapAt(i, level)
                dfs(i+1)
                arr.swapAt(i, level)
            }
        }

        dfs(0)


        return results


    }

    public func permuteUnique2(_ nums: [Int]) -> [[Int]] {

        var sorted = nums.sorted()
        var results: [[Int]] = []
        var paths: [Int] = []
        var used = Array(repeating: false, count: sorted.count)
        func dfs() {

            if paths.count == sorted.count {
                results.append(sorted)
            }

            for i in 0..<sorted.count {

                if i > 0 && nums[i] == nums[i - 1] && !used[i] {
                    continue
                }
                if !used[i] {
                    used[i] = true
                    paths.append(sorted[i])
                    dfs()
                    paths.popLast()
                    used[i] = false

                }
            }
        }

        dfs()

        return results
    }


    public func permute3(_ nums: [Int]) -> [[Int]] {

        var results: [[Int]] = []
        var paths: [Int] = []

        var used = Array(repeating: false, count: nums.count)

        func backTracking() {
            if paths.count == nums.count {
                results.append(paths)
                return
            }

            for i in 0..<nums.count {
                if used[i] {
                    continue
                }

                paths.append(nums[i])
                used[i] = true
                backTracking()
                paths.popLast()
                used[i] = false
            }
        }

        backTracking()

        return results
    }

    public func lowestCommonAncestor(_ root: TreeNode<Int>?, _ p: TreeNode<Int>?, _ q: TreeNode<Int>?) -> TreeNode<Int>? {
        guard let root = root else { return nil }
        if root === p || root === q {
            return root
        }

        let left = lowestCommonAncestor(root.left, p, q)

        let right = lowestCommonAncestor(root.right, p, q)

        if left != nil && right != nil {
            return root
        }

        return left != nil ? left : right
      }

    private func lowestCommonAncestorBST(_ root: TreeNode<Int>?, _ p: TreeNode<Int>?, _ q: TreeNode<Int>?) -> TreeNode<Int>? {

        guard let pVal = p?.val, let qVal = q?.val else { return nil }

        var current = root
        var low = min(pVal, qVal)  // Find the lower value between p and q
        var high = max(pVal, qVal) // Find the higher value between p and q



        while let node = current {

            if node.val < low {
                current = current?.right
            } else if node.val > high {
                current = current?.left
            } else {
                return node
            }
        }

        return nil
    }

    public func subsets(_ nums: [Int]) -> [[Int]] {

        var results: [[Int]] = []
        var paths: [Int] = []

        func dfs(level: Int) {

            if paths.count == level {
                results.append(paths)
                return
            }

            paths.append(nums[level])
            dfs(level: level+1)
            paths.popLast()
            dfs(level: level+1)
        }
        dfs(level: 0)
        return results

    }

    public func subsets2(_ nums: [Int]) -> [[Int]] {

        var results: [[Int]] = []
        var paths: [Int] = []
        let sortedNums = nums.sorted()

        func dfs(level: Int) {
            results.append(paths)
            for i in level..<sortedNums.count {
                if i > 0 && sortedNums[i] == sortedNums[i-1] {
                    continue
                }
                paths.append(sortedNums[i])
                dfs(level: i+1)
                paths.popLast()

            }
        }
        dfs(level: 0)
        return results

    }

    public func levelOrder(_ root: TreeNode<Int>?) -> [[Int]] {

        var results: [[Int]] = []
        func backTracking(_ root: TreeNode<Int>?, level: Int) {
           guard let root = root else { return }
            if results.count == level {

            }
            results[level].append(root.val)
            backTracking(root.left, level: level + 1)
            backTracking(root.right, level: level + 1)

        }

        return results
    }


}


public func printList(_ head: ListNode?) {
    var current = head
    while current != nil {
        print(current?.val, terminator: " -> ")
        current = current?.next
    }
    print("nil")
}
