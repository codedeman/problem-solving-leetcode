import UIKit

class Solution {
    let charMap: [Character: Character] = ["}":"{",
                                           "(":")",
                                           "[":"]",
                                           
    ]
    
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
        var stack = [Character]()
        for char in s {
            let c = charMap[char]
            if  char  == "(" || char == "{" || char == "[" {
                stack.append(char)
            } else {
                if (c == nil) {
                    stack.append(char)
                    stack.forEach {print($0)}
                } else {
                    if stack.popLast() != c {
                        return false
                    }
                }
            }
        }
        if  stack.popLast() != s.first {
            return false
        }
        return stack.count != 0
    }
    
    func finđDuplicate(nums: [Int]) -> [Int] {
        var hashMap =  [Int:Int]()
        var arrDuplicate: [Int] = []
        for i in 0..<nums.count {
            if hashMap[nums[i]] != nil {
                arrDuplicate.append(nums[i])
            }
            hashMap[nums[i]] =  i
        }
//        print(hashMap)
        return arrDuplicate
    }
}

let solution = Solution()
solution.finđDuplicate(nums: [2,3,5,3,1,2])

solution.twoSum(nums: [2,7,11,15], target: 9)
solution.isValid("()[]{}")
//twoSum(nums: [2,7,11,15], target: 9)
