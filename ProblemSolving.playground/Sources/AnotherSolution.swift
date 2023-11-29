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

//    public func generateParenthesis(_ n: Int) -> [String] {
//      var stack: [String] = []
//
//      func generate(_ prefix: String, openN: Int, closeN: Int) {
//        if openN == 0 && closeN == 0 {
//          stack.append(prefix)
//          return
//        }
//
//        if openN > 0 {
//          generate(prefix + "(", openN: openN - 1, closeN: closeN)
//        }
//
//        if closeN > openN {
//          if prefix.last == "(" {
//            generate(prefix + ")", openN, closeN - 1)
//          }
//        }
//      }
//
//      generate("", openN: n, closeN: n)
//      return stack
//    }

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
        var nums1 = nums1  // Declare `nums1` as a `var` variable

           if nums2.isEmpty || nums1.isEmpty {
               return []
           }

           var numberNGE: [Int: Int] = [:]
           var numStack: [Int] = []

           numStack.append(nums2[nums2.count - 1])
           numberNGE[nums2[nums2.count - 1]] = -1

           for i in stride(from: nums2.count - 2, to: -1, by: -1) {
               if nums2[i] < numStack.last! {
                   numberNGE[nums2[i]] = numStack.last!
                   numStack.append(nums2[i])
                   continue
               }

               while !numStack.isEmpty && numStack.last! < nums2[i] {
                   numStack.removeLast()
               }

               if numStack.isEmpty {
                   numStack.append(nums2[i])
                   numberNGE[nums2[i]] = -1
               } else {
                   numberNGE[nums2[i]] = numStack.last!
                   numStack.append(nums2[i])
               }
           }

           for i in 0..<nums1.count {
               nums1[i] = numberNGE[nums1[i]]!
           }

           return nums1
       }



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
