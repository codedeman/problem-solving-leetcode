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

    func maxProfit(_ prices: [Int]) -> Int {
        var left = 0
        var right = left+1
        var maxProfit = 0
        while right < prices.count {
            print("left ==> \(left)")
            if prices[left] < prices[right] {
                maxProfit =  max(maxProfit, prices[right] - prices[left])
            } else {
                left = right
            }
            right += 1
        }
        return maxProfit
    }

    

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
//    func dailyTemperatures1(_ temperatures: [Int]) -> [Int] {
//      var stack = MonotonicStack<Int>()
//      var result = [Int](repeating: 0, count: temperatures.count)
//
//      for (i, num) in temperatures.enumerated() {
//          while !stack.isEmpty() && num > temperatures[stack.peek()!] {
//              let index = stack.pop() ?? 0
//              result[index] = i - index
//
//          }
//        stack.push(i)
//      }
//
//      return result
//    }



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
        for (index,num) in nums.enumerated() {
            print("",num)
              currentSum = max(num, currentSum + num)
              maxSum = max(maxSum, currentSum)
          }
          return maxSum

//        var stack: [Int] = []
//        var maxValue = Int.min
//        var maxEnding = 0
//        for num in nums {
//            maxEnding = maxEnding + num
//            if maxValue < maxEnding {
//                stack.append(num)
//                maxValue = maxEnding
//            }
//
//            if maxEnding < 0 {
//                maxEnding = 0
//                stack.popLast()
//                print("remove \(num)")
//            }
//
//        }
//
//        for j in stack {
//            print("j",j)
//        }
//        let min = nums.min()
//        print("min",nums.min())
//        return maxValue

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

//            let currentStr = String(word.map{ ch in translateAble[ch]!})
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


}

let solution = Solution()
//Input: target = 12, position = [10,8,0,5,3], speed = [2,4,1,1,3]


solution.evalRPN(["4","13","5","/","+"])
//["hello","leetcode"], order = "hlabcdefgijkmnopqrstuvwxyz"
solution.isAlienSorted(["hello","leetcode"], "hlabcdefgijkmnopqrstuvwxyz")
solution.evalRPN( ["2","1","+","3","*"])
solution.sortArrayByParity([3,1,2,4])

let nums =  [1,2,3,2]
//[1,2,3,2]
solution.carFleet(12, [10,8,0,5,3], [2,4,1,1,3])
let maxSubarraySum =  solution.maxSubMinProduct(nums)
print("The maximum subarray sum is: \(maxSubarraySum)")
solution.simplifyPath("/home/")
solution.simplifyPath("/../")

let another = AnotherSolution()

another.isAlienSorted(["hello","leetcode"], "hlabcdefgijkmnopqrstuvwxyz")
another.calPoints(["5","2","C","D","+"])

