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



    func simplifyPath(_ path: String) -> String {
        var path = path.split(separator: "/")
        print(path)
        var simplifiedPath = [String]()

        for index in 0..<path.count {
            if path[index] == "." {
                continue
            } else if path[index] == ".." {
                simplifiedPath.popLast()
            } else {
                simplifiedPath.append(String(path[index]))
            }

        }
        let simplifyPathString = "/" + simplifiedPath.joined(separator: "/")
        return simplifyPathString
    }

   
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxValue = Int.min
        var currentSum = 0
        for num in nums {
            currentSum = max(num, currentSum+num)
            print("currentSum", currentSum)
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



}

let solution = Solution()

print("result",solution.asteroidCollision3([5,10,-5]))
print("result",solution.asteroidCollision3([8,-8]))
print("result",solution.asteroidCollision3([10,2,-5]))
print("result",solution.asteroidCollision3([-2,-1,1,2]))




let anotherSolution = AnotherSolution()
let ops = ["5","2","C","D","+"]
let testcase2 = ["1","C"]

print(anotherSolution.nextGreaterElement2([4,1,2], [1,3,4,2]))

class MinStack {
    var stack: [Int]
    var minStack: [Int]

    init() {

        self.stack = []
        self.minStack = []
    }

    func push(_ val: Int) {

        self.stack.append(val)
        let min = min(val, self.minStack.last ?? Int.max)
        minStack.append(min)

    }

    func pop() {
        minStack.popLast()
        stack.popLast()
    }

    func top() -> Int {
        return minStack.last ?? 0
    }

    func getMin() -> Int {
        return minStack.last ?? 0
    }
}



//func countDown(num: Int)  {
//    if num == 0 {
//        print("completed")
//
//    } else {
//        print(num)
//        return countDown(num: num-1)
//    }
//}


func implBubuleSort(arr: [Int])  {
    var arr = arr
       for i in 0..<arr.count {
           for j in i..<arr.count {
               if arr[i] > arr[j] {
                   var temp = arr[i]
                   arr[i] = arr[j]
                   arr[j] = temp
               }

           }
       }

       for num in arr {
           print("sorted \(num)")
       }

}

func implBubleSortRecursion(arr: inout [Int], n: Int) {

    if n == 1 {
        return
    }

    for i in  0..<n-1 {
        if arr[i] > arr[i+1] {
            let temp = arr[i]
            arr[i] = arr[i+1]
            arr[i+1] = temp
        }
    }

    implBubleSortRecursion(arr: &arr, n: n-1)
}

var arr = [4,2,1,0]
implBubleSortRecursion(arr: &arr, n: arr.count)
//print(arr)
//implBubuleSort(arr: [4,2,1,0])
func testContine() {
    let numbers = [1, 2, 3, 4, 5, 6]
    var arr: [Int] = []
    for number in numbers {
        if number / 2 == 0 {
            arr.append(number)
//            continue
        }

        print(number)
    }
}


testContine()


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



let stack = MyStack()

stack.push(3)
stack.push(5)
stack.push(6)

stack.top()
stack.empty()
stack.pop()


//
//var monoDecreasing = MonotonicStack<Int>(stack:  [5,4,2,1])
//
//monoDecreasing.push(3)
//monoDecreasing.peek()
//print("monoDecreasing",monoDecreasing.count)
//monoDecreasing.push(4)
//monoDecreasing.peek()

//var intergrate = 0
//
//while intergrate < monoDecreasing.count {
//    monoDecreasing.pop()
//    intergrate += 1
//}
