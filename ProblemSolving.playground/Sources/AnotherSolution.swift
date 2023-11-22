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

    

    

}
