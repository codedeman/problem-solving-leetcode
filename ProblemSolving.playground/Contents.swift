import UIKit



class Solution {

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

    func isValid(_ s: String) -> Bool {
        let charMap: [Character: Character] = ["}":"{",
                                               ")":"(",
                                               "]":"[",

        ]

        var stack = [Character]()

        for letter in s {
            if let str = charMap[letter] {
                stack.append(str)
            } else {
                if let pop = stack.popLast(), letter == charMap[pop] {
                    stack.popLast()
                } else {
                    return false
                }
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
    //

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



}


let solution = Solution()
solution.maxArea([1,8,6,2,5,4,8,3,7])
solution.permutations(of: [1,2,3])
var arr = [2,0,2,1,1,0]
solution.nextPermutation(&arr)
solution.partitionLabels("ababcbacadefegdehijhklij")
let str = "ababcbaca"
print("==>", str.count)

public class ListNode {
    public var val: Int
    public var next: ListNode?

    public init() {
        self.val = 0
        self.next = nil
    }

    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }

    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }


}
extension ListNode: CustomStringConvertible {
    public var description: String {
       guard let next = next else {
         return "\(val)"
       }
       return "\(val) -> " + String(describing: next) + " "
     }
}

public struct LinkedList {

    var head: ListNode?
    var tail: ListNode?

    public var isEmpty: Bool {
        head == nil
    }

    public mutating func push(_ value: Int) {
        head = ListNode(value)
        if tail == nil {
            tail = head
        }
    }

    public mutating func reverseList() {
       head = recusiveHelper(head)
    }

    private mutating func recusiveHelper(_ node: ListNode?) -> ListNode? {
        guard let currentNode = head else { return nil }

        if currentNode.next == nil {
            head = currentNode
            return currentNode
        }

        let reverList = recusiveHelper(currentNode.next)
        currentNode.next = currentNode
        currentNode.next = nil
        return reverList


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


    mutating func sort() {
        var current = head
        var isSwapped = false
        repeat {
            isSwapped = false
            current = head
            while let node = current?.next {
                if node.val > current!.val {
                    swap(node, current!)
                    isSwapped = true
                }
                current = node
            }
        } while isSwapped


    }

    private mutating func swap(_ node1: ListNode, _ node2: ListNode) {
        let temp = node1.val
        node1.val = node2.val
        node2.val = temp

    }

    /*
     Step1: initilize array interate through elelemt
     */

    public func isPralindome() -> Bool {

        var stack: [Int] = []

        var current = head

        while current != nil {
            stack.append(current?.val ?? 0)
            current = current?.next
        }

        current = head

        while current != nil {
            if current?.val == stack.popLast() {
                return true
            }
            current = current?.next
        }

        return false
    }


    public mutating func apend(_ value: Int) {
        guard !isEmpty else {
            push(value)
            return
        }
        // 2
        tail?.next = ListNode(value)
        tail = tail?.next
    }
    @discardableResult
    public mutating func insert(_ value: Int,
                                after node: ListNode
    ) -> ListNode {
        guard tail !== node else {
            apend(value)
            return tail!
        }
        node.next = ListNode(value)
        return node.next!

    }
    @discardableResult

    public mutating func pop() -> Int {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil

            }
        }
        return head!.val
    }
    @discardableResult

    public mutating func remove(after node: ListNode) -> Int {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next!.val
    }

    public mutating func findAdjacentElements() {

        var current = head
        while let currentNode = current {
            if let nextNode = current?.next {
                swap(currentNode, nextNode)
            }
            current = current?.next

        }
    }

    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        var head = head
        var dumyNode = ListNode(0)
        dumyNode.next = head
        var current = head
        var prev: ListNode? = dumyNode

        while current != nil {
            if current?.val == val {
                prev?.next = current?.next
            } else {
                prev = current
            }
            current = current?.next
        }

        return dumyNode.next
    }


    func removeElements2(_ head: ListNode?, _ val: Int) -> ListNode? {
        var head = head
        var dumyNode = ListNode(0)
        dumyNode.next = head
        var current = head
        var prev: ListNode? = dumyNode

        while current != nil {
            if current?.val == val {
                prev?.next = current?.next
            } else {
                prev = current
            }
            current = prev?.next
        }

        return dumyNode.next
    }



    public mutating func append(_ value: Int) {

      // 1
      guard !isEmpty else {
        push(value)
        return
      }

      // 2
      tail!.next = ListNode(value)

      // 3
      tail = tail!.next
    }

    mutating func swapPairs() {
        let dummy = ListNode(0)
        dummy.next = head

        var prev: ListNode? = dummy
        var current = head // Initialize current to the head

        while let node1 = current, let node2 = current?.next {
                // Swap node1 and node2
                prev?.next = node2
                node1.next = node2.next
                node2.next = node1

                // Move prev and current pointers forward for next iteration
                prev = node1
            print("node 1", node1.val, node1.next ?? 0)
                current = node1.next
            }

        print("dummy", dummy.next!)

    }

    func swapPairs(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head

        var prev: ListNode? = dummy
        var current = head // Initialize current to the head

        while let node1 = current, let node2 = current?.next {
                // Swap node1 and node2
                prev?.next = node2
                node1.next = node2.next
                node2.next = node1

                // Move prev and current pointers forward for next iteration
                prev = node1
            print("node 1", node1.val, node1.next)
                current = node1.next
            }

            return dummy.next // Return the new head which is after the dummy node

    }

    mutating func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var dummyNode = ListNode(0)
        dummyNode.next = head
        var prev: ListNode? = dummyNode
        var current = head
        var set = Set<Int>()
        while  current != nil {
            if set.contains(current?.val ?? 0) {
                prev?.next = current?.next
            } else {
                prev = current
            }
            set.insert(current?.val ?? 0)
            current = current?.next
        }
        return dummyNode.next
    }

    //MARK: 82. Remove Duplicates from Sorted List II
    /*

     Step1: Declare new dic
     iterate through list node with each value we icrease 1 
     */

    mutating func deleteDuplicates2(_ head: ListNode?) -> ListNode? {
        var dict = [Int: Int]() // Dictionary to keep track of node counts
        var current = head

        while current != nil {
            dict[current?.val ?? 0, default: 0] += 1
            current = current?.next
        }

        var dummyNode = ListNode(0)
        dummyNode.next = head
        var prev: ListNode? = dummyNode
        current = head

        while current != nil {
            if let count = dict[current?.val ?? 0], count > 1 {
                prev?.next = current?.next
            } else {
                prev = current
            }
            current = current?.next
        }

        return dummyNode.next
    }


}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }

    public func printAll() {
        var current = head
        while let currentNode = current {
            print(currentNode.val)
            current = currentNode.next
        }
    }
}



var list = LinkedList()
//list.push(1)
//list.push(2)
//list.push(3)
//list.push(4)

list.append(3)
  list.append(2)
list.append(4)
list.append(1)
let node = ListNode(0)


//  list.append(3)

/// Print the original list
list.swapPairs()
