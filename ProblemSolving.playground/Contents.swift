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

               if openN < n {
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

}


let solution = Solution()
var nums = [0,1,2,2,3,0,4,2]
let anotherSolution = AnotherSolution()
//Input: haystack = "sadbutsad", needle = "sad"
solution.generateParenthesis(3)

solution.strStr(haystack: "leetcode", needle: "needle")

let str = "Greetings, friend! How are you?"
let firstSpace = str.firstIndex(of: " ") ?? str.endIndex
let substr = str[firstSpace...]
if let nextCapital = substr.firstIndex(where: { $0 >= "A" && $0 <= "Z" }) {
    print("Capital after a space: \(str[nextCapital])")
}
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
print(arr)
implBubuleSort(arr: [4,2,1,0])

