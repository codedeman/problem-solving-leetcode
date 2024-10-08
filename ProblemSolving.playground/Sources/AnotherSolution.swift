import Foundation


public class AnotherSolution {

    public init() {}

    public func removeElement(_ nums: inout  [Int], _ val: Int) -> Int {
        var k = 0
        for i in 0..<nums.count {
            if nums[i] != val {
                nums[k] = nums[i]
                k += 1
            }
        }
        return k
    }

    
    public func bestTimeSell(_ prices: [Int]) -> Int {
        var minPrice = Int.max
        var maxProfit = 0
        for price in prices {

            if price < minPrice {
                minPrice = price
            }

            let profit = price - minPrice

            if profit > maxProfit {
                maxProfit = profit
            }
        }

        return maxProfit

    }


    public func generateParenthesis(_ n: Int) -> [String] {
        var stack: [String] = []
        func generate(_ prefix: String, openN: Int, closeN: Int) {
            if openN == 0 && closeN == 0 {
                stack.append(prefix)
                return
            }

            if openN > 0 {
                generate(prefix+"(", openN:openN-1 , closeN: closeN)
            }
            if closeN > openN {
                if prefix.last == "(" {
                    generate(prefix+")", openN:openN , closeN: closeN-1)
                }
            }
        }
        generate("", openN: n, closeN: n)
        return stack
    }

    public func nextGreaterElement2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dict: [Int: Int] = [:]
        var stack: [Int] = []
        for (key, value) in nums1.enumerated() {
            dict[value] = key
        }
        //        var jumps = [Int](repeating: Int.max, count: n)

        var result = [Int](repeating: -1, count: nums1.count)

        for num in nums2 {
            while stack.isEmpty && stack.last ?? 0 > num {
                let value = stack.removeLast()
                print("value ===>",value)
            }

            stack.append(num)
        }

        return stack

    }

    public func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        let charOrder = Dictionary(uniqueKeysWithValues: order.enumerated().map { ($0.1,$0.0)})

        for i in 0..<words.count-1 {

            let currentWorld = Array(words[i]), nextworld = Array(words[i+1])

            let minArray =  min(currentWorld.count,nextworld.count)
            var j = 0

            while j < minArray {
                guard currentWorld != nextworld else {
                    continue
                }
                let currentChar = currentWorld[j]
                let nextChar = nextworld[j+1]

                if charOrder[currentChar]! < charOrder[nextChar]! {
                    return false
                } else {
                    break
                }

            }

        }
        return true

    }


    public func calPoints(_ operations: [String]) -> Int {
        var sum = 0
        var stack: [Int] = []
        for operation in operations {
            switch operation {
            case "+":
                print("elements \(stack.count)")
                let numA = stack.last ?? 0
                let numB = stack[stack.count - 2]
                let result = numA + numB
                stack.append(result)
            case "D":
                let last = Int(stack.last!)
                let result = last*2
                stack.append(result)
            case "C":
                if !stack.isEmpty {
                    stack.removeLast()
                }
            default:
                if let value = Int(operation) {
                    stack.append(value)
                }
            }
        }

        for num in stack {
            print("num",num)
            sum += num
        }
        return sum

    }



    public func twoSum2(_ numbers: [Int], _ target: Int) -> [Int]
    {
        var hasMap: [Int: Int] = [:]
        for i in 0..<numbers.count {
            let num = numbers[i]
            let newIndex = target - num
            if let index = hasMap[newIndex] {
                return [i, newIndex]
            }

            hasMap[numbers[i]] = i
        }

        return []

    }

    func removeDuplicates(_ nums: inout [Int]) -> Int {

        if nums.count < 2 {
            return nums.count
        }
        var left = 0
        var right = 1

        while right < nums.count {
            if nums[left] != nums[right] {
                left += 1
                nums[left] = nums[right]
            }
            right += 1
        }

        return left + 1
   }



    //    public func lengthOfLongestSubstring(_ s: String) -> Int {
    //        let char = Array(s)
    //        var uniqueChars = Set<Character>()
    //        var maxLeght: Int = 0
    //        var increase = 0
    //        for index in s.indices {
    //            while uniqueChars.contains(s[index]) {
    //                uniqueChars.remove(s[s.index(s.startIndex, offsetBy: increase)])
    //                increase += 1
    //            }
    //            uniqueChars.insert(s[index])
    //            maxLeght = max(maxLeght,increase-index+1)
    //
    //        }
    //        return maxLeght
    //
    //    }

    //    func lengthOfLongestSubstring(_ s: String) -> Int {
    //            var charSet = Set<Character>()
    //            var i = 0
    //            var res = 0
    //
    //            for r in s.indices {
    //                while charSet.contains(s[r]) {
    //                    charSet.remove(s[s.index(s.startIndex, offsetBy: i)])
    //                    i += 1
    //                }
    //
    //                charSet.insert(s[r])
    //                res = max(res, r - i) + 1
    //            }
    //
    //            return res
    //        }

    public func lengthOfLongestSubstring(_ s: String) -> Int {
        var index = 0
        var res = 0
        _ = 0
        let chars = Array(s)
        var hashMap =  [Character: Int] ()
        var left = 0

        while index < chars.count {
            let char = chars[index]
            if let lastIndex = hashMap[char] {
                left = max(left, lastIndex+1)
            }
            hashMap[char] = index
            res = max(res, index - left+1)
            index += 1
        }

        return res
    }

    public func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count-1
        var closestSum = Int.max
        for i in 0..<nums.count-2 {
            while left < right {
                let sum = nums[i] + nums[left] + nums[right]
                if abs(target-sum) < abs(target-closestSum) {
                    closestSum = sum
                }
                if closestSum < target {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }



        return closestSum
    }

    // MARK: 283. Move Zeroes

    func moveZeroes(_ nums: inout [Int]) {
        var left = 0
        var right = 1
        if nums.count < 2 {
            return
        }
        while left < nums.count && right < nums.count {
            if nums[left] != 0 {
                left += 1
                right += 1
            } else if nums[right] == 0 {
                right += 1
            } else {
                let temp = nums[right]
                nums[right] = nums[left]
                nums[left] = temp
            }
        }

    }
    // MARK: 26. Remove Duplicates from Sorted

    public func removeDuplicates3(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else { return nums.count } // Handle empty or single-element arrays
        var left = 0
        var right = 1

        while right < nums.count {
            if nums[left] != nums[right] {
                left += 1
                nums[left] = nums[right]
            }
            right += 1
        }

        return left+1

    }

    //MARK: 80 two pointer

    public func removeDuplicates80(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else { return nums.count } // Handle empty or single-element arrays
        var left = 0
        var right = 1
        var counter = 0
//
        while right < nums.count {
            if nums[left] != nums[right] {
                left += 1
                nums[left] = nums[right]
                counter = 1
            } else if counter > 2 {
                left += 1
                nums[left] = nums[right]
                counter += 1
            }
            right += 1
        }

        return left+1

    }



    public func removeDuplicates2(_ nums: inout [Int]) -> Int {
        guard nums.count > 2 else { return nums.count }
        var allowDuplicateCount = 1
        var writeIndex = 2

        for readIndex in 2..<nums.count {
            if nums[readIndex] != nums[writeIndex - 2 ] {
                nums[writeIndex] = nums[readIndex]
                writeIndex += 1
            }

        }
        return  writeIndex
    }


    public func partitionLabels(_ s: String) -> [Int] {
        var s = Array(s)

        var lastOccur: [Character: Int] = [:]

        for (index, char) in s.enumerated()  {
            lastOccur[char] = index
        }


        var end = 0
        var results: [Int] = []
        var size = 0

        for (index, char) in s.enumerated() {
            size += 1
            end =  max(end, lastOccur[s[index], default: 0])

            if index == end {
                results.append(size)
                size = 0
            }

        }

        return results
    }

    //MARK: 75. Sort Colors

    public func sortColors(_  nums: inout [Int]) {
        var left = 0
        var right = nums.count-1
        var i = 0

        while i <= right {
            if nums[i] == 0 {
                nums.swapAt(left, i)
                left += 1
            } else if nums[i] == 2 {
                nums.swapAt(i, right)
                right -= 1
            } else {
                i += 1

            }
        }

    }

    public  func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var n = n
        let dummyNode = ListNode(0)
        dummyNode.next = head

        var fast: ListNode = dummyNode
        var slow: ListNode = head!

        while n > 0, fast != nil {
            fast = fast.next!
            n -= 1
        }

        while fast != nil {
            fast = fast.next!
            slow = slow.next!
        }
        slow.next = slow.next?.next

        return dummyNode.next
    }


    public func findWords(_ words: [String]) -> [String] {
        let rowMapping: [Character: Int] = [
            "q": 1, "w": 1, "e": 1, "r": 1, "t": 1, "y": 1, "u": 1, "i": 1, "o": 1, "p": 1,
            "a": 2, "s": 2, "d": 2, "f": 2, "g": 2, "h": 2, "j": 2, "k": 2, "l": 2,
            "z": 3, "x": 3, "c": 3, "v": 3, "b": 3, "n": 3, "m": 3
        ]

        var result: [String] = []

        for word in words {

            let lowerWorld = word.lowercased()
            let row = rowMapping[lowerWorld.first!]
            if lowerWorld.allSatisfy({ rowMapping[$0] == row}) {
                result.append(word)
            }

        }
        return result
    }

    public func detectCapitalUse(_ word: String) -> Bool {

        if word.uppercased() == word || word.lowercased() == word {
            return true
        } else if word.first!.isUppercase && word.dropFirst().allSatisfy({ $0.isLowercase }) {
            return true
        } else {
            return false
        }

    }

    public func deleteDuplicates(_ head: ListNode?) -> ListNode? {

        let dummy = ListNode(0)
        dummy.next = head

        var current = dummy

        while current.next != nil && current.next?.next != nil {
            if current.next?.val == current.next?.next?.val {
                let duplicateValue = current.next!.val
                while current.next != nil && current.next!.val == duplicateValue {
                    // Update current inside the inner loop
                    current.next = current.next?.next
                }
            }
        }
        return dummy.next
    }

    public func strStr(
        _ haystack: String,
        _ needle: String
    ) -> Int {

        if needle.count > haystack.count {
            return -1
        }

        if  let rage = haystack.range(of: needle)  {

            let distance = haystack.distance(
                from: haystack.startIndex,
                to: rage.lowerBound
            )
            return distance

        } else {
            return -1
        }



    }

//
//    public func minDepth(_ root: TreeNode<Int>?) -> Int {
//        guard let root = root else {
//            return 0
//        }
//        var queue: [(TreeNode, Int)] = [(root, 1)]
//
//        while !queue.isEmpty {
//            let (node, depth) = queue.removeFirst()
//
//            // Check if this is a leaf node
//            if node.left == nil && node.right == nil {
//                return depth
//            }
//
//            // Enqueue left child
//            if let left = node.left {
//                queue.append((left, depth + 1))
//            }
//
//            // Enqueue right child
//            if let right = node.right {
//                queue.append((right, depth + 1))
//            }
//        }
//        return 0
//
//
//    }
    // BFS

    public func maxDepth(_ root: TreeNode<Int>?) -> Int {
        guard let root = root else { return 0}
        var queue: [(TreeNode, Int)] = [(root, 1)]
        var maxDepth = 0

        while !queue.isEmpty {
            let (node, depth) = queue.removeFirst()
            maxDepth = max(maxDepth, depth)

            if let left = node.left {
                queue.append((left, depth + 1))
            }
            if let right = node.right {
                queue.append((right, depth + 1))
            }
        }

        return maxDepth

    }


    func moveZeroes2(_ nums: inout [Int]) {
        for i in 0..<nums.count {
            if nums[i] == 0 {
                for j in (i+1)..<nums.count{
                    if nums[j] != 0 {
                        nums.swapAt(i, j)
                    }
                }
            }
        }
    }

    //   [2,4,3,1] [3,1,2,4]
    /*
     for i in 0..<nums.count-1 {
     if nums[i] == 0 {
     for j in (i+1)..<nums.count {
     if nums[j] != 0 {
     nums.swapAt(i, j)
     break
     }
     }
     }
     }
     */
    public func sortArrayByParity(_ nums: [Int]) -> [Int] {

        var nums2 = nums

        var right = nums2.count-1
        var left = 0

        while left < right {

            if nums2[left] % 2 > nums2[right] % 2 {
                nums2.swapAt(left, right)
            }

            if nums2[left]%2 == 0 {
                left += 1
            }

            if nums2[right]%2 == 1 {
                print("right \(right)")
                right -= 1
            }

        }
        return nums2

    }



    /*
     Step 1 sort house and heaters array
     Step 2 Finding the position to insert the current house in sorted heaters
     Step 3 Caculate distance to the closest heaters on the left and right
     Step 4: Find the minimum distance for the current house
     Step 5: Track the maximum of these minimum distances
     */
    public func findRadius(_ houses: [Int], _ heaters: [Int]) -> Int {

        let houses = houses.sorted()
        let heaters = heaters.sorted()
        var maxRadius = 0
        //    Houses: [1, 2, 3, 4]
        //    Heaters: [1, 4]
        for house in houses {
            let pos = binarySearch(
                array: heaters,
                target: house
            )
            //            1 < 2
            if let pos = pos {
                // Step 3: Calculate distances to the closest heaters on the left and right
                let leftDistance: Int
                if pos > 0 {
                    leftDistance = abs(house - heaters[pos - 1])
                } else {
                    leftDistance = Int.max
                }

                let rightDistance: Int
                if pos < heaters.count {
                    rightDistance = abs(house - heaters[pos])
                } else {
                    rightDistance = Int.max
                }
                let minDistance = min(leftDistance, rightDistance)
                maxRadius = max(maxRadius, minDistance)

            }

        }


        return maxRadius
    }

    public func binarySearch(
        array: [Int],
        target: Int
    ) -> Int? {

        var lowerBound = 0
        var upperBound = array.count - 1

        while lowerBound <= upperBound {
            let mid = (lowerBound + upperBound) / 2
            let midValue = array[mid]
            if midValue < target {
                lowerBound = mid+1
            } else {
                upperBound = mid
            }

        }

        return lowerBound
    }

    public func islandPerimeter(_ grid: [[Int]]) -> Int {
        var result = 0
        for r in 0..<grid.count {
            print("row ==> \(r)")
            for col in 0..<grid[r].count {
                if col >= 0 && r < grid[r].count {
                    if grid[r][col] == 1 {
                        result += 4
                        if r > 0 && grid[r-1][col] == 1 {
                            result -= 2
                        }

                        if col > 0 && grid[r][col-1] == 1 {
                            result -= 2
                        }
                    }
                }
            }

        }
        return result

    }

    public func findRadius2(_ houses: [Int], _ heaters: [Int]) -> Int {
        var distances: [Int] = []
        for house in houses {
            var minNum = Double.infinity
            for heater in heaters {
                minNum = min(minNum, Double(abs(heater-house)))
            }

            distances.append(Int(minNum))
        }

        var radius = distances[0]
        for distance in distances {

            if distance < radius {
                radius = distance
            }
        }

        return radius
    }

    //    public func islandPerimeter(_ grid: [[Int]]) -> Int {
    //        var result = 0
    //        for r in 0..<grid.count  {
    //            print("row",r)
    //            for col in 0..<grid[r].count {
    //                if grid[r][col] == 1 {
    //                    result += 4
    //                    print("Fuck ", grid[1][1])
    //                    if r > 0 && grid[r-1][col] == 1{
    //                        result -= 2
    //                    }
    //                    if col > 0 && grid[r][col-1] == 1 {
    //                        result -= 2
    //                    }
    //                }
    //
    //            }
    //        }
    //
    //        return result
    //    }

    func islandPerimeter2(_ grid: [[Int]]) -> Int {
        var count = 0
        for row in 0..<grid.count {
            for col in 0..<grid[row].count {

                if grid[row][col] == 1 {
                    count += 4
                } else if grid[row][col] == 0 {
                    count -= 2
                }

            }
        }
        return 0
    }

    public func summaryRanges(_ nums: [Int]) -> [String] {

        var results: [String] = []

        if nums.isEmpty {
            return results
        }

        var start =  nums.first!
        var end = nums.first!
        for i in 1..<nums.count {
            if nums[i] == end+1 {
                end = nums[i]
            } else {

                if start == end {
                    results.append("\(start)")
                } else {
                    results.append("\(start)->\(end)")
                }

                start = nums[i]
                end = nums[i]
            }

        }
        if start == end {
            results.append("\(start)")
        } else {
            results.append("\(start)->\(end)")

        }
        return results
    }

    public func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var index = 0
        var flowerbed = flowerbed
        var n = n  // Copy the number of flowers to place

        while index < flowerbed.count {
            if flowerbed[index] == 0 {
                let prevEmpty = (index == 0) || (flowerbed[index - 1] == 0)
                let nextEmpty = (index == flowerbed.count - 1) || (flowerbed[index + 1] == 0)

                if prevEmpty && nextEmpty {
                    flowerbed[index] = 1
                    n -= 1
                    if n == 0 {
                        return true
                    }
                }
            }
            index += 1
        }

        return n == 0
    }

    //MARK: 45. Jump Game II
    /*
     Step 1: Initialize jumps, current_end, and farthest to 0.
     Step 2: Iterate through the array:
     Step 3: Update farthest with the maximum reachable index.
     If current_end equals the current index, increment jumps and update current_end.
     Step 4: Return the total number of jumps.

     */

    public func jump(_ nums: [Int]) -> Int {

        var jumps = 0
        var current_end = 0
        var farthest = 0

        for i in 0..<nums.count-1 {
            print("num => \(nums[i])")
            farthest = max(farthest, i+nums[i])
            if current_end == i {
                jumps += 1
                current_end = farthest
            }
        }
        return jumps
    }

    //MARK: 219. Contains Duplicate II
    /*
     Step 1: Initialize the hash map (dictionary) to store the value and its index
     Step 2: Interate through array check element whether exist into hashmap or not
     Check if the element exists in the dictionary
     Check if the difference between indices is less than or equal to k
     return true

     */

    public func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var hashMap: [Int: Int] = [:]

        for (index, value) in nums.enumerated() {
            if let previousIndex = hashMap[index], index - previousIndex <= k {
                return true
            }
            hashMap[value] = index
            return false

        }

        return false

    }

    func threeSumClosest2(_ nums: [Int], _ target: Int) -> Int {
        let sortedNums = nums.sorted()
        var closestSum = sortedNums[0] + sortedNums[1] + sortedNums[2]

        for i in 0..<sortedNums.count {
            var left = i+1
            var right = sortedNums.count-1
            while left < right {
                let currentSum = sortedNums[i] + sortedNums[left] + sortedNums[right]
                if abs(currentSum - target) < abs(closestSum - target) {
                    closestSum = currentSum
                }
                
                if currentSum < target {
                    left += 1
                } else if currentSum > target {
                    right -= 1
                } else {
                    return currentSum
                }

            }
        }
        return closestSum
    }

    public func sockMerchant(n: Int, ar: [Int]) -> Int {
        // Write your code here
        var count = 0
        var unMatchSocks: Set<Int> = []


        for stock in ar {
            if unMatchSocks.contains(stock) {
                count += 1
                unMatchSocks.remove(stock)
            } else {
                unMatchSocks.insert(stock)
            }


        }


        return count
    }

    public func fizzBuzz(_ n: Int) -> [String] {
        var arr: [String] = []
        for i in 1...n {
            if i%3 == 0 && i%5 == 0 {
                arr.append("FizzBuzz")
            } else if i%3 == 0 {
                arr.append("Fizz")
            } else if i%5 == 0 {
                arr.append("Buzz")

            } else {
                arr.append("\(i)")
            }
        }
        return arr
    }
    //MARK: TODO

    public func firstUniqChar(_ s: String) -> Int {

        let arr = Array(s)
        var hashMap: [Character: Int] = [:]

        for str in arr {
            hashMap[str, default: 0] += 1
        }

        for (index, char) in s.enumerated() {
            if let count = hashMap[char], count == 1 {
                return index
            }
        }

        return 0

    }

    func findCounter(A: String, X: Int, Y: Int)->Int {
        //this is default OUTPUT. You can change it.
        var result = -404
        //write your Logic here:

        let startIndex = A.index(A.startIndex,offsetBy: X)
        let endIndex = A.index(A.startIndex, offsetBy: Y)
        let subString = A[startIndex...endIndex]

        result = subString.reduce(0) { sum, char in
            if let asciiValue = char.asciiValue {
                let position = Int(asciiValue - (Character("a").asciiValue!) + 1) ?? 0
                return sum + position
            }
            return sum
        }


        return result
    }

    public func titleToNumber(_ columnTitle: String) -> Int {
        var result = 0

        for char in columnTitle {
            let value = Int(char.unicodeScalars.first?.value ?? 0) - Int(UnicodeScalar("A").value) + 1
            result = result*26+value
        }

        return result
    }

    //MARK: 13. Roman to Integer
    /*

     */

    public func romanToInt(_ s: String) -> Int {
        let romanDict: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]

        var result = 0
        var prev = 0
        for char in s {
            if let currentValue = romanDict[char] {
                if currentValue > prev {
                    result += currentValue - 2*prev
                } else {
                    result += currentValue
                }

                prev = currentValue
            }
        }
        return  result
    }
    //MARK: 821. Shortest Distance to a Character
    public func shortestToChar(_ s: String, _ c: Character) -> [Int] {
        var dist = [Int](repeating: Int.max, count: s.count)
        var prev = Int.min

        for (index, char) in s.enumerated() {
            if char == c {
                prev = index
            }
            if prev != Int.min {
                dist[index] = index - prev
            }
       }
        prev = Int.max

        for (index, char) in s.enumerated().reversed() {
            if char == c {
                prev = index
            }

            if prev != Int.max {
                dist[index] = min(dist[index], prev - index)
            }

        }
        return dist
    }
    //MARK: TODO 
    public func multiply(_ num1: String, _ num2: String) -> String {
        guard let num1 = Double(num1), let num2 = Double(num2) else { return "" }
        let num = num1 * num2
        let numberString = String(format: "%.0f", num)

        return numberString
    }

    public func isAnagram(_ s: String, _ t: String) -> Bool {

        if s.count != t.count {
            return false
        }

        var hasMap: [Character: Int] = [:]
        for char in s {
            hasMap[char, default: 0] += 1
        }
        for char in t {
            if let count = hasMap[char] {
                if count == 0 {
                    return false
                } else {
                    hasMap[char] = count-1
                }
            } else {
                return false
            }
        }


        return true
    }


    public func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {

//        let reverString1 = ransomNote.reversed()
//        let rev
        if magazine.contains(ransomNote.reversed()) {
            return true
        } else {
            return false
        }
    }

    public func threeConsecutiveOdds(_ arr: [Int]) -> Bool {

        if arr.count < 3 {
            return false
        }


        for (index,value) in arr.enumerated() {

            if index <= arr.count - 3 { // Ensure index + 2 is within bounds
                if value % 2 != 0 && arr[index + 1] % 2 != 0 && arr[index + 2] % 2 != 0 {
                    return true
                }
            }

        }

        return false
     }

    public func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var resuls: [Int] = []
        var hasMap: [Int: Int] = [:]

        for num in nums1 {
            hasMap[num, default: 0] += 1
        }

        for num in nums2 {
            if let count = hasMap[num], count > 0 {
                resuls.append(num)
                hasMap[num]! = count-1
            }
        }

        return resuls

    }

    public func minDifference(_ nums: [Int]) -> Int {
        if nums.count <= 4 {
            return 0
        }
        let numsSorted = nums.sorted()

        let n = numsSorted.count
        let diff1 = numsSorted[n - 1] - numsSorted[3]
        let diff2  = numsSorted[n - 2] - numsSorted[2]
        let diff3  = numsSorted[n - 3] - numsSorted[1]
        let diff4  = numsSorted[n - 4] - numsSorted[0]
        return min(diff1, diff2, diff3, diff4)

    }

//MARK: 3. Longest Substring Without Repeating Characters
    /*
     Step1 convert string to array, using sliding window techique to solve this problem
        create set to store character
     Step2 check if element persist wheter inside of set or not
        if not we need to insert and compute max leght then increase right
        if element has already exist we need to remove from set then increase left

     */
   public func lengthOfLongestSubstring1(_ s: String) -> Int {

       let newArray = Array(s)
       var maxLeght = 0
       var hashMap = Set<Character>()
       var right = 0
       var left = 0

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
    //MARK: 209. Minimum Size Subarray Sum
    /*
     using sliding window techique
     Expand the window adding the element at the right pointer to current sum
     Shrink the Window
     */
    public func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var left = 0
        var right = 0
        var minDistance = Int.max
        var currentSum: Int = 0

        while right < nums.count {
            // Expand the window adding the element at the right pointer to current sum
            currentSum += nums[right]
            right += 1
            // Shrink the Window:
            while currentSum >= target {
                minDistance = min(minDistance, right - left)
                currentSum -= nums[left]
                left += 1
            }
        }
        return minDistance == Int.max ? -1 : minDistance
    }

    //MARK: 2461. Maximum Sum of Distinct Subarrays With Length K
    /*
        Using sliding window technique we need to create a set variable to check wheter value duplicate or not
        we need to shink window by check the side window equal k and comute maximum sum then remove element from set variable
     */
    public func maximumSubarraySum(_ nums: [Int], _ k: Int) -> Int {
        var left = 0
        var right = 0
        var sum = 0
        var maximum = 0
        var windowSet = Set<Int>()
        while right < nums.count {
            // Check if the current element is already in the set

            while windowSet.contains(nums[right]) {
                // Remove the element at the left pointer from the set and the sum
                windowSet.remove(nums[left])
                sum -= nums[left]
                left += 1
            }
            // Add the current element to the set and the sum

            windowSet.insert(nums[right])
            sum += nums[right]
            // If the window size is exactly k, update the maximum sum

            if right - left + 1 == k {
                print("index \(left) \(right) \(nums[left]) \(nums[right])")
                maximum = max(maximum, sum)
                windowSet.remove(nums[left])
                sum -= nums[left]
                left += 1
            }

            right += 1
        }
        return maximum
    }

    //MARK: Sliding window

    /*
        create hash map check how many time element occur
        if element occur two time into hasmap we need to shink the window
     */

    public func lengthOfLongestSubstringTwoDistinct(_ s: String) -> Int {

        var left = 0
        var right = 0
        let chars = Array(s)
        var charCount = [Character: Int] ()
        var maxLeght = 0
        while right < chars.count {
            let rightChar = chars[right]
            charCount[rightChar, default: 0] += 1

            while charCount.keys.count > 2 {
                let leftChar = chars[left]
                charCount[leftChar]! -= 1
                if charCount[leftChar]! == 0 {
                    charCount.removeValue(forKey: leftChar)
                }
                left += 1
            }
            maxLeght = max(maxLeght, right-left+1)
            right += 1

        }

        return maxLeght

    }

    //MARK: 485. Max Consecutive Ones
    public func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {

        var maxCount = 0
        var currentCount = 0
        var currentNum = nums[0]
        for i in 0..<nums.count {
            if nums[i] == 1 {
                currentCount += 1
                maxCount = max(maxCount, currentCount)
            } else {
                currentCount = 0
            }

        }

        return maxCount
    }

    public func findMaxConsecutiveOnes2(_ nums: [Int]) -> Int {

        var maxCount = 0
        var currentCount = 0
        var currentNum = nums[0]

        var left = 0
        var right = 0
//        [1, 0, 1, 1, 0, 1]
        while right < nums.count {

            if nums[right] == 0 {
                currentCount += 1
            }
            print("curent count", currentCount)

            while currentCount > 1 {
                if nums[left] == 0 {
                   currentCount -= 1
                }
                left += 1
            }
            print("right left", right, left)
            maxCount = max(maxCount, right - left + 1) //4
            right += 1
        }

        return maxCount
    }

    public func longestOnes(_ nums: [Int], _ k: Int) -> Int {

        var left = 0
        var right = 0
        var count = 0
        var maxCount = 0
        while right < nums.count {

            if nums[right] == 0 {
                count += 1
            }

            while count > k {
                if nums[left] == 0 {
                    count -= 1
                }
                left += 1
            }
            print("left ", left)
            maxCount = max(maxCount, right - left + 1) //4
            right += 1

        }
        return maxCount
    }

    /*
     using slide window techinique
     Step1: expand window and store element occurs
     then compute maximum frequency in array

     Step2: Shink the window by using condition right - left + 1 - maximum frequency > k

     Fianlly: we need compute maximum max count
     */
    //MARK: Leetcode 424. Longest Repeating Character Replacement

    public func characterReplacement(_ s: String, _ k: Int) -> Int {
        //  AAAA
        // ABAB // 2
//        "AAABACDEFGBBB" // 3
            var left = 0
            var right = 0
            let newArray = Array(s)
            var maxCount = 0
            var hashMap: [Character: Int] = [:]
            var maxFreq: Int = 0
            while right < newArray.count {

                let char = newArray[right]
                hashMap[char, default: 0] += 1
                maxFreq = max(maxFreq, hashMap[char]!)
                print("maxFeg",left,right,maxFreq)
                while (right - left + 1) - maxFreq > k {
                    hashMap[newArray[left]]! -= 1
                    left += 1
                }
                maxCount = max(maxCount, right - left + 1)
                right += 1
            }

            return maxCount
        }

     //MARK: 53. Maximum Subarray
    public func maxSubArray(_ nums: [Int]) -> Int {

        var maxSum = nums.first!
        var maxCurrent = 0

        for i in 0..<nums.count {
            maxCurrent = max(nums[i], maxCurrent+nums[i])

            if maxCurrent > maxSum {
                maxSum = maxCurrent
            }
        }

        return maxSum
    }
    //MARK: 978. Longest Turbulent Subarray Todo
    public func maxTurbulenceSize(_ arr: [Int]) -> Int {

        guard arr.count > 1 else { return arr.count }
        var start = 0
        var end = 0
        var maxLen = 1

        for end in 1..<arr.count {
            let comparision = compare(arr[end], arr[end-1])
            if comparision == 0 {
                start = end
            } else if end == arr.count-1 || comparision * compare(arr[end+1], arr[end]) != -1 {
                maxLen = max(maxLen, end-start+1)
                start = end
            }
        }

        return maxLen
    }

    private func compare(_ a: Int, _ b: Int) -> Int {
        if a == b {
            return 0
        } else if a > b {
            return 1
        } else {
            return -1
        }
    }

    public func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {

        var right = 0
        var oldCount = 0
        var result = 0
        var prefixSums = [Int: Int]()
        prefixSums[0] = 1

        while right < nums.count {
            if nums[right]%2 != 0 {
                oldCount += 1
            }

            if oldCount >= k {
                result += prefixSums[oldCount-k, default: 0]
            }
            prefixSums[oldCount, default: 0] += 1

            right += 1

        }
        return result
    }

    public func canJump(_ nums: [Int]) -> Bool {

        var target = nums.last!
        for (index, value) in nums.enumerated().reversed() {
            if index + value >= target {
                 target = index
            }

        }

        return target == 0
    }

    public func canReach(_ arr: [Int], _ start: Int) -> Bool {
        
        let value = arr[start]

        if value == 0 {
            return false
        }

        for i in 0..<arr.count {
            if ((i + arr[i]) != 0) || ((i - arr[i]) != 0) {
                
            }

        }
        return false
    }

    

    public func deleteDuplicateNode(node: ListNode?) -> ListNode?  {
        var currentNode = node
        var hashMap: [Int: Int] = [:]

        while currentNode != nil {
            hashMap[currentNode?.val ?? 0, default: 0] += 1
            currentNode = currentNode?.next
        }
        let dummyNode: ListNode? = ListNode(0)
        dummyNode?.next = node
        currentNode = dummyNode

        while currentNode?.next != nil {
            if let count = hashMap[currentNode?.next?.val ?? 0], count > 1 {
                currentNode?.next = currentNode?.next?.next
            } else {
                currentNode = currentNode?.next
            }
        }

        return dummyNode?.next
    }

    public func isPalindrome(_ head: ListNode?) -> Bool {
        
        var current = head
        var stack: [Int] = []
        while current != nil {
            stack.append(current?.val ?? 0)
            current = current?.next
        }
        current = head
        while current != nil  {
//            print("hhhh",stack.count)
            if  let value = stack.popLast(), current?.val != value{
                return false
            }
            current = current?.next
        }
        return true
    }
   //MARK: 674. Longest Continuous Increasing Subsequence
    /*

     */
    public func findLengthOfLCIS(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        let nums = nums
        var count = 1
        var maxLeght = 1
        for i in 1..<nums.count {
            if nums[i] > nums[i-1] {
                count += 1
                maxLeght = max(maxLeght, count)
            } else {
                count = 1
            }
        }

        return maxLeght
    }

    //MARK: 1721. Swapping Nodes in a Linked List
    /*
     Step1 find leght of node
     Step2
     */

    public func swapNodes(_ head: ListNode?, _ k: Int) -> ListNode? {
        var dummy = ListNode(0)
        dummy.next = head

        var leght = 0 
        var current: ListNode? = head

        while current != nil {
            leght += 1
            current = current?.next
        }

        if k > leght {
            return head
        }

        // Step 2: Find the kth node from the beginning and the end
          var firstNode: ListNode? = head
          var secondNode: ListNode? = head
          var firstNodePrev: ListNode? = nil
          var secondNodePrev: ListNode? = nil

        for _ in 1..<k {
            firstNodePrev = firstNode
            firstNode = firstNode?.next
        }

        for _ in 1..<(leght-k+1) {
            secondNodePrev = secondNode
            secondNode = secondNode?.next
        }

        if firstNode === secondNode {
            return head
        }

        if firstNode == nil {

            firstNodePrev?.next = secondNode
            secondNodePrev?.next = firstNode
            let temp = firstNode?.next
            firstNode?.next = secondNode?.next
            secondNode?.next = temp
        } else {

//            firstNodePrev?.next = secondNode
//            secondNodePrev?.next = firstNode
            let temp = firstNode?.next
            firstNode?.next = secondNode?.next
            secondNode?.next = temp
            firstNodePrev?.next = secondNode

        }



        return dummy.next


    }

    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        
        var current = head

        let dummy = ListNode(0)
        dummy.next = head
        current = dummy
        while current != nil && current?.next != nil {
            if current?.next?.val == val {
                current = current?.next?.next
            } else {
                current = current?.next
            }
        }

        return dummy.next
    }

    func removeNthFromEndN(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var fast: ListNode? = dummy
        var slow: ListNode? = dummy

        for _ in 0..<n {
            fast = fast?.next
        }

        while fast?.next != nil {
            fast = fast?.next
            slow = slow?.next
        }

        slow?.next = slow?.next?.next

        return dummy.next
    }
    //MARK: 876. Middle of the Linked List
    /*
     using two pointer start at the same point
     iterate through the linked list 
     */
    public func middleNode(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }

        return slow?.next
    }


    public func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {

        if list1 == nil {
            return list2
        }
        if list2 == nil {
            return list1
        }


        if let node1 = list1, let node2 = list2 {
            if node1.val <= node1.val {
                node1.next = mergeTwoLists(node1.next, node2)
                return node1
            } else {
                node2.next = mergeTwoLists(node1, node2.next)
                return node2
            }
        }

        return nil

    }

    public func reorderList(_ head: ListNode?) {

        guard head != nil && head?.next != nil else { return }

        // find midle of node
        var fast: ListNode?  = head
        var slow: ListNode? = head

        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }

        // reverse second half

        var curr = slow
        var prev: ListNode? = nil

        while curr != nil {
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }

        // Step 3: Merge the two halves
        var first = head
        var second = prev
        while second?.next != nil {

            let temp1 = first?.next
            let temp2 = second?.next

            first?.next = second
            second?.next = temp1


            first = temp1
            second = temp2

        }
    }
    //MARK: 328. Odd Even Linked List
    
    public func oddEvenList(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return nil}

        var odd = head
        var even = head?.next
        let evenHead = even

        while even != nil && even?.next != nil {
            odd?.next = odd?.next?.next
            even?.next = even?.next?.next
            odd = odd?.next
            even = even?.next
        }
        odd?.next = evenHead
        return head
      }

    public func deleteMiddle(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return nil
        }
        var slow = head
        var fast = head
        var prev: ListNode? = nil

        while fast != nil && fast?.next != nil {
            prev = slow
            slow = slow?.next
            fast = fast?.next?.next
        }
        prev?.next = slow?.next

        return head
    }

    public func sortList(_ head: ListNode?) -> ListNode? {
        // Base case: If the list is empty or has only one node, it's already sorted
        if head == nil || head?.next == nil {
            return head
        }

        // Step 1: Split the list into two halves
        let (left, right) = split(head)

        // Step 2: Recursively sort both halves
        let sortedLeft = sortList(left)
        let sortedRight = sortList(right)

        // Step 3: Merge the sorted halves
        return merge(sortedLeft, list2: sortedRight)
    }

    // Function to split the list into two halves
    private func split(_ head: ListNode?) -> (ListNode?, ListNode?) {
        var slow = head
        var fast = head
        var prev: ListNode? = nil

        // Move fast pointer two steps and slow pointer one step
        while fast != nil && fast?.next != nil {
            prev = slow
            slow = slow?.next
            fast = fast?.next?.next
        }

        // Split the list into two halves
        prev?.next = nil
        return (head, slow)
    }

    // Recursive merge function
    private func merge(_ list1: ListNode?, list2: ListNode?) -> ListNode? {
        if list1 == nil {
            return list2
        }
        if list2 == nil {
            return list1
        }

        if list1!.val < list2!.val {
            list1!.next = merge(list1!.next, list2: list2)
            return list1
        } else {
            list2!.next = merge(list1, list2: list2!.next)
            return list2
        }
    }

    public func swapPairs(_ head: ListNode?) -> ListNode? {

        let dummy = ListNode(0)
        dummy.next = head
        var current: ListNode? = dummy

        while current != nil && current?.next != nil {

            let first = current?.next
            let second = current?.next?.next

            // swaping
            first?.next = second?.next
            second?.next = first
            current?.next = second

            current = first

        }

        return dummy.next

    }

    public func singleNonDuplicate(arr: [Int]) -> Int {

        var hashMap: [Int: Int] = [:]

        for num in arr {
            hashMap[num, default: 0] += 1
        }
        var result = 0
        for num in arr {
            if let count = hashMap[num], count == 1 {
                result = num
            }
        }

        return result
    }


    public func insertSorted(head: DoublyLinkedListNode?, data: Int) -> DoublyLinkedListNode? {
            let newNode = DoublyLinkedListNode(data: data)

        // Case 1: Insert at the beginning or into an empty list
           if head == nil {
               return newNode
           }

        if data <= head?.data ?? 0 {
            newNode.next = head
            head?.prev = newNode
            return newNode
        }

        var current = head
        while current?.next != nil && current!.next?.data ?? 0 < data {
            current = current?.next
        }

        // Insert newNode after current
        newNode.next = current!.next
        newNode.prev = current
        if current!.next != nil {
            current!.next!.prev = newNode
        }
        current!.next = newNode

        return head
    }
    //MARK: 2. Add Two Numbers
    public func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var current = dummy
        var carry = 0
        var p = l1
        var q = l2

        while p != nil || q != nil {

            let x = p?.val ?? 0
            let y = q?.val ?? 0

            // Calculate the sum of the values and the carry
            let sum = carry + x + y
            // Update the carry for the next iteration

            carry = sum / 10

            current.next = ListNode(sum % 10)
            current = current.next!

            if p != nil { p = p?.next }
            if q != nil {q = q?.next }
        }

        if carry > 0 {
            current.next = ListNode(carry)
        }
        return dummy.next
    }
    //MARK: TODO Two Pointers.  5. Longest Palindromic Substring 
    public func longestPalindrome(_ s: String) -> String {
        var arrStr = Array(s)
        var start = 0
        var end = 0

        for i in 0..<arrStr.count {

            var len1 = expandArroundCenter(s: s, left: i, right: i)
            var len2 = expandArroundCenter(s: s, left: i, right: i+1)
            let maxLeght = max(len1, len2)
            if maxLeght > (end - start) {
                start = i - (maxLeght - 1) / 2
                end = i + maxLeght / 2
            }

        }


        // Return the longest palindromic substring
        let startIdx = s.index(s.startIndex, offsetBy: start)
        let endIdx = s.index(s.startIndex, offsetBy: end + 1)
        return String(s[startIdx..<endIdx])
    }


    private func expandArroundCenter(
        s: String,
        left: Int,
        right: Int
    ) -> Int {
        var arrS = Array(s)
        var l = left
        var r = right
        while left >= 0 && r < s.count && arrS[l] == arrS[r] {
            l -= 1
            r += 1
        }

        return r - l - 1

    }

    public func strStr1(_ haystack: String, _ needle: String) -> Int {
        // If needle is empty, return 0 (as per problem definition)
           if needle.isEmpty {
               return 0
           }

           // If haystack is empty or needle is longer than haystack, return -1
           if haystack.isEmpty || needle.count > haystack.count {
               return -1
           }


         // Convert strings to arrays of characters for easier access
         let haystackChars = Array(haystack)
         let needleChars = Array(needle)

         let haystackLength = haystackChars.count
         let needleLength = needleChars.count

        for i in 0...(haystackLength - needleLength) { // we only iterate elemens nessary
            var found = true

            // Check each character in the substring
            for j in 0..<needleLength {
                if haystackChars[i + j] != needleChars[j] {
                    found = false
                    break
                }
            }
            
            if found {
                return i
            }

        }

        return -1

      }

    public func reverseWords(_ s: String) -> String {
        var arr = s.split(separator: " ").map(String.init)
        let reversedArray = arr.reversed() // Reversed collection of strings
        let joinedString = reversedArray.joined(separator: " ")
        return joinedString
    }

    //MARK: TODO

    //MARK: 160 Intersection of Two Linked Lists

    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
//        Calculate the Lengths:
        let lengthA = getLeght(headA)
        let lengthB = getLeght(headB)

        var headA = headA
        var headB = headB
        if lengthA > lengthB {
            headA = moveForward(headA, by: lengthA - lengthB)
        } else {
            headB = moveForward(headB, by: lengthB - lengthA)
        }

        while headA !== headB {
            headA = headA?.next
            headB = headB?.next
        }


        return headA
     }

    private func getLeght(_ head: ListNode?) -> Int {
        var leght = 0
        var current: ListNode? = head
        while current != nil {
            leght += 1
            current = current?.next
        }
        return leght
    }
    private func moveForward(_ head: ListNode?, by steps: Int) -> ListNode? {

        var current = head
        var steps = steps
        while steps > 0 {
            current = current?.next
            steps -= 1
        }
        return current
    }

    public func merge(
        _ nums1: inout [Int],
        _ m: Int,
        _ nums2: [Int],
        _ n: Int
    ) {

        var i = m-1
        var j = n - 1
        var k = m + n-1

        while i >= 0 && j >= 0 {
            if nums1[i] < nums2[j] {
                nums1[k] = nums2[j]
                j -= 1
            } else {
                nums1[k] = nums1[i]
                i -= 1
            }

            k -= 1
        }

        while j >= 0 {
            nums1[k] = nums2[j]
            j -= 1
            k -= 1
        }





    }
//MARK: 14. Longest Common Prefix

    public func longestCommonPrefix(_ strs: [String]) -> String {
        var prefix = strs[0]

        for str in strs {
            // Reduce the prefix while it is not a prefix of the current string

            while !str.hasPrefix(prefix) {
                prefix = String(prefix.dropLast()) // will remove elemet
                print("prefix", prefix)
                if prefix.isEmpty {
                    return ""
                }
            }
        }

        return prefix


    }



    public func reverse(_ x: Int) -> Int {

        var num = x
        var reverseNum = 0
        while num != 0 {
            // Extract the last digit of num.

            let digit = num % 10
            // Check if adding the digit to reverseNum would cause overflow.
            // Overflow happens if reverseNum is greater than (Int(Int32.max) - digit) / 10
            // or if reverseNum is less than (Int(Int32.min) - digit) / 10.
            // If an overflow is detected, return 0.
            if reverseNum > (Int(Int32.max) - digit)/10 || reverseNum < (Int(Int32.min) - digit) / 10 {
                return 0
            }
            // Update reverseNum by shifting its digits left and adding the new digit.

            reverseNum = reverseNum*10+digit
            // Remove the last digit from num.
            num /= 10
        }

        return reverseNum
    }


    func convert(_ s: String, _ numRows: Int) -> String {

        return ""
    }

    func maxProduct(_ nums: [Int]) -> Int {

        if nums.isEmpty {
            return 0
        }
        var result = nums[0]
        var maximumEnding = nums[0]
        var minimumEnding = nums[0]
        for i in 1..<nums.count {
            let current = nums[i]

            if current == 0 {
                maximumEnding  = 1
                minimumEnding = 1
                result = max(result, 0)
            } else {
                let tempMax = max(current, maximumEnding * current, minimumEnding * current)
                minimumEnding = min(current, maximumEnding * current, minimumEnding * current)
                maximumEnding = tempMax
                result = max(result, maximumEnding)
            }
        }
        return result
    }
    public func maxArea(_ height: [Int]) -> Int {
        var result = 0

        var left = 0
        var right = height.count - 1

        while left < right {
            let area = (right - left) * min(height[left], height[right])
            result = max(result, area)

            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }

        return result
    }
    //MARK: 15. 3Sum
    /*
     iterate through array n - 3
     create two pointer
     skip duplicate for the first number
     caculate sum
     skip duplicate for second number
     skip duplicate for third number

     */
    public func threeSum(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        if nums.count <= 3 {
            return []
        }
        var result: [[Int]] = []

        for i in 0..<nums.count - 2 {

            if i > 0, nums[i] == nums[i-1] {
                continue
            }

            var left = i+1
            var right = nums.count - 1

            while left < right {
                let sum = nums[i] + nums[left] + nums[right]

                if sum == 0 {
                    result.append([nums[i], nums[left], nums[right]])
                    // Skip duplicates for the second number

                    if left < right, nums[left] == nums[left+1] {
                       left += 1
                    }
                    // Skip duplicates for the second number

                    if left < right, nums[right] == nums[right-1] {
                        right -= 1
                    }

                    left += 1
                    right -= 1
                } else if sum < 0 {
                    left += 1
                } else {
                    right -= 1
                }

            }

        }

        return result
    }
    //MARK: 371. Sum of Two Integers

    public func getSum(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        while b != 0 {
            let carry = a & b
            print("sum",carry)
            a = a ^ b
            print("a", a)
            b = carry << 1
        }
        return a
    }

    public func decodeString(_ s: String) -> String {
        var currentStr = ""
        var currentNum = 0
        var stringStack :[String] = []
        var countStack: [Int] = []
        for char in s {
            if char.isNumber {
                /* 12[a] => 0*10+1 => 1
                    1*10+2 => 12
                 */
                currentNum = currentNum * 10 + (char.wholeNumberValue ?? 0)
            } else if char == "[" {
                stringStack.append(currentStr)
                countStack.append(currentNum)
                currentStr = ""
                currentNum = 0
            } else if char == "]" {
               let repeatTime = countStack.removeLast()
                var temp = stringStack.popLast()
                temp! += String(repeating: currentStr, count: repeatTime)
                currentStr = temp!
            } else {
                currentStr.append(char)
            }

        }
        return currentStr
    }

    //MARK: Binary Search
    //MARK: 35. Search Insert Position
    public func searchInsert(_ nums: [Int], _ target: Int) -> Int {

        var left = 0
        var right = nums.count - 1

        while left <= right {

            let mid = left + (right - left)/2

            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                left = mid+1
            } else {
                right = mid - 1
            }
        }

        return left

    }

    //MARK: 162. Find Peak Element

    public func findPeakElement(_ nums: [Int]) -> Int {

        var left = 0
        var right = nums.count - 1

        while left <= right {
            let mid = left+(right - left) / 2
            if mid > 0 && mid < nums.count-1 {
                if nums[mid] > nums[mid+1] && nums[mid] > nums[mid-1] {
                    return mid
                } else if nums[mid] < nums[mid+1] {
                    left = mid+1
                } else if nums[mid] < nums[mid-1] {
                    right = mid-1
                }
            } else if mid == 0 {
                // If mid is at the first index, only compare with the next element
                if nums[mid] > nums[mid+1] {
                    return mid
                } else {
                    left = mid + 1
                }
            } else if mid == nums.count-1 {
                // If mid is at the last index, only compare with the previous element
                if nums[mid] > nums[mid-1] {
                    return mid
                } else {
                    right = mid - 1
                }
            }

        }

        return left
    }
//MARK: 268. Missing Number
    public func missingNumber(_ nums: [Int]) -> Int {

        let n = nums.count
        // 9 * 5
        let expectedSum = n*(n+1)/2
        print("expected sum", expectedSum)
        var actualSum = 0

        for num in nums {
            actualSum += num
        }

        return expectedSum - actualSum 

    }
    //MARK: TODO 
    //MARK: 1011. Capacity To Ship Packages Within D Days
    public func shipWithinDays(
        _ weights: [Int],
        _ days: Int
    ) -> Int {
        var low = weights.max(by: <)!
        print("low \(low)")
        var high = weights.reduce(0, +)
        while low < high {
            let mid = (low + high)/2
            if canShip(weights: weights, days: days, capacity: mid) {
                high = mid
            } else {
                low = mid+1
            }
        }

        return low
    }

    public func canShip(
        weights: [Int],
        days: Int,
        capacity: Int
    ) -> Bool {
        var dayNeeded = 1
        var current_weight = 0
        for weight in weights {
            if current_weight + weight > capacity {
                print("current_weight", current_weight, weight)
                dayNeeded += 1
                current_weight = 0
            }
            current_weight += weight

        }
        return dayNeeded <= days
    }
    private func maxiumPackages(weights: [Int] ) ->Int {
        var maximum = 0
        for i in weights {
            maximum = max(maximum, i)
        }
        return maximum

    }

//MARK: 624. Maximum Distance in Arrays
    // Todo 
   public func maxDistance(_ arrays: [[Int]]) -> Int {
       var maxDist = 0
       var maxVal = arrays[0].last!
       var minVal = arrays[0].first!

       for i in 1..<arrays.count {
           let currentArray = arrays[i]
           let distance1 = abs(currentArray.last! - minVal)
           let distance2 = abs(maxVal - (currentArray.first ?? 0))
           maxDist = max(maxDist, distance1, distance2)
           minVal = min(minVal, currentArray.first ?? 0)
           maxVal = max(maxVal, currentArray.last ?? 0)
       }

       return maxDist

    }

    func minSteps(_ n: Int) -> Int {

        return 0
     }
//    [2,7,11,15]
   //MARK: 2148. Count Elements With Strictly Smaller and Greater Elements
    /*
    Step 1: Find the minimum and maximum elements in the array.
    Step 2: Iterate through the array and count elements that are strictly between the minimum and maximum values.
    Final: Return the count value.
    Time complexity is: O(n)
    Space complexity is: O(1)
     */
    public func countElements(_ nums: [Int]) -> Int {
        let minValue = nums.min()!
        let maxValue = nums.max()!
        var count = 0
        for num in nums {
            if num > minValue && num < maxValue {
                count += 1
            }
        }
        return count
    }

    func hasCycle(_ head: ListNode?) -> Bool {

        var slow = head
        var fast = head
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
            if slow === fast {
                return true
            }
        }
        return false

    }

    //MARK: Tree

    public func isSymmetric(_ root: TreeNode<Int>?) -> Bool {

        return isMiror(left: root?.left, right: root?.right)
    }

    private func isMiror(
        left: TreeNode<Int>?,
        right: TreeNode<Int>?
    ) -> Bool {

        if left == nil && right == nil {
            return true
        }

        if left == nil || right == nil {
            return false
        }
        return (left?.val == right?.val)
        && isMiror(
            left: left?.left,
            right: right?.right
        )
        && isMiror(
            left: left?.right,
            right: right?.left
        )
    }

    //MARK: 701. Insert into a Binary Search Tree
    func insertIntoBST(_ root: TreeNode<Int>?, _ val: Int) -> TreeNode<Int>? {
        guard let node = root else { return TreeNode<Int>(value: val) }

        if val > node.val {
            node.right = insertIntoBST(node.right, val)
        } else {
            node.left = insertIntoBST(node.left, val)
        }

        return node

    }

    func insertIntoBSTIterative(_ root: TreeNode<Int>?, _ val: Int) -> TreeNode<Int> {
        // If the tree is empty, create and return a new node
        guard let rootNode = root else {
            return TreeNode(value: val)
        }

        var currentNode: TreeNode? = rootNode
        while let node = currentNode {
            if val < node.val {
                if node.left == nil {
                    node.left = TreeNode(value: val)
                    break
                } else {
                    currentNode = node.left
                }
            } else {
                if node.right == nil {
                    node.right = TreeNode(value: val)
                    break
                } else {
                    currentNode = node.right
                }
            }
        }


        return rootNode
    }

    func invertTree(_ root: TreeNode<Int>?) -> TreeNode<Int>? {

        guard let node = root else { return nil}
        
        let temp = node.left
        node.left = node.right
        node.right = temp
        invertTree(node.left)
        invertTree(node.right)
        return root
    }

    public func findComplement(_ num: Int) -> Int {
        var mask = 1
        while mask < num {
            mask = (mask << 1) | 1
        }
        return num ^ mask
     }

public func minDepth(_ root: TreeNode<Int>?) -> Int {
        guard let root = root else {
            return 0
        }

        var queue: [TreeNode<Int>] = [root]
        var level = 1
        while !queue.isEmpty {
            for i in 0..<queue.count {
                let currentNode = queue.removeFirst()

                if currentNode.left == nil && currentNode.right == nil {
                    return level
                }
                if let left = currentNode.left {
                    queue.append(left)
                }
                if let right = currentNode.right {
                    queue.append(right)
                }

            }
            level += 1
        }

        return level

    }

   //MARK: 543. Diameter of Binary Tree

    func diameterOfBinaryTree(_ root: TreeNode<Int>?) -> Int {
        var diameter = 0

        func calculateHeight(_ node: TreeNode<Int>?) -> Int {
            guard let node = node else { return 0 }
            let leftHeight = calculateHeight(node.left)
            let rightHeight = calculateHeight(node.right)
            diameter = max(diameter, leftHeight+rightHeight)

            return max(leftHeight, rightHeight) + 1

        }
        // Start the recursive height calculation from the root
        calculateHeight(root)

        return diameter
      }

    //MARK: 110. Balanced Binary Tree
    /*
     balance tree the height of left and right subtrees of any nodes differ by no more than one is left node and right node not equal - 1 and
     the two subtree every node never differs more than one
     */
    func isBalanced(_ root: TreeNode<Int>?) -> Bool {
        func calculateHeight(_ root: TreeNode<Int>?) -> Int {
            guard let root = root else {
                return 0
            }

            let leftHeight = calculateHeight(root.left)
            let rightHeight = calculateHeight(root.right)

            if leftHeight == -1 || rightHeight == -1 || abs(leftHeight - rightHeight) > 1 {
                return -1
            }

            return max(leftHeight, rightHeight) + 1
        }

        return calculateHeight(root) != -1
      }

    //MARK: 404. Sum of Left Leaves

    public func sumOfLeftLeaves(_ root: TreeNode<Int>?) -> Int {
        guard let root = root else { return 0 }
        var sum = 0

        if let left = root.left {
            if left.left == nil || left.right == nil {
                sum += left.val
            } else {
                sum += sumOfLeftLeaves(left)
            }
        }
       sum += sumOfLeftLeaves(root.right)

        return sum
    }

    public func postorderTraversal(_ root: TreeNode<Int>?) -> [Int] {
        var results: [Int] = []

        func traversal(root: TreeNode<Int>?) {
            if root != nil {
                traversal(root: root?.left)
                traversal(root: root?.right)
                results.append(root?.val ?? 0)
            }
        }
        traversal(root: root)
        return results
    }

   public func sortedArrayToBST(_ nums: [Int]) -> TreeNode<Int>? {
       func helper(_ nums: [Int], _ left: Int , _ right: Int) -> TreeNode<Int>? {
           if left > right {
               return nil
           }
           let mid = (right + left)/2
           let node = TreeNode<Int>.init(value: nums[mid])
           node.left = helper(nums, left, mid - 1)
           node.right = helper(nums, mid + 1, right)
           return node
       }
       return helper(nums, 0, nums.count - 1)
    }
    //MARK: 98. Validate Binary Search Tree

    public func isValidBST(_ root: TreeNode<Int>?) -> Bool {

        func helper(_ root: TreeNode<Int>?, min: Int?, max: Int?) -> Bool {
            guard let root = root else { return true }
            if let min = min, root.val <= min {
                return false
            }

            if let max = max, root.val >= max {
                   return false
               }
            return helper(root.left, min: min, max: root.val) &&  helper(root.right, min: root.val, max: max)
        }

        return helper(root, min: nil, max: nil)
    }

    //MARK: Stack
//Input: s = "bcabc"
//Output: "abc"
    public func removeDuplicateLetters(_ s: String) -> String {
        var stack: [Character] = []
        var seen: Set<Character> = []
        var frequency: [Character: Int] = [:]
        // Step 1: Count the frequency of each character in the string
          for char in s {
              frequency[char, default: 0] += 1
          }

        for (_, char) in s.enumerated() {

            // Decrease the frequency of the current character
            frequency[char]! -= 1

            // Example condition: if stack is not empty and the last character is equal to the current one
            if seen.contains(char) {
                continue
            }

            while let last = stack.last, last > char, frequency[last]! > 0 {
                stack.removeLast()
                seen.remove(last)
            }
            seen.insert(char)
            stack.append(char)
        }

        return String(stack)
    }



    public func find132pattern(_ nums: [Int]) -> Bool {

        if nums.count < 3 {
            return false
        }
        var stack: [Int] = []
        var third = Int.min
        for i in (0..<nums.count).reversed() {
            if nums[i] < third {
                return true
            }
            while !stack.isEmpty, nums[i] > stack.last ?? 0{
                third = stack.removeLast()
            }
            stack.append(nums[i])
        }
        return false
    }

    public func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var nextGreaterElementArr: [Int] = []
        nextGreaterElementArr = Array(repeating: -1, count: nums1.count)
        print("nextGreaterElementArr",nextGreaterElementArr)
        var stack: [Int] = []
        var dict: [Int:Int] = [:]
        for (index, value) in nums1.enumerated() {
            dict[value] = index
        }
        for num in nums2 {

            while !stack.isEmpty, let last = stack.last, last < num {
                let top = stack.popLast()!
                if let index = dict[top] {
                    nextGreaterElementArr[index] = num
                }
            }
            stack.append(num)

        }
        return nextGreaterElementArr
    }

    public func nextGreaterElements(_ nums: [Int]) -> [Int] {
        var stack: [Int] = []
        var nextGreaterElements = Array(repeating: -1, count: nums.count)

        for i in 0..<(2 * nums.count) {

            let index = i % nums.count
            print("index ", index)

            while !stack.isEmpty, let last = stack.last, nums[last] < nums[index]{
               let lastIndex = stack.removeLast()
                nextGreaterElements[lastIndex] = nums[index]
            }
            if i < nums.count {
                stack.append(index)
            }
        }

        print("nextGreaterElements", nextGreaterElements)
        return nextGreaterElements
    }
//MARK: 581. Shortest Unsorted Continuous Subarray to do
    public func findUnsortedSubarray(_ nums: [Int]) -> Int {
        var stack: [Int] = []
        var left = nums.count
           var right = 0
        for i in 0..<nums.count {
            while !stack.isEmpty, let last = stack.last, nums[last] > nums[i] {
                print("index value",i)
                left = min(left, stack.popLast() ?? 0)
            }
            stack.append(i)
        }
        print("left = ", left)
//        print("value", stack, left)
        stack.removeAll()
        for (i, value) in nums.enumerated().reversed() {
            while !stack.isEmpty && nums[stack.last!] < value {
                print("right",value, i)
                right = max(right, stack.popLast()!)
            }
            stack.append(i)
        }
        return right - left > 0 ? right - left + 1 : 0
    }

    public func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var stack: [Int] = []
        var results = Array(repeating: 0, count: temperatures.count)
        for i in 0..<temperatures.count {

            while !stack.isEmpty, let last = stack.last, temperatures[i] > temperatures[last] {
                let lastIndex = stack.popLast()!
                print("index", i, lastIndex)
                results[lastIndex] = i - lastIndex
            }
            stack.append(i)

        }
        return results
    }
    //MARK: 1475: Final Prices With a Special Discount in a Shop.
    public func finalPrices(_ prices: [Int]) -> [Int] {

        var stack: [Int] = []
        var results = prices
        for i in 0..<prices.count {

            while !stack.isEmpty, let last = stack.last, prices[i] <= prices[last] {
                let lastIndex = stack.popLast()!
                let num = prices[lastIndex] - prices[i]
                print("num",num)
                results[lastIndex] = num

            }
            stack.append(i)
        }
        return results
      }

    public func sumSubarrayMins(_ arr: [Int]) -> Int {

        return 0
    }

    public func removeKdigits(_ num: String, _ k: Int) -> String {
        
        var stack: [Character] = []
        var k = k
        for digit in num {
            while k > 0, !stack.isEmpty, let last = stack.last, last > digit {
                stack.popLast()
                k -= 1
            }

            if !stack.isEmpty ||  digit != "0" {
                stack.append(digit)
            }
        }

        while k > 0, !stack.isEmpty {
            stack.popLast()
            k -= 1
        }

        let result = String(stack)

        return result.isEmpty ? "0" : result
      }

   public func splitListToParts(_ head: ListNode?, _ k: Int) -> [ListNode?] {
       var result = [ListNode?](repeating: nil, count: k)

           // Step 1: Calculate the total length of the linked list
           var length = 0
           var current = head
           while current != nil {
               length += 1
               current = current?.next
           }

           // Step 2: Calculate the base size of each part and how many parts need extra nodes
           let baseSize = length / k
           let extraNodes = length % k

           // Step 3: Traverse the linked list and split it into parts
           current = head
           for i in 0..<k {
               if current == nil {
                   result[i] = nil  // If we run out of nodes, fill with nil
               } else {
                   result[i] = current  // Set the head of the current part
                   var partSize = baseSize + (i < extraNodes ? 1 : 0)  // Calculate the current part size

                   // Move the current pointer `partSize - 1` steps forward, if partSize > 0
                   for _ in 0..<partSize - 1 {
                       current = current?.next
                   }

                   // Split the list by disconnecting the current part from the rest
                   if current != nil {
                       let nextPart = current?.next
                       current?.next = nil  // Terminate the current part
                       current = nextPart  // Move to the next part
                   }
               }
           }

           return result
      }

    public func mostCompetitive(_ nums: [Int], _ k: Int) -> [Int] {

        var stack: [Int] = []
        let n = nums.count

        for (i,num) in nums.enumerated() {

            while !stack.isEmpty, let last = stack.last, num < last, stack.count + (n - i) > k {
               let lastIndex = stack.popLast()
                print("lastIndex",lastIndex!)
            }
            if stack.count < k {
                stack.append(num)
            }
        }
        return stack
      }

    public func numSubmat(_ mat: [[Int]]) -> Int {

        let m = mat.count
        let n = mat[0].count

        var result = 0
        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)

           // Step 1: Build the dp table to store consecutive 1's in each row
        for i in 0..<m {
            for j in 0..<n {
                if mat[i][j] == 1 {
                    dp[i][j] = (j == 0 ? 0 : dp[i][j-1]) + 1
                }
            }
        }

        for i in 0..<m {
            for j in 0..<n {
                var minWidth = dp[i][j]
                for k in (0...i).reversed() {  // Move upwards from row i to row 0
                    minWidth = min(minWidth, dp[k][j])  // Minimum width of 1's in the column
                    if minWidth == 0 {  // If there's a row with no 1's, break the loop
                        break
                    }
                    result += minWidth  // Add the number of valid submatrices
                }
            }
        }

        return result

    }

   public func maxSumMinProduct(_ nums: [Int]) -> Int {
       let mod = Int(1e9 + 7)
       var res = 0
       var stack = [(Int, Int)]() // A stack of (startIndex, value)
       var prefix = [0]           // Prefix sum array initialized with 0

       for n in nums {
           prefix.append(prefix.last! + n)
       }

       for (i, n) in nums.enumerated() {
           var newStart = i
           while let last = stack.last, last.1 > n {
               let (start, val) = stack.removeLast()
               let total = prefix[i] - prefix[start]
               res = max(res, val * total)
               newStart = start
           }
           stack.append((newStart, n))
       }
       // Final check for remaining elements in the stack
       for (start, val) in stack {
           let total = prefix[nums.count] - prefix[start]
           res = max(res, val * total)
       }
       return res % mod
       }

    public func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {

        guard nums.count >= k else { return []}
//        var currentSum = 0

        var deque = [Int]()  // This will store indices
            var result = [Int]()

            for i in 0..<nums.count {

                let current = nums[i]

                // Remove indices from the deque where the corresponding element is smaller or equal to the current element
                while !deque.isEmpty && nums[deque.last!] <= current {
                    deque.removeLast()
                }

                // Add the current element index to the deque
                deque.append(i)

                // Remove the front element of the deque if it's outside the current window
                if deque.first! == i - k {
                    deque.removeFirst()
                }

                // If we have a valid window, record the maximum (which is at the front of the deque)
                if i >= k - 1 {
                    result.append(nums[deque.first!])
                }
            }

            return result
     }

    public func permute(arr: [Int]) -> [[Int]] {
        var results: [[Int]] = []
        var arr = arr
        func backtrack(start: Int) {
            if start == arr.count {
                results.append(arr)
                return
            }

            for i in start..<arr.count {
                arr.swapAt(start, i)
                backtrack(start: start + 1)
                arr.swapAt(start, i) // Swap back to the original array state
            }

        }
        backtrack(start: 0)
        return results
    }

    public func uncommonFromSentences(_ s1: String, _ s2: String) -> [String] {
        // Split strings into arrays of words
            let arr1 = s1.components(separatedBy: " ")
            let arr2 = s2.components(separatedBy: " ")

            // Create a single hashMap for both arrays
            var wordCount: [String: Int] = [:]

            // Count occurrences of words in both arrays
            for word in arr1 {
                wordCount[word, default: 0] += 1
            }

            for word in arr2 {
                wordCount[word, default: 0] += 1
            }

            // Filter words that occur exactly once
            return wordCount.filter { $0.value == 1 }.map { $0.key }
      }

    //MARK: 392. Is Subsequence

    //MARK: 567. Permutation in String
    
    public func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        // Edge case: if s1 is longer than s2, no permutation of s1 can be a substring of s2
           if s1.count > s2.count {
               return false
           }

           let s1Chars = Array(s1)
           let s2Chars = Array(s2)

           var s1Count = [Int](repeating: 0, count: 26) // Frequency array for s1
           var s2Count = [Int](repeating: 0, count: 26) // Frequency array for s2 (window of size s1)

           let aAsciiValue = Int(Character("a").asciiValue!) // Reference for 'a' in ASCII

            print("aAsciiValue",aAsciiValue)
           // Build the frequency array for s1 and the first window of s2
           for i in 0..<s1.count {
               s1Count[Int(s1Chars[i].asciiValue!) - aAsciiValue] += 1
               s2Count[Int(s2Chars[i].asciiValue!) - aAsciiValue] += 1
           }

           // If the first window matches, return true
           if s1Count == s2Count {
               return true
           }

           // Now slide the window over s2
           for i in s1.count..<s2.count {
               // Remove the influence of the character that's sliding out of the window
               s2Count[Int(s2Chars[i - s1.count].asciiValue!) - aAsciiValue] -= 1
               // Add the influence of the character that's sliding into the window
               s2Count[Int(s2Chars[i].asciiValue!) - aAsciiValue] += 1

               // If the new window matches s1's frequency, return true
               if s1Count == s2Count {
                   return true
               }
           }

           // No permutation of s1 found as a substring of s2
           return false
    }

//    var results: [[Int]] = []
//    func backtrack(path: [Int], _ remaining: [Int]) {
//        if remaining.isEmpty {
//            results.append(path)
//        }
//
//        for i in 0..<remaining.count {
//            var newPath = path
//            var newRemaining = remaining
//            print("value", newRemaining[i])
//            newPath.append(newRemaining[i])
//            newRemaining.remove(at: i)
//            backtrack(path: newPath, newRemaining)
//        }
//    }
//    backtrack(path: [], nums)
//    return results

    public func isSubsequence(_ s: String, _ t: String) -> Bool {
        let sChars = Array(s)
           let tChars = Array(t)
        // Pointers for s and t
        var i = 0, j = 0

        while j < tChars.count {

            if i < sChars.count &&  sChars[i] == tChars[j] {
                i += 1
            }

            j += 1
            if i < sChars.count && sChars[i] == tChars[j] {
                i += 1
            }

            j += 1
            if i == sChars.count {
                return true
            }
        }

        return i == sChars.count
    }

    public func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        let sortedG = g.sorted()
        let sortedS = s.sorted()
        var contentChildren = 0  // Count of content children
        var i = 0, j = 0

        while i < sortedG.count && j < sortedS.count {
            if sortedS[j] >= sortedG[i] {
                i += 1
                contentChildren += 1
            }
            j += 1
        }

        return contentChildren
    }
//  [1,3,4,2,2]
    //  [1,2,2,3,4]
    public func findDuplicate(_ nums: [Int]) -> Int {
        var sortedArray = nums.sorted()
        var result: Int = 0
        for i in 0..<sortedArray.count {
            if i+1 < nums.count, sortedArray[i] == sortedArray[i+1] {
                result = sortedArray[i]
            }
        }
        return result
      }

    public func reverseVowels(_ s: String) -> String {
        let vowels: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]

        var characters = Array(s)
        var left = 0
        var right = characters.count-1

        while left < right {

            // Move left pointer until a vowel is found
            while left < right && !vowels.contains(characters[left]) {
                left += 1
            }

            // Move left pointer until a vowel is found
            while left < right && !vowels.contains(characters[right]) {
                right -= 1
            }

            characters.swapAt(left, right)

            left += 1
            right -= 1

        }

        return String(characters)
    }

    public func subsets(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = []
        var subset: [Int] = []

        func dfs(index: Int) {
            if index == nums.count {
                results.append(subset)
                return
            }

            subset.append(nums[index])
            dfs(index: index+1)
            subset.popLast()
            dfs(index: index+1)
        }
        dfs(index: 0)
        return results
      }

    public func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = []
        var subset: [Int] = []
        let sortedNums = nums.sorted()

        func dfs(index: Int) {
            results.append(subset)
            for i in index..<nums.count {

                if i > index && sortedNums[i] == sortedNums[i-1] {
                    continue
                }
                subset.append(sortedNums[i])
                dfs(index: i+1)
                subset.removeLast()
            }
        }

        dfs(index: 0)

        return results
    }
}

//MARK: ENDING


public func buildLinkedList(_ array: [Int]) -> ListNode? {
    guard !array.isEmpty else { return nil }
    let dummy = ListNode()
    var current = dummy
    for val in array {
        current.next = ListNode(val)
        current = current.next!
    }
    return dummy.next
}

// Helper function to convert a linked list to an array
public func linkedListToArray(_ head: ListNode?) -> [Int] {
    var array: [Int] = []
    var current = head
    while current != nil {
        array.append(current!.val)
        current = current?.next
    }
    return array
}







func performOperation(closure: @escaping() -> Void) {
    DispatchQueue.global().async {
        closure()
    }
    print("Operation completed")
}


