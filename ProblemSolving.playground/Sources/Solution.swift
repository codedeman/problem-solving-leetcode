import Foundation

public class Solution {
    public init() { }

    func twoSum(nums: [Int], target: Int) -> [Int] {
        var hashMap = [Int: Int] ()
        for i in 0..<nums.count {
            let num = nums[i]
            let newIndex = target - num
            if let otherIndex = hashMap[newIndex] {
                return [otherIndex,i]
            }
            hashMap[num] = i
        }
        return []
    }
    //MARK: 20. Valid Parentheses
    /*
     Step1 define hash map with close and open then declare stack
     Step 2 interate through array string with open parentheses we add letter into stack
     Step 3 with close parentheses we need to check if hash map != stack.poplast return false
     Finally return true if stack is empty

     */

    func isValid(_ s: String) -> Bool {
        let charMap: [Character: Character] = ["}":"{",
                                               ")":"(",
                                               "]":"[",

        ]

        var stack = [Character]()
        for letter in s {
            switch letter {
            case "(", "{", "[":
                stack.append(letter)

            case "}", ")", "]" :
                guard let last = stack.popLast(), charMap[letter] == last else {
                    return false
                }

            default:
                stack.popLast()
            }
        }
        return stack.isEmpty

    }

    func finđDuplicate(nums: [Int]) -> [Int] {
        var hashMap =  [Int: Int]()
        var arrDuplicate: [Int] = []
        for i in 0..<nums.count {
            if hashMap[nums[i]] != nil {
                arrDuplicate.append(nums[i])
            }
            hashMap[nums[i]] =  i
        }
        return arrDuplicate
    }

    //    func maxProfit(_ prices: [Int]) -> Int {
    //        var left = 0
    //        var right = left+1
    //        var maxProfit = 0
    //        while right < prices.count {
    //            print("left ==> \(left)")
    //            if prices[left] < prices[right] {
    //                maxProfit =  max(maxProfit, prices[right] - prices[left])
    //            } else {
    //                left = right
    //            }
    //            right += 1
    //        }
    //        return maxProfit
    //    }



    func removeElement(_ nums: inout  [Int], _ val: Int) -> Int {
        var index = 0
        while index < nums.count {
            if nums[index] == val {
                print("==> \(nums[index])")
                nums.remove(at: index)
                index -= 1
            }
            index += 1
        }

        return nums.count
    }
    //MARK: 28. Find the Index of the First Occurrence in a String


    func strStr(haystack: String, needle: String) -> Int {
        if needle == "" { return 0 }

        if needle.count > haystack.count {
            return -1
        }

        if let range = haystack.range(of: needle) {
            return haystack.distance(from: haystack.startIndex, to: range.lowerBound)
        } else {
            return -1
        }
    }

    func generateParenthesis(_ n: Int) -> [String] {
        var stack = [Character]()
        var res = [String]()

        func backtrack(_ openN: Int, _ closedN: Int) {

            if openN == closedN && openN == n {
                res.append(String(stack))
                return
            }

            if openN > 0 {
                stack.append("(")
                backtrack(openN + 1, closedN)
                stack.removeLast()
            }

            if closedN < openN {
                stack.append(")")
                backtrack(openN, closedN + 1)
                stack.removeLast()
            }
        }

        backtrack(0, 0)
        return res
    }

    func calPoints(_ operations: [String]) -> Int {
        var newoperations: [Int] = []
        var sum: Int = 0
        for  element  in operations {
            if element == "C" {
                if !newoperations.isEmpty {
                    sum -= newoperations.last ?? 0
                    newoperations.removeLast()
                }

            } else if element == "D" {
                if let lastValidCode = newoperations.last {
                    let doubleScore = lastValidCode*2
                    newoperations.append(doubleScore)
                    sum += doubleScore
                }

            } else  if element == "+" {
                if newoperations.count >= 2 {
                    let lastValidScore =  newoperations[newoperations.count-1]
                    let secondValid = newoperations[newoperations.count - 2]
                    let newscore = lastValidScore+secondValid
                    newoperations.append(newscore)
                    sum += newscore

                }
            } else {
                if let value = Int(element) {
                    newoperations.append(value)
                    sum += value
                }
            }

        }

        return sum
    }



    func maxSubArray(_ nums: [Int]) -> Int {
        var maxValue = Int.min
        var currentSum = 0
        for num in nums {
            currentSum = max(num, currentSum+num)
            maxValue = max(maxValue,currentSum)
        }
        return maxValue
    }

    func maxSubArraySum(_ a: [Int], _ size: Int) -> Int {
        var maxSoFar = Int.min
        var maxEndingHere = 0

        for i in 0..<size {
            maxEndingHere += a[i]
            if maxSoFar < maxEndingHere {
                maxSoFar = maxEndingHere
            }
            if maxEndingHere < 0 {
                maxEndingHere = 0
            }
        }

        return maxSoFar
    }

    func maxProduct(_ nums: [Int]) -> Int {
        var result = nums[0]
        for (i,_) in nums.enumerated() {
            var mul = nums[i]
            for j in i+1..<nums.count {
                result = max(result,mul)
                mul *= nums[j]
            }
            result = max(result,mul)
        }
        return result

    }

    //    func getConcatenation(_ nums: [Int]) -> [Int] {
    //       return nums + nums
    //    }
    ////    [ 1,4,5,3,12,10 ]




    func minJumps(_ nums: [Int]) -> Int {
        let n = nums.count
        var jumps = [Int](repeating: Int.max, count: n)
        jumps[0] = 0

        for i in 1..<n {
            for j in 0..<i {
                if j + nums[j] >= i {
                    jumps[i] = min(jumps[i], jumps[j] + 1)
                }
            }
        }

        return jumps[n - 1]
    }


    func jump(_ nums: [Int]) -> Int {
        var count = 0

        for i in 1..<nums.count {
            for j in i..<nums.count {
                if nums[i] > nums[j] {
                    count += 1
                }
            }

        }
        return count
    }

    func nextGreaterElement(_ nums1: [Int],
                            _ nums2: [Int]) -> [Int] {

        var dict: [Int: Int] = [:]
        var stack: [Int] = []
        for (key,value) in nums1.enumerated() {
            dict[key] = value
        }
        var result = [Int](repeating: -1, count: nums1.count)

        for num in nums2 {
            while !stack.isEmpty && stack.last! < num {
                let top =  stack.removeLast()
                print("pop",top)
                if let index = dict[top] {
                    result[index] = num
                }
            }
            stack.append(num)
        }
        for n in stack {
            print("element in stack\(n)")
        }
        return  result

    }
    // MARK: 739. Daily Temperatures

    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {

        var result = [Int](repeating: 0, count: temperatures.count) // Initialize the result array with zeros
        var stack = [Int]() // Create an empty stack to store the indices

        for (index, value) in temperatures.enumerated() {
            while !stack.isEmpty && value > temperatures[stack.last!] {
                let top = stack.removeLast()
                result[top] = index-top
                print("pop",top)
            }
            stack.append(index)
        }

        return result
    }


    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var stack = [Int]()
        for var a in asteroids { // Use 'var' to make 'a' mutable
            while !stack.isEmpty && a < 0 && stack.last! > 0 {
                let diff = a + stack.last!
                if diff < 0 {
                    stack.popLast()
                } else if diff > 0 {
                    a = 0
                } else {
                    a = 0
                    stack.popLast()
                }
            }
            if a != 0 {
                stack.append(a)
            }
        }
        return stack
    }



    func asteroidCollision3(_ asteroids: [Int]) -> [Int] {
        var stack: [Int] = []
        for var asteroid in asteroids {
            while !stack.isEmpty && asteroid<0 && stack.last! > 0 {
                let diff = asteroid + stack.last!
                if diff < 0 {
                    stack.popLast()
                } else if diff > 0 {
                    asteroid = 0
                }  else {
                    asteroid = 0
                    stack.popLast()
                }
            }
            if asteroid != 0  {
                stack.append(asteroid)
            }

        }

        return stack
    }

    func maxSubArrayt(_ nums: [Int]) -> Int {
        var maxValue = Int.min
        var maxEnding = 0
        for num in nums {
            maxEnding = maxEnding + num
            if maxValue < maxEnding {
                print("-->",num)
                maxValue = maxEnding
            }

            if maxEnding < 0 {
                maxEnding = 0
            }

        }
        return maxValue
    }


    func maxSumMinProduct(_ nums: [Int]) -> Int {
        var currentSum = 0
        var maxSum = Int.min
        for (_,num) in nums.enumerated() {
            print("",num)
            currentSum = max(num, currentSum + num)
            maxSum = max(maxSum, currentSum)
        }
        return maxSum


    }

    func maxSubMinProduct(_ nums: [Int]) -> Int {

        var prefixSum = Array(repeating: 0, count: nums.count + 1)
        for i in 0..<nums.count {
            prefixSum[i+1] = prefixSum[i] + nums[i]
        }
        print(prefixSum)
        var maxMinProd = Int.min
        var minStack = [Int]()
        for i in 0...nums.count {
            while !minStack.isEmpty && (i == nums.count || nums[i] < nums[minStack.last!])  {
                let mid = minStack.removeLast()
                let left = minStack.isEmpty ? 0 : minStack.last! + 1
                let new = (prefixSum[i] - prefixSum[left]) * nums[mid]
                maxMinProd = max(maxMinProd, new)

            }
            minStack.append(i)

        }

        return maxMinProd % (Int(pow(10.0, 9.0)) + 7)

    }

    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        if speed.count == 1 {return 1}
        let array = zip(position, speed).sorted{$0.0 < $1.0}
        var stack = [Double]()

        for (x, v) in array {
            let time = Double(target - x) / Double(v)
            print("value \(time)")
            if !stack.isEmpty && time >= stack.last! {
                stack.popLast()
            }
            stack.append(time)
        }
        return stack.count
    }



    func evalRPN(_ tokens: [String]) -> Int {
        var stack: [Int] = []
        for value in tokens{
            switch value {
            case "+":
                stack.append(stack.popLast()!+stack.popLast()!)
            case "-":
                let a = stack.popLast()!
                let b  = stack.popLast()!
                stack.append(b-a)
            case "*":
                stack.append(stack.popLast()!*stack.popLast()!)
            case "/":
                let a = stack.popLast()!
                let b  = stack.popLast()!
                stack.append(b/a)
            default:
                stack.append(Int(value)!)
            }
        }

        return stack.first!
    }

    // MARK: 71. Simplify Path
    func simplifyPath(_ path: String) -> String {
        var path = path.split(separator: "/")
        var simplePath: [String] = []
        for str in path {

            switch str {
            case ".":
                continue
            case "..":
                simplePath.popLast()
            default:
                simplePath.append(String(str))
            }

        }

        return "/"+simplePath.joined()
    }

    public func isAlienSorted(_ words: [String], _ order: String) -> Bool {

        let translateAble = Dictionary(uniqueKeysWithValues: zip(order,"abcdefghijklmnopqrstuvwxyz"))
        var prev = ""
        for word in words {
            let currentStr = String(word.map{ ch in translateAble[ch]!})
            print("str ", currentStr)
            guard prev <= currentStr else { return false }
            prev = currentStr
        }
        return true
    }
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        var l = 0
        var nums = nums
        for r in 0..<nums.count {
            if nums[r] % 2 == 0 {
                nums.swapAt(r, l)
                l += 1
            }
        }
        return nums
    }


    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {

        var maxCount = 0
        var currentCount = 0

        for num in nums {
            if num == 1 {
                currentCount += 1
                maxCount = max(maxCount, currentCount)
            } else {
                currentCount = 0
            }
        }

        return maxCount
    }

    func findRadius(_ houses: [Int], _ heaters: [Int]) -> Int {

        var houses = houses.sorted {$0>$1}
        var heaters = heaters.sorted{$0>$1}
        var  radius  = 0
        for house in houses {
            let index = binarySearch(arr: heaters, target: house)
            print("index",index)
            var distance = Int.max
            if index < heaters.count {
                distance = heaters[index] - house
            }

            if index > 0 {
                distance = min(distance, house - houses[index - 1])
            }
            radius = max(radius,distance)

        }
        return radius

    }

    func findRadius2(_ houses: [Int], _ heaters: [Int]) -> Int {
        var distances: [Int] = []
        for house in houses {
            var minNum = Double.infinity
            for heater in heaters {
                minNum = min(minNum, Double(abs(heater-house)))
                distances.append(Int(minNum))
            }
        }

        var radius = distances[0]
        for d in distances {
            if d > radius {
                radius = d
            }
        }
        return radius


    }

    func binarySearch(arr: [Int], target: Int)  -> Int {
        var left = 0
        var right = arr.count-1
        while left <= right {
            let mid = left + (right - left) / 2
            if arr[mid] == target {
                return mid
            } else if arr[mid] > target {
                right = mid-1
            } else if arr[mid] < target {
                left = mid+1
            }
        }
        return left
    }

    func maxProfit(_ prices: [Int]) -> Int {

        var left = 1
        var right = left+1
        var maxValue = 0
        var minPrice = 0

        while right < prices.count {
            if prices[left] < prices[right] {
                maxValue = max(maxValue, prices[right] - prices[left])
            } else {
                left = right
            }
            right += 1
        }
        return maxValue
    }


    func pivotIndex(_ nums: [Int]) -> Int {
        var sum = 0
        for num in nums {
            sum += num
        }

        var leftSum = 0
        var rightSum = sum
        for i in 0..<nums.count {
            rightSum -= nums[i]
            if rightSum == leftSum {
                print("right sum\(rightSum)")
                return i
            }
            leftSum += nums[i]

        }
        return -1
    }

    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var isIlands = 0
        var neighBors = 0
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == 1 {
                    isIlands += 1
                    if i < grid.count-1 && grid[i+1][j] == 1 {
                        neighBors += 1
                    }
                    if j < grid[0].count-1 && grid[i][j+1] == 1 {
                        neighBors += 1
                    }

                }

            }
        }
        return isIlands*4 - 2*neighBors
    }
    //MARK: Find Frequent element
    func majorityElement(_ nums: [Int]) -> Int {
        var elements: [Int: Int] = [:]
        var maxCount = 0
        var mostFrequentElement: Int = 0
        for num in nums {
            elements[num,default: 0] += 1
            if let count = elements[num], count > maxCount {
                maxCount = count
                mostFrequentElement = num
            }
        }
        return mostFrequentElement
    }

    func majorityElementArr(_ nums: [Int]) -> [Int] {
        var dict: [Int: Int] = [:]
        var maxValue = 0
        var frequentNum: [Int: Int] = [:]
        for num in nums {
            dict[num, default: 0] += 1
            if let count = dict[num], count > maxValue {
                maxValue = count
                frequentNum[num] = num
            }
        }

        let devided = lround(Double(nums.count/3))
        print("devided \(devided)")
        if frequentNum.keys.count > devided  {
            return nums
        }

        return frequentNum.keys.map {Int($0)}

    }
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dict: [Int: Int] = [:]
        var result: [Int] = []
        for num in nums1 {
            dict[num, default: 0] += 1
        }
        for key in dict.keys {
            print("hello==>",key)
        }
        for num in nums2 {
            if let count = dict[num], count > 0 {
                print("==> count",count)
                //                result.append(num)
                //                dict[num] = count - 1
            }
        }

        return  result
    }


    func containsDuplicate(_ nums: [Int]) -> Bool {

        var dict: [Int: Int] = [:]
        var isDuplicate: Bool = false

        for num in nums {
            if let numdic = dict[num], numdic == num  {
                isDuplicate = true
            }
            dict[num] = num
        }

        return isDuplicate

    }

    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {

        var window = Set<Int> ()
        var L = 0

        for R in 0..<nums.count {

            if R-L > k {
                window.remove(nums[L])
                L += 1
            }

            if window.contains(nums[R]) {
                return true
            }

            window.insert(nums[R])
        }
        return false
    }

    func bestTimeSell(nums: [Int]) -> Int {
        var left = 0
        var right = left+1
        var maxProfit: Int = 0
        while right < nums.count {
            if nums[left] < nums[right] {
                maxProfit = max(maxProfit, nums[right] - nums[left])
            } else {
                left = right
            }
            right += 1
        }
        return maxProfit
    }

    func lengthOfLongestSubstring(_ s: String) -> Int {
        var char = Array(s)
        var start = 0
        var end = 0
        var uniqueChars = Set<Character>()
        var maxLength = 0
        while end < char.count {
            let char = char[end]
            if uniqueChars.contains(char) {
                uniqueChars.remove(char)
                start += 1
            } else {
                uniqueChars.insert(char)
                maxLength = max(maxLength, end - start + 1)
                end += 1

            }
        }
        return maxLength

    }

    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var arr = Array(s)
        var dict: [Character: Int] = [:]
        var left: Int = 0
        var maxF = 0
        var final = 0
        for r in 0..<arr.count {
            dict[arr[r], default: 0] += 1
            maxF = max(maxF,dict[arr[r], default: 0])
            let numsLeft = r-left+1
            while r-left+1 - maxF > k {
                //                print("letter ==>",arr[r])
                dict[arr[r],default: 0] -= 1
                left += 1
            }
            final = max(final, r - left+1)

        }
        return final

    }

    func findAnagrams(_ s: String, _ p: String) -> [Int]  {

        var sArray = Array(s)
        var pArray = Array(p)
        var pFrequecy: [Int] = Array(repeating: 0, count: 26)

        for char in pArray {
            let index = Int(char.asciiValue! - Character("a").asciiValue!)
            pFrequecy[index] += 1
        }

        print("===>",pFrequecy)


        var windowFrequency: [Int] = Array(repeating: 0, count: 26)

        var left = 0
        var right = 0
        var result: [Int] = []

        while right < sArray.count {
            let char = sArray[right]
            let index = Int(char.asciiValue! - Character("a").asciiValue!)
            windowFrequency[index] += 1

            if right - left+1 > pArray.count {
                let leftChar = sArray[left]
                let leftIndex = Int(leftChar.asciiValue! - Character("a").asciiValue!)
                windowFrequency[leftIndex] -= 1
                print("left ==>", left, "right", right)
                left += 1
            }
            if windowFrequency == pFrequecy {
                result.append(left)
            }
            right += 1

        }


        return result

    }

    func maxFrequency(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        nums.sort()

        var left = 0
        var right = 0
        var maxFreq = 0
        var res: Int = 0
        var total = 0

        while right < nums.count {
            total += nums[right]
            while nums[right] * (right - left+1) > total+k {
                total -= nums[left]
                left += 1
            }
            res = max(res,right-left+1)
            right += 1
        }
        return res
    }

    // MARK: 283. Move Zeroes
    /* 283. Move Zeroes
     Step1: iterate through the array
     */
    func moveZeroes(_ nums: inout [Int]) {
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

    }

    //MARK: 283  Another way for this problems


    func moveZeroesTwo(_ nums: inout [Int]) {
        var noneZeroIndex = 0

        for i in 0..<nums.count {
            if nums[i] != 0 {
                nums[noneZeroIndex] = nums[i]
                noneZeroIndex += 1
            }
        }
        print("index ==> \(noneZeroIndex)")
        for i in noneZeroIndex..<nums.count {
            nums[i] = 0
        }
        //        for i in 0..<noneZeroIndex {
        //            nums[i] = 0
        //        }

    }
    //MARK: Todo
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var left = 0
        var count = 0
        var flowerbed = flowerbed
        while left < flowerbed.count {
            if (left == 0 || flowerbed[left-1] == 0) && (left == flowerbed.count-1 || flowerbed[left + 1] == 0) && flowerbed[left] == 0  {
                flowerbed[left] = 1
                count += 1
                if count >= n {
                    return true
                }
            }

            left += 1

        }

        return count >= n

    }

    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dic: [Int: Int] = [:]
        for index in 0..<nums.count {
            if let newIndex = dic[target - nums[index]] {
                return [newIndex, index]
            } else {
                dic[nums[index]] = index

            }
        }
        return []

    }

    func twoSum2(_ numbers: [Int], _ target: Int) -> [Int] {
        var dic: [Int: Int] = [:]

        for index in 0..<numbers.count {
            if let newIndex = dic[target - numbers[index]] {

                return [newIndex+1, index+1]
            } else {
                dic[numbers[index]] = index
            }
        }
        return []
    }

    func fizzBuzz(_ n: Int) -> [String] {

        var arr: [String] = []
        var total: Int = 0
        for num in 1...n {
            print("num ==>",num)
            if  num%3 == 0  && num%5 == 0 {
                arr.append("FizzBuzz")
            } else if num%3 == 0 {
                arr.append("Fizz")
            } else if num%5 == 0 {
                arr.append("Buzz")
            } else {
                arr.append("\(num)")
            }
        }
        return arr
    }


    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []

        // Sort the array in ascending order
        let sortedNums = nums.sorted()

        // Iterate through the array
        for i in 0..<sortedNums.count {

            // Skip duplicate values
            if i > 0 && sortedNums[i] == sortedNums[i-1] {
                continue
            }

            var left = i + 1
            var right = sortedNums.count - 1

            while left < right {
                let sum = sortedNums[i] + sortedNums[left] + sortedNums[right]

                if sum == 0 {
                    result.append([sortedNums[i], sortedNums[left], sortedNums[right]])

                    // Skip duplicate values
                    while left < right && sortedNums[left] == sortedNums[left+1] {
                        left += 1
                    }

                    while left < right && sortedNums[right] == sortedNums[right-1] {
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

    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {

        var closestSum = Int.max
        var minDifference = Int.max

        for i in 0..<nums.count-2 {
            for j in i+1..<nums.count-1 {
                for k in j+1..<nums.count {
                    let currentSum = nums[i] + nums[j] + nums[k]
                    let difference = abs(currentSum-target)
                    if difference < minDifference {
                        minDifference = difference
                        closestSum = currentSum
                    }
                }
            }
        }
        return closestSum
    }
    //MARK:  LeetCode problem 228
    /*

     step 1: sorted array
     step 2: delcare i then interate through nums sorted array
     - declare new j = i+1
     - using loop to incremnent j while j < nums.count && num[j] == nums[i] +j-i
     - if j > i+1 => num[i]->num[j-1]
     - add i position
     return result

     */
    func summaryRanges(_ nums: [Int]) -> [String] {
        var nums = nums.sorted()
        var i = 0
        var results: [String] = []
        while i < nums.count {
            var j = i + 1 // Initialize j inside the loop

            // Update j while elements are consecutive
            while j < nums.count && nums[j] == nums[i] + j - i {
                j += 1
            }

            if j > i + 1 {
                results.append("\(nums[i])->\(nums[j - 1])")
            } else {
                results.append("\(nums[i])")
            }

            i = j // Move i to the next range or single element
        }

        return results
    }
    /*
     twosum by using two pointer
     declare two pointers start from left right start from right
     interate  calculate sum = left + right
     if sum < target => left += 1 else sum > target => right -= 1

     */

    func twoSumTwoPoiter(_ nums: [Int], _ target: Int) -> [Int] {
        var sortedNums = nums.sorted()
        var left = 0
        var right = nums.count-1

        while left < right {
            let sum = sortedNums[left] + sortedNums[right]
            if sum == target {
                return [left+1, right+1]
            } else if sum < target {
                left += 1
            } else {
                right -= 1
            }

        }

        return []
    }
    //MARK: Two pointers
    func twoSumWithoutIndexMap(_ nums: [Int], _ target: Int) -> [Int] {
        var sortedNums = nums.sorted()

        var left = 0
        var right = sortedNums.count - 1

        while left < right {
            let sum = sortedNums[left] + sortedNums[right]
            if sum == target {
                // Find the original indices without a dictionary
                var originalLeft = 0
                while nums[originalLeft] != sortedNums[left] {
                    originalLeft += 1
                }
                // Ensure originalLeft and originalRight are distinct
                var originalRight = 0
                while originalRight == originalLeft || nums[originalRight] != sortedNums[right] {
                    originalRight += 1
                }
                return [originalLeft + 1, originalRight + 1]
            } else if sum < target {
                left += 1
            } else {
                right -= 1
            }
        }

        return []
    }

    // MARK: Frequently element

    func mostFrequentlyAppearingElement(in array: [Int]) -> Int? {
        var countDic: [Int: Int] = [:]

        for element in array {
            if let elementCount = countDic[element] {
                countDic[element] = elementCount + 1
            } else {
                countDic[element] = 1
            }
        }
        var highestCount = 0
        var mostFrequentElement: Int?

        for (element, count) in countDic {
            if count > highestCount {
                highestCount = element
                mostFrequentElement = count
            }
        }

        return mostFrequentElement
    }
    //MARK: 977. Squares of a Sorted Array

    func sortedSquares(_ nums: [Int]) -> [Int] {
        var left = 0
        var right = nums.count-1
        var res: [Int] = []

        while left <= right {
            let leftSquare = nums[left] * nums[left]
            let rightSquare = nums[right] * nums[right]

            if leftSquare < rightSquare {
                res.append(rightSquare)
                right -= 1
            } else {
                res.append(leftSquare)
                left += 1
            }

        }
        return res.reversed()
    }

    //MARK: 11. Container With Most Water
    /*

     */

    func maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count-1
        var maxArea = Int.min
        while left <= right {
            let  minArea = (right - left) * min(height[left], height[right])
            maxArea = max(maxArea, minArea)

            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        return maxArea
    }

    //MARK:  31. Next Permutation

    /*
     Step
     First Finding privot we can start from array - 2 with 3 elements
     Second: we iterate through midle array if array is decending order we will reverse array
     Third: we iterate throungh the last and compare with element loop previously

     */
    func nextPermutation(_ nums: inout [Int]) {
        guard nums.count > 1 else { return }

        var i = nums.count - 2

        while i >= 0 && nums[i] >= nums[i+1] {
            i -= 1
        }

        if i == -1 {
            nums.reverse()
            return
        }

        var j = nums.count - 1
        while j > i && nums[j] <= nums[i] {
            j -= 1
        }

        nums.swapAt(i, j)

        nums[i+1..<nums.count].reverse()

    }

    func permutations(of array: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var a = array
        func generate(_ n: Int) {
            if n == 1 {
                result.append(a)
                return
            }
            for i in 0..<n {
                generate(n - 1)
                if n % 2 == 0 {
                    a.swapAt(i, n - 1)
                } else {
                    a.swapAt(0, n - 1)
                }
            }
        }

        generate(a.count)
        return result
    }

    //MARK: 763. Partition Labels
    /*
     Step 1: iterate through array and with each element we store it inside of dictionary
     Step 2: declare end = 0 and size = 0 , interate through array and increase size and caculate maximum index of element we met during iterate
     Step 3: if the end of element == index interate we reset size.
     */
    func partitionLabels(_ s: String) -> [Int] {

        var lastOccur: [Character: Int] = [:]

        for (i, char) in s.enumerated() {
            lastOccur[char] = i
        }

        var result: [Int] = []
        var start = 0
        var end = 0

        for (i, char) in s.enumerated() {
            end = max(end, lastOccur[char, default: 0])
            if i == end {
                result.append(end - start+1)
                start = i+1
                end = i+1
            }

        }

        return result
    }
    //MARK: 75. Sort Colors
    func sortColors(_ nums: inout [Int]) {
        //        for i in 0..<nums.count {
        //            for j in i+1..<nums.count {
        //                if nums[j] < nums[i] {
        //                    let temp = nums[j]
        //                    nums[j] = nums[i]
        //                    nums[i] = temp
        //                }
        //            }
        //        }

    }
    //MARK: 206. Reverse Linked List

    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var current = head
        while current != nil {
            let next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        return prev
    }

    //MARK: 234. Palindrome Linked List

    /*
     Step1: initialize array
     Step2: iterate through the node until nod equal nil then add val into array
     Step3: interate through the node untl node equal nil check the val equal value pop from stack or not
     - equal return true else return flase
     */

    func isPalindrome(_ head: ListNode?) -> Bool {
        var stack: [Int] = []
        var current: ListNode? = head
        while current != nil {
            stack.append(current!.val)
            current = current?.next
        }
        current = head
        while current != nil {
            if current?.val != stack.popLast() {
                return false
            }
            current = current?.next
        }
        return true
    }

    func findMiddleNode(_ head: ListNode?) -> ListNode? {
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

    func getMiddle(_ head: ListNode?) -> Int {
        guard let head = head else { return 0 }
        var counter = 1
        var current = head
        var mid = head
        var slow = head
        var fast = head
        while fast != nil && fast.next != nil {
            fast = (fast.next?.next!)!
            slow = slow.next!
        }

        //        while current.next != nil {
        //            if counter % 2 == 0 {
        //                mid = mid.next!
        //            }
        //            current = current.next!
        //            counter += 1
        //        }
        return slow.val
    }

    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var leftNode: ListNode? = ListNode(0)
        var rightNode: ListNode? = ListNode(0)

        var ltail = leftNode
        var rtail = rightNode
        var currentNode = head

        while currentNode != nil {
            if currentNode!.val < x {
                ltail?.next = currentNode
                ltail = ltail?.next
            } else {
                rtail?.next = currentNode
                rtail = rtail?.next
            }
            currentNode = currentNode?.next
        }
        print("====>", rightNode, "==>", ltail?.next)
        // Connect the two partitions
        rtail?.next = nil // Ensure the end of the right partition is nil
        ltail?.next = rightNode?.next // Connect the end of the left partition to the start of the right partition
        print("====>", rightNode, "==>", ltail?.next!)
        print("leftNode ===>",leftNode?.next!)
        print("head ===>",head)

        return leftNode?.next
    }

    //MARK: 387. First Unique Character in a String
    /*

     Step1 create an dic to store character and int
     Step2 iterate through arr string
     -  if str contain dic = 1
     -   else dic += 1
     Step3: iterate through arr string
     - if dic == 1 return inđex
     - else return - 1
     */
    func firstUniqChar(_ s: String) -> Int {
        var arrStr = Array(s)
        var mapFeq: [Character: Int] = [:]

        for str in arrStr {
            if mapFeq[str] != nil {
                mapFeq[str]! += 1
            } else {
                mapFeq[str] = 1
            }
        }

        for (i, char) in arrStr.enumerated() {
            if mapFeq[char] == 1 {
                return i
            }
        }

        return -1
    }
    /*
     Step Interate through array
     */

    func findWords(_ words: [String]) -> [String] {
        var worlsResult: [String] = []

        let row1: Set<Character> = Set("qwertyuiop")
        let row2: Set<Character> = Set("asdfghjkl")
        let row3: Set<Character> = Set("zxcvbnm")


        for world in words {
            let wordLow = world.lowercased()
            let characters = Set(wordLow)

            if characters.isSubset(of: row1) || characters.isSubset(of: row2) || characters.isSubset(of: row3) {
                worlsResult.append(world)
            }


        }

        return worlsResult

    }
    //MARK: 125. Valid Palindrome
    func isPalindrome(_ s: String) -> Bool {
        let cleandedString = s.lowercased().filter { $0.isLetter || $0.isNumber}
        return cleandedString == String(cleandedString.reversed())
    }
    //MARK: 680. Valid Palindrome II
    func validPalindrome(_ s: String) -> Bool {

        func isPalindome(str: String, start: String.Index, end: String.Index) -> Bool {
            var left = start, right = end

            while left < right {
                if str[left] != str[right] {
                    return false
                }
                left = str.index(after: left)
                right = str.index(before: right)
            }
            return true
        }
        var left = s.startIndex
        var right = s.index(before: s.endIndex)
        while left < right {
            if s[left] != s[right] {
                if isPalindome(str: s, start: s.index(after: left), end: right) {
                    return true
                }

                if isPalindome(str: s, start: left, end: s.index(before: right)) {
                    return true
                }
                return false
            }

            left = s.index(after: left)
            right = s.index(before: right)
        }

        return true
    }
    /*
     Step1: Get the first character of world, delare countCapital
     Step2: interate through worls if world met uppercaser
     - if all char is uppercase or the first char is uppercase and the rest are lowcase or if there are no uppercase char
     */
    func detectCapitalUse(_ word: String) -> Bool {
        guard !word.isEmpty else { return false }
        var countCapital = 0
        let firstChar = word.first!

        for char in word {
            if char.isUppercase {
                countCapital += 1
            }
        }

        if countCapital == word.count || (countCapital == 1 && firstChar.isUppercase) || countCapital == 0 {
            return true
        } else {
            return false
        }
    }

    func countAndSay(_ n: Int) -> String {
        if n == 1 {
            return "1"
        }

        var result = "1"

        for _ in 2...n {
            var currentTerm = ""
            var count = 1
            var characters = Array(result)

            for i in 0..<characters.count {
                if i+1 < characters.count && characters[i] == characters[i+1] {
                    count += 1
                } else {
                    currentTerm += "\(count)\(characters[i])"
                    count = 1
                }
            }
            result = currentTerm

        }
        return result

    }
    //MARK: 344. Reverse String

    func reverseString(_ s: inout [Character]) {
        var reversedString = ""
        for char in s {
            reversedString = String(char) + reversedString
        }
        s = Array(reversedString)
    }
    //MARK: 541. Reverse String II
    func reverseStr(_ s: String, _ k: Int) -> String {
        var arrStr = Array(s)

        for i in stride(from: 0, to: s.count, by: 2*k) {
            var start = i
            var end = min(i+k-1,s.count - 1)
            while start < end {
                let temp = arrStr[start]
                arrStr[start] = arrStr[end]
                arrStr[end] = temp
                start += 1
                end -= 1
            }
        }
        return String(arrStr)
    }


    func swapPairs(_ head: ListNode?) -> ListNode? {
        var dumy = ListNode(0)
        dumy.next = head
        var current = head
        var prev = dumy

        while let node1 = current, let node2 = current?.next {
            prev.next = node2
            node1.next = node2.next
            node2.next = node1

            // Move prev and current pointers forward for next iterationâq
            prev = node1
            current = node1.next
        }
        return dumy.next

    }

    func deleteNode(_ node: ListNode?) {
        guard let node = node, let nextNode = node.next else {
            return
        }
        node.val = nextNode.val
        node.next = nextNode.next
    }

    func deleteDuplicates(_ head: ListNode?) -> ListNode? {

        var current = head
        while current != nil, current?.next != nil {
            if current?.val == current?.next?.val {
                current?.next = current?.next?.next
            } else {
                current = current?.next
            }
        }
        return head

    }

    func deleteDuplicatesTwo(_ head: ListNode?) -> ListNode? {

        var dict: [Int: Int] = [:]
        var dummy = ListNode(0)
        dummy.next = head
        var current = head
        var previous = dummy

        while current != nil {
            dict[current?.val ?? 0, default: 0] += 1
            current = current?.next
        }
        current = head

        while current != nil {
            if let count = dict[current?.val ?? 0], count > 1 {
                previous.next = current?.next
            } else {
                previous = current!
            }
            current = current?.next
        }

        return dummy.next
    }
    //MARK: 19. Remove Nth Node From End of List
    func removeNthFromEnd(
        _ head: ListNode?,
        _ n: Int
    ) -> ListNode? {

        let dummyNode = ListNode(0)
        dummyNode.next = head

        var fast: ListNode = dummyNode
        var slow: ListNode = dummyNode

        for _ in 0..<n {
            fast = fast.next!
        }

        while fast.next != nil {
            print("slow pointer \(String(describing: slow.next))") /*3 -> 4 -> 5*/
            print("fast pointer \(String(describing: fast.next))") /*5*/

            fast = fast.next!
            slow = slow.next!
        }

        slow.next = slow.next?.next
        print("==> \(String(describing: slow.next)) ===> \(String(describing: slow.next?.next))")

        return dummyNode.next
    }


    /*
     if let node1 = list1Pointer, let node2 = list2Pointer {
     if node1.val <= node2.val {
     node1.next = mergeTwoLists(node1.next, node2)
     return node1
     } else {
     node2.next = mergeTwoLists(node1, node2.next)
     return node2
     }
     }
     */
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {

        var listNode1 = list1
        var listNode2 = list2
        if list1 != nil {
            return list2
        }

        if list2 != nil {
            return list2
        }

        if let node1 = listNode1, let node2 = listNode2 {
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

    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard head != nil else {
            return nil
        }

        var dummyNode = ListNode(0)
        dummyNode.next = head

        var current = head
        var prev = dummyNode

        while current != nil {
            if current?.val == val {
                prev.next = current?.next
            } else {
                prev = current!
            }
            current = current?.next
        }
        return dummyNode.next

    }

    func isIsomorphic(
        _ s: String,
        _ t: String
    ) -> Bool {

        guard s.count == t.count else { return false }
        var sToTMap = [Character: Character]()
        var tToSMap = [Character: Character]()

        for (sChar, tChar) in zip(s, t) {

            if let mappedTChar = sToTMap[sChar] {
                if mappedTChar != tChar {
                    return false
                }
            } else {
                sToTMap[sChar] = tChar
            }

            if let mappedSChar = tToSMap[tChar] {
                if mappedSChar != sChar {
                    return false
                }

            } else {
                tToSMap[tChar] = sChar
            }
        }
        return true

    }
    // TODO: don't quite understand
    func oddEvenList(_ head: ListNode?) -> ListNode? {

        let oddDummy = ListNode(0)
        let evenDummy = ListNode(0)

        var odd = oddDummy
        var even = evenDummy
        var isOdd: Bool = true
        var current = head

        while current != nil {
            if isOdd {
                odd.next = current
                odd = odd.next!
            } else {
                even.next = current
                even = even.next!
            }
            isOdd.toggle()
            current = current?.next
        }
        odd.next = evenDummy.next
        even.next = nil
        return oddDummy.next
    }
    //MARK: 61. Rotate List
    //Input: head = [1,2,3,4,5], k = 2
    //Output: [4,5,1,2,3]
    func rotateRight(
        _ head: ListNode?,
        _ k: Int
    ) -> ListNode? {

        var leght = 1
        var tail = head

        while tail?.next != nil {
            tail = tail?.next
            leght += 1
        }

        // Step 2: Make the list circular

        tail?.next = head


        print("\(String(describing: tail?.next?.val)) ===> \(String(describing: tail?.val))")
        // Step 3: Find the new tail (length - k % length - 1) and new head (length - k % length)

        let stepToNewHead = leght - k % leght // = 3

        var newTail = head
        for _ in 0..<stepToNewHead - 1 {
            newTail = newTail?.next
        }
        let newHead = newTail?.next
        print("===> \(String(describing: newTail?.next?.val)) ===> \(newTail?.val)")

        // Step 4: Break the circle
        newTail?.next = nil
        return newHead
    }

    func reorderList(_ head: ListNode?) {

        var fast: ListNode = head!
        var slow: ListNode = head!
        // find the midle of the list
        while fast.next != nil && fast.next?.next != nil {
            slow = slow.next!
            fast = (fast.next?.next!)!
        }
        //       Reverse the second half of the list
        var current = slow.next
        var prev: ListNode? = nil
        while current != nil {
            let nextTemp = current?.next
            current?.next = prev
            prev = current
            current = nextTemp
        }
        slow.next = nil

        var first = head
        var second = prev

        // merger two half of list
        while second != nil {
            let temp1 = first?.next
            let temp2 = second?.next
            first?.next = second
            second?.next = temp1
            first = temp1
            second = temp2
        }


    }
    //MARK: 101. Symmetric Tree
    func isSymmetric(_ root: TreeNode<Int>?) -> Bool {

        guard let root = root else { return true }
        var queue:[(TreeNode<Int>?, TreeNode<Int>?)] = [(root.left, root.right )]

        while !queue.isEmpty {
            let (left, right) = queue.removeFirst()

            if left == nil && right == nil {
                continue
            }

            if left == nil || right == nil {
                return false
            }

            guard let leftNode = left, let rightNode = right, leftNode.val == rightNode.val else {
                return false
            }

            queue.append(
                (
                    leftNode.left,
                    rightNode.right
                )
            )

            queue.append(
                (
                    leftNode.right,
                    rightNode.left
                )
            )

        }

        return true

    }

    func mirror(node: TreeNode<Int>?) -> TreeNode<Int>? {

        guard let node = node else {
            return nil
        }
        let left = mirror(node: node.left)
        let right = mirror(node: node.right)

        node.left = right
        node.right = left
        return node
    }

    //    func invertTree(_ root: TreeNode<Int>?) -> TreeNode<Int>? {
    //        guard let root = root else { return nil}
    //        var queue = Queue()
    //        queue.enqueue(root)
    //        while !queue.isEmpty {
    //            let currentNode = queue.dequeue()
    //            swap(&currentNode.left, &currentNode.right)
    //            if let leftChild = currentNode?.left {
    //                queue.enqueue(leftChild)
    //            }
    //
    //            if let rightChild = currentNode?.right {
    //                queue.enqueue(rightChild)
    //            }
    //        }
    //
    //        return root
    //    }



    func inOrder(node: TreeNode<Int>?) {
        guard let node = node else {
            return
        }

        inOrder(node: node.left)

        print("\(node.val)")
        inOrder(node: node.right)

    }

    func removeNode(
        _ node: TreeNode<Int>?,
        value: Int
    ) -> TreeNode<Int>? {
        guard let node = node else { return nil }

        if value < node.val {
            node.left = removeNode(
                node.left,
                value: value
            )
        } else if value > node.val  {
            node.right = removeNode(
                node.right,
                value: value
            )
        } else {
            if node.left == nil && node.right == nil {
                return nil // Simply remove the node
            }

            // Case 2: Node has only one child
            if node.left == nil {
                return node.right
            } else if node.right == nil {
                return node.left
            }

            if let minValueNode = minValueNode(node.right) {
                node.val = minValueNode.val
                node.right = removeNode(
                    node.right,
                    value: minValueNode.val
                )
            }
        }
        return node
    }

    // Helper function to find the node with the minimum value in a subtree
    private func minValueNode(_ node: TreeNode<Int>?) -> TreeNode<Int>? {
        var current = node
        while let next = current?.left {
            current = next
        }
        return current
    }

    func upsideDownBinaryTree(_ root: TreeNode<Int>?) -> TreeNode<Int>? {
        guard let root = root else { return nil }
        guard let left = root.left else { return root }
        let newRoot = upsideDownBinaryTree(left)
        left.left = root.right
        left.right = root

        root.left = nil
        root.right = nil
        return newRoot

    }
    
    //MARK: 111. Minimum Depth of Binary Tree
    func minDepth(_ root: TreeNode<Int>?) -> Int {
        guard let root = root else { return 0}
        if root.left == nil  && root.right == nil {
            return 1
        }
        if root.left == nil {
            return minDepth(root.right)+1
        }
        if root.right == nil {
            return minDepth(root.left)+1
        }
        return min(minDepth(root.left), minDepth(root.right)) + 1
    }

    func maxDepth(_ root: TreeNode<Int>?) -> Int {

        guard let root = root else { return 0}
        if root.left == nil  && root.right == nil {
            return 1
        }
        if root.left == nil {
            return maxDepth(root.right)+1
        }
        if root.right == nil {
            return maxDepth(root.left)+1
        }
        return max(maxDepth(root.left), maxDepth(root.right)) + 1
    }

    func diameterOfBinaryTree(_ root: TreeNode<Int>?) -> Int {
        var diameter = 0
        guard let root = root else { return 0}
        func height(_ node: TreeNode<Int>?) -> Int {
            guard let node = node else { return 0 }

            let leftHeight = height(node.left)
            let rightHeight = height(node.right)

            diameter = max(diameter, leftHeight + rightHeight)
            return max(leftHeight, rightHeight)+1
        }
        height(root)
        return diameter
    }

    func findCircleNum(_ isConnected: [[Int]]) -> Int {

        return 0
    }
    //    [2,4,-2,-3]
    //    nums[i] < nums[j] < nums[k]
    func increasingTriplet(_ nums: [Int]) -> Bool {
        if nums.count < 3 {
            return false
        }

        var first = Int.max
        var second = Int.max


        for num in nums {
            if num <= first {
                first = num
            } else if num <= second {
                second = num
            } else {
                return true
            }
        }
        return false
    }

    //    func calculateDistance(_ p1: [Int], _ p2: [Int]) -> Int {
    //        // Calculate Euclidean distance between two points
    //        let dx = p2[0] - p1[0]
    //        let dy = p2[1] - p1[1]
    //        return dx * dx + dy * dy
    //    }
    func squareDistance(p1: [Int], _ p2: [Int]) -> Int {
        let dx = p2[0] - p1[0]
        let dy = p2[1] - p1[1]
        return dx*dx+dy*dy
    }


    //MARK: 447. Number of Boomerangs
    /*
     Step1: Iterate through each points as the central point i
     Step2: Initialize a hash map to track how many times each squared distance appears.
     Step3: Iterate through array to calculate distance
     Step4: Calculate boomerangs base distance count we stored in hashmap
     */
    func numberOfBoomerangs(_ points: [[Int]]) -> Int {
        var totalBoomerang: Int = 0

        for i in 0..<points.count {
            var distanceMap: [Int: Int] = [:]
            for j in 0..<points.count {
                if i != j {
                    let distance = squareDistance(
                        p1: points[i],
                        points[j]
                    )
                    distanceMap[
                        distance,
                        default: 0
                    ] += 1
                }
            }

            for count in distanceMap.values {
                print("count ==> \(count)")
                if count > 1 {
                    totalBoomerang += count*(count-1)
                }
            }
        }


        return totalBoomerang
    }
    //MARK: 228 Summary Rages

    func summaryRanges2(_ nums: [Int]) -> [String] {

        var results: [String] = []
        if nums.isEmpty {
            return results
        }
        var start = nums.first!
        var end = nums.first!
        for i in 1..<nums.count {
            if nums[i] == (end)+1 {
                end = nums[i]
            } else {
                if start == end {
                    results.append("\(start)")
                } else {
                    results.append("\(start)->\(end)")
                }
                // Start a new range
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


    func maxDistToClosest(_ seats: [Int]) -> Int {

        var indicesOfOnes: [Int] = []
        for (index, value) in seats.enumerated() {
            if value == 1 {
                indicesOfOnes.append(index)
            }
        }

        // Handle the edge cases when there are less than 2 occupied seats
        if indicesOfOnes.isEmpty {
            return seats.count
        } else if indicesOfOnes.count == 1 {
            let singleIndex = indicesOfOnes[0]
            return max(
                singleIndex,
                seats.count - singleIndex - 1
            )
        }

        var maxDistance = 0

        // Distance from the start to the first occupied seat
        maxDistance = indicesOfOnes[0]

        // Distance between occupied seats
        for i in 1..<indicesOfOnes.count {
            let distance = (indicesOfOnes[i] - indicesOfOnes[i - 1] - 1) / 2 // Calculating the gap between the previous and the current one
            maxDistance = max(maxDistance, distance)
        }

        // Distance from the last occupied seat to the end
        maxDistance = max(maxDistance, seats.count - indicesOfOnes.last! - 1)

        return maxDistance

    }

    func distributeCandies(_ candyType: [Int]) -> Int {
        let numb = candyType.count/2
        let unique = Set(candyType).count
        let min = min(unique, numb)
        return min
    }

    func canJump(_ nums: [Int]) -> Bool {
        var maxReach = 0

        for i in 0..<nums.count {
            if i > maxReach {
                return false
            }
            maxReach = max(maxReach, i+nums[i])
        }
        return true
    }


    //
    //    func printDiagonals(matrix: [[Int]]) {
    //        let n = matrix.count
    //        guard n > 0 else { return }
    //
    //        // Main diagonal
    //
    //        var mainDiagonal: Int =  0
    //        for i in 0..<n {
    //            mainDiagonal += matrix[i][i]
    //        }
    //
    //        // Secondary diagonal
    //        var secondaryDiagonal: Int = 0
    //        for i in 0..<n {
    //            secondaryDiagonal += matrix[i][n-i-1]
    //        }
    //        let sum = abs(mainDiagonal - secondaryDiagonal)
    //
    //        return sum
    //    }
    //MARK: Hacker Rank
    func staircase(n: Int) -> Void {

        for i in 1...n {
            // Print (n - i) spaces
            let spaces = String(repeating: " ", count: n - i)
            // Print (i) hashes
            let hashes = String(repeating: "#", count: i)
            // Print the line
            print(spaces + hashes)
        }
        // Write your code here

    }

    func miniMaxSum(arr: [Int]) -> Void {
        // Write your code here
        var sumMin: Int = 0
        for i in 0..<arr.count-1 {
            sumMin += arr[i]
        }
        var sumMax: Int = 0
        for j in 1..<arr.count {
            sumMax += arr[j]
        }

        print("\(sumMin) \(sumMax)")

    }

    func birthdayCakeCandles(candles: [Int]) -> Int {
        // Write your code here
        var countMax = 0
        var numMax = 0
        for num in candles {
            if num > numMax {
                numMax = max(numMax, num)
                countMax = 1

            } else if num == numMax {
                countMax += 1
            }
        }
        return countMax
    }

    func timeConversion(s: String) -> String {
        // Write your code here

        let dateFormatter12 = DateFormatter()
        dateFormatter12.dateFormat = "hh:mm:ssa"
        dateFormatter12.amSymbol = "AM"
        dateFormatter12.pmSymbol = "PM"

        // Parse the 12-hour format time string to a Date object
        guard let date = dateFormatter12.date(from: s) else {
            return ""
        }

        // Create a DateFormatter for formatting the date object into the 24-hour format
        let dateFormatter24 = DateFormatter()
        dateFormatter24.dateFormat = "HH:mm:ss"

        // Format the date object into a 24-hour format time string
        let time24 = dateFormatter24.string(from: date)

        return time24

    }

    func gradingStudents(grades: [Int]) -> [Int] {
        // Write your code here
        var rounded_grades: [Int] = []
        for grade in grades {
            if grade >= 38 {
                let nextMutipleOf5 = ((grade/5)+1)*5

                if nextMutipleOf5 - grade < 3 {
                    rounded_grades.append(nextMutipleOf5)
                } else {
                    rounded_grades.append(grade)
                }
            } else {
                rounded_grades.append(grade)
            }
        }
        return rounded_grades
    }

    func countApplesAndOranges(
        s: Int,
        t: Int,
        a: Int,
        b: Int,
        apples: [Int],
        oranges: [Int]
    ) -> Void {
        // Write your code here

        let newApple = apples.map { $0+a}
        let newOranges = oranges.map { $0+b }

        let appleOnHouse = newApple.filter { $0 >= s && $0 <= t }.count

        let orangesOnHouse = newApple.filter { $0 >= s && $0 <= t }.count


        //        var appleArray: [Int]  = []
        //        var appleCount: Int = 0
        //        var orangesCount: Int = 0
        //        for element in newApple {
        //            let position = a+element
        //            if position >= s && position <= t {
        //                appleCount += 1
        //            }
        //        }
        //
        //        for element in newOranges {
        //            if element >= s && element <= t {
        //                orranges.append(element)
        //            }
        //        }

        //        print("\(appleArray.count) \(orranges.count)")
    }

    func kangaroo(
        x1: Int,
        v1: Int,
        x2: Int,
        v2: Int
    ) -> String {

        let n = Double(x2 - x1) / Double(v1 - v2)

        if n >= 0 && n == floor(n) {
            return "YES"
        }
        return "NO"
    }

    func breakingRecords(scores: [Int]) -> [Int] {
        // Write your code here
        var scoresStore: [Int] = []
        var highest = scores[0]
        var lowest = scores[0]
        var highestCount = 0
        var lowestCount = 0

        for i in 0..<scores.count {
            if scores[i] > highest {
                highestCount += 1
                highest = scores[i]
            } else if scores[i] < lowest {
                lowestCount += 1
                lowest = scores[i]
            }
        }
        scoresStore = [highestCount, lowestCount]

        return scoresStore
    }

    func birthday(s: [Int], d: Int, m: Int) -> Int {
        // Write your code here
        var count  = 0
        for i in 0..<s.count - m {
            let segment = s[i..<(i + m)]
            let sum = segment.reduce(0,+)
            if sum == d {
                count += 1
            }
        }

        return count

    }

    func divisibleSumPairs(n: Int, k: Int, ar: [Int]) -> Int {
        // Write your code here
        var count = 0

        for i in 0..<n {
            for j in i+1..<n {
                print("==> \(ar[i]) \(ar[j])")
                if (ar[i] + ar[j] % k == 0) {
                    count += 1
                    print("wth -->")
                }
            }
        }

        return count

    }

    func migratoryBirds(arr: [Int]) -> Int {
        // Write your code here
        var hashMap = [Int: Int] ()
        for num in arr {
            hashMap[num, default: 0] += 1
        }

        let maxValue = hashMap.values.max()!

        let mostFrequent = hashMap.filter { $0.value == maxValue }.map { $0.key }.first ?? 0

        return mostFrequent

    }

    func dayOfProgrammer(year: Int) -> String {
        // Write your code here

        return ""

    }

    func bonAppetit(bill: [Int], k: Int, b: Int) -> Void {
        var newBill = bill
        newBill.remove(at: k) // Remove the element at index k

        let annaShare = newBill.reduce(0, +)/2

        if b == annaShare {
            print("Bon Appetit")
        } else {
            let overchargedAmount = b - annaShare
            print(overchargedAmount)
        }
    }

    //MARK: TODO
    func GetRejectedRequests(requests: [String], limit_per_second: Int) -> [Int] {
        var rejectedRequests = [Int]()
        var requestCount = [String: [Int: Int]]() // Dictionary to store IP and (second: count)

        for request in requests {
            let parts = request.split(separator: " ").map { String($0) }
            let requestId = Int(parts[0])!
            let ipAddress = parts[1]
            let timestamp = Int(parts[2])!

            let second = timestamp / 1000 // Convert milliseconds to seconds

            if requestCount[ipAddress] == nil {
                requestCount[ipAddress] = [Int: Int]()
            }

            let currentCount = requestCount[ipAddress]![second] ?? 0
            if currentCount < limit_per_second {
                requestCount[ipAddress]![second] = currentCount + 1
            } else {
                rejectedRequests.append(requestId)
            }
        }

        return rejectedRequests
    }


    func sockMerchant(n: Int, ar: [Int]) -> Int {
        // Write your code here
        var count = 0
        var hashMap: [Int: Int] = [:]
        for el in ar {
            if let value = hashMap[el] {
                hashMap[el] = value + 1
            } else {
                hashMap[el] = 1
            }

        }

        for value in hashMap.values {

            print("value \(value)", value/2, count)
            count += value/2
        }
        return count
    }

    func pageCount(n: Int, p: Int) -> Int {
        // Write your code here
        var forntTurns = p/2
        var backTurns = (n/2) - (p/2)
        return min(forntTurns,backTurns)

    }

    func permute(_ s: String) -> [String] {
        if s.count <= 1 {
            return [s]
        }

        return s.enumerated().flatMap { (i, char) -> [String] in
            var remaining = s
            remaining.remove(at: s.index(s.startIndex, offsetBy: i))
            return permute(remaining).map { String(char) + $0 }
        }
    }

    //MARK: 1248. Count Number of Nice Subarrays

    public func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
        var left = 0
        var right = 0
        var oldCount = 0
        var result = 0
        var count = 0

        while right < nums.count {

            if nums[right]%2 != 0 {
                oldCount += 1
                count = 0
            }

            while oldCount == k {
                if nums[left]%2 != 0 {
                    oldCount -= 1
                }
                left += 1
                count += 1
            }

            result += count
            right += 1
        }

        return result

    }

    //MARK: 2461. Maximum Sum of Distinct Subarrays With Length K
    public func maximumSubarraySum(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count >= k else { return 0 } // Edge case: if array length is less than k

        var maxSum = 0
        var windowSum = 0

        // Calculate the sum of the first window
          for i in 0..<k {
              windowSum += nums[i]
          }

          // Initialize maxSum with the sum of the first window
          maxSum = windowSum
          // Slide the window from the start to the end of the array
          for i in k..<nums.count {
              windowSum += nums[i] - nums[i - k] // Slide the window by adding the new element and removing the old element
              maxSum = max(maxSum, windowSum)    // Update maxSum if the new windowSum is greater
          }

          return maxSum
    }
    //MARK:  14. Longest Common Prefix
    public func longestCommonPrefix(_ strs: [String]) -> String {

        let firstStr = strs[0]

        for i in 0..<firstStr.count {
            let index = firstStr.index(firstStr.startIndex, offsetBy: i)
            let char = firstStr[index]
//            print("char ", char)

            for str in strs {
                if i >= strs.count {
                    let index = str[str.index(str.startIndex, offsetBy: i)]
                    print("char", index)
                }
//                let char = strs[index]
            }
        }
        return firstStr
    }


    // Expected output: [4]
    //MARK: 12. Integer to Roman
    public func intToRoman(_ num: Int) -> String {

        // Define a dictionary with integer values as keys and their corresponding Roman numeral symbols as values.
        let valueToSymbol: [Int: String] = [
            1000: "M", 900: "CM", 500: "D", 400: "CD",
            100: "C", 90: "XC", 50: "L", 40: "XL",
            10: "X", 9: "IX", 5: "V", 4: "IV", 1: "I"
        ]
        var number = num
        var result = ""

        for value in valueToSymbol.keys.sorted(by: >) {
            while number >= value {
                print("value==> \(value)")
                result += valueToSymbol[value]!
                number -= value
            }
        }

        return result
    }

   public func search(_ nums: [Int], _ target: Int) -> Int {

       var left = 0
       var right = nums.count - 1
       while left < right {

           let mid = left + (left+right)/2

           if nums[mid] == target {
               return mid
           }

           if nums[left] <= nums[mid] {
               if nums[left] <=  target, target < nums[mid]  { // if the value contain with this rage
                    right = mid - 1
               } else { // if the value
                   left = mid + 1
               }
           } else {

               if nums[mid] < target && target <= nums[right]{
                   left = mid + 1
               } else {
                   right = mid-1
               }
           }

       }
       return -1
    }


    //MARK: 268. Missing Number
    public func missingNumber(_ nums: [Int]) -> Int {

        var res = nums.count

        for i in 0..<nums.count {
            res += (i-nums[i])
        }

        return res

    }
    public func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        func canShip(capacity: Int)  -> Bool{
            var dayNeeded = 1
            var currentCapacity = 0
            for weight in weights {
                if currentCapacity+weight > capacity {
                    dayNeeded += 1
                    currentCapacity = 0
                }
                currentCapacity += weight
            }
            return dayNeeded <= days
        }

        var left = weights.max(by: <)!
        var right = weights.reduce(0, +)
        while left < right {
            let mid = (right+left)/2
            if canShip(capacity: mid) {
                right = mid
            } else {
                left = mid+1
            }
        }

        return left

    }

    public func countElements(_ nums: [Int]) -> Int {

        let uniqueNum = Set(nums)

        let minValue = uniqueNum.min()!
        let maxValue = uniqueNum.max()!

        var count = 0
        for num in uniqueNum {
            if num > minValue && num < maxValue {
                count += 1
            }
        }

        return count
    }

    public func hasCycle(_ head: ListNode?) -> Bool {

        var slow = head
        var fast = head

        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next

            if slow === fast {
                return true
            }
        }
        return false
    }

    //MARK: Tree


    public func minDiffInBST(_ root: TreeNode<Int>?) -> Int {
        var prev: Int? = nil
        var minDiff: Int = Int.max
        func inOrderTraversal(_ node: TreeNode<Int>?) {
            guard let node = node else { return }
            inOrderTraversal(node.left)

            if let prevVal = prev {
                minDiff = min(minDiff, node.val - (prev ?? 0))
            }
            prev = node.val
            inOrderTraversal(node.right)

        }
        inOrderTraversal(root)
        return minDiff
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

        while !stack.isEmpty && currentNode != nil {
            while currentNode != nil {
                stack.append(currentNode!)
                currentNode = currentNode?.left
            }
            currentNode = stack.removeLast()

            print("value visited",currentNode?.val)
            currentNode = currentNode?.right
        }
    }

    public func postorder(_ root: Node?) -> [Int] {

        var result: [Int] = []

        func traversal(_ root: Node?) {
            guard let node = root else { return }
            for element in node.children {
                traversal(element)
            }
            result.append(root!.val)
        }
        traversal(root)
        return result
    }
    //MARK: 100. Same Tree
    public func isSameTree(_ p: TreeNode<Int>?, _ q: TreeNode<Int>?) -> Bool {

        if p == nil && q == nil {
            return true
        }

        if p == nil || q == nil {
            return false
        }
        if p?.val != q?.val {
            return false
        }

        return isSameTree(p?.left, q?.left ) && isSameTree(p?.right, q?.right)

       }
    func invertTree(_ root: TreeNode<Int>?) -> TreeNode<Int>? {

        guard let root = root else { return nil}

        let temp = root.left
        root.left = root.right
        root.right = temp
        invertTree(root.left)
        invertTree(root.right)
        return root
    }

    public func levelOrder(_ root: TreeNode<Int>?) -> [[Int]] {

        var results: [[Int]] = [[]]

        func traversal(root: TreeNode<Int>?, level: Int) {

            guard let root = root else { return }
            if results.count == level {
                results.append([])
            }

            results[level].append(root.val)

            traversal(root: root.left, level: level + 1)
            traversal(root: root.right, level: level + 1)
        }
        traversal(root: root, level: 0)
        return results
       }

    
    //MARK: Ending



}




public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}

// Helper function to insert a new node in the BST
func insertNode(_ root: TreeNode<Int>?, value: Int) -> TreeNode<Int>? {
    guard let root = root else {
        return TreeNode(value: value)
    }
    if value < root.val {
        root.left = insertNode(root.left, value: value)
    } else {
        root.right = insertNode(root.right, value: value)
    }
    return root
}

func inOrderTraversal(_ root: TreeNode<Int>?) {
    guard let root = root else { return }
    inOrderTraversal(root.left)
    print("===> \(root.val)")
    inOrderTraversal(root.right)
}

func preOrderTraversal(_ root: TreeNode<Int>?) {
    guard let root = root else { return }
    preOrderTraversal(root.left)
    preOrderTraversal(root.right)
}

func inOrderTraversalIterative(_ root: TreeNode<Int>?) {
    var stack: [TreeNode<Int>?] = []
    var currentNode = root
    while  currentNode != nil || !stack.isEmpty {
        while currentNode != nil {
            stack.append(currentNode)
            currentNode = currentNode?.left
        }
        currentNode = stack.removeLast()
        print(currentNode?.val)
        currentNode  = currentNode?.right
    }
}
