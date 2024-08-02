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
            minPrice = min(minPrice, price)
            maxProfit = max(maxProfit, price - minPrice)
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


    public func minDepth(_ root: TreeNode<Int>?) -> Int {
        guard let root = root else {
            return 0
        }
        var queue: [(TreeNode, Int)] = [(root, 1)]

        while !queue.isEmpty {
            let (node, depth) = queue.removeFirst()

            // Check if this is a leaf node
            if node.left == nil && node.right == nil {
                return depth
            }

            // Enqueue left child
            if let left = node.left {
                queue.append((left, depth + 1))
            }

            // Enqueue right child
            if let right = node.right {
                queue.append((right, depth + 1))
            }
        }
        return 0


    }
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
    //MARK: TODo 

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

    //MARK: Leetcode 424. Longest Repeating Character Replacement
    /*
     using slide window techinique
     Step1: expand window and store element occurs
     then compute maximum frequency in array

     Step2: Shink the window by using condition right - left + 1 - maximum frequency > k

     Fianlly: we need compute maximum max count
     */

    public func characterReplacement(_ s: String, _ k: Int) -> Int {
        //  AAAA
            var left = 0
            var right = 0
            let newArray = Array(s)
            var count = 0
            var maxCount = 0
            var hashMap: [Character: Int] = [:]
            var maxFreq: Int = 0
            while right < newArray.count {

                let char = newArray[right]
                hashMap[char, default: 0] += 1
                maxFreq = max(maxFreq, hashMap[char]!)

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

        for i in 0..<n {
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
//        let l1: ListNode? = list1
//        let l2: ListNode? = list2

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

    //MARK: 160. Intersection of Two Linked Lists

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

}


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
