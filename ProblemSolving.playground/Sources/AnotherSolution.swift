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

    public func islandPerimeter(_ grid: [[Int]]) -> Int {
        var result = 0
        for r in 0..<grid.count  {
            print("row",r)
            for col in 0..<grid[r].count {
                if grid[r][col] == 1 {
                    result += 4
                    print("Fuck ", grid[1][1])
                    if r > 0 && grid[r-1][col] == 1{
                        result -= 2
                    }
                    if col > 0 && grid[r][col-1] == 1 {
                        result -= 2
                    }
                }

            }
        }

        return result
    }

    public func twoSum2(_ numbers: [Int], _ target: Int) -> [Int]
    {
        var left = 0
        var right =  numbers.count - 1

        while left < right {
            let sum = numbers[right] + numbers[left]
            if sum == target {
                return [left+1,right+1]
            } else if sum < target {
                left += 1
            } else {
                right -= 1
            }
        }
        return []

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

    public func removeDuplicates(_ nums: inout [Int]) -> Int {
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







//    class Solution {
//        func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
//            let nums = nums.sorted() // Sort the array
//            var closestSum = Int.max
//
//            for i in 0..<nums.count - 2 {
//                var left = i + 1
//                var right = nums.count - 1
//
//                while left < right {
//                    let currentSum = nums[i] + nums[left] + nums[right]
//
//                    if abs(target - currentSum) < abs(target - closestSum) {
//                        closestSum = currentSum
//                    }
//
//                    if currentSum < target {
//                        left += 1
//                    } else {
//                        right -= 1
//                    }
//                }
//            }
//
//            return closestSum
//        }
//    }



}

class MyStack2 {

    private var queue1: [Int] = []
    private var queue2: [Int] = []

    init() {
        queue1 = []
        queue2 = []
    }

    func push(_ x: Int) {
        queue2.append(x)
        while !queue1.isEmpty {
            queue2.append(queue1.removeFirst())
        }

        // Swap queue1 and queue2
//        (queue1, queue2) = (queue2, queue1)

        let temp = queue1
        queue1 = queue2
        queue2 = temp
    }

    func pop() -> Int {
        if queue1.isEmpty {
            return 0
        }

        return queue1.removeFirst()
    }

    func top() -> Int {
        return queue1.first ?? 0

    }

    func empty() -> Bool {
        return queue1.isEmpty
    }
}



class Stack {
    private var queue1: [Int] = []
    private var queue2: [Int] = []

    init() {
        queue1 = []
        queue2 = []
    }

    func push(_ element: Int) {
        queue2.append(element)
        while !queue1.isEmpty {
            queue2.append(queue1.removeFirst())
        }

        // Swap queue1 and queue2
        (queue1, queue2) = (queue2, queue1)
    }

    func pop() -> Int? {
        if queue1.isEmpty {
            return nil
        }

        return queue1.removeFirst()
    }

    func peek() -> Int? {
        return queue1.first
    }

    func isEmpty() -> Bool {
        return queue1.isEmpty
    }
}
