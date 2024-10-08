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

}
