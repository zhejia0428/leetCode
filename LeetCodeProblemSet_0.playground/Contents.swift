//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, Leet code"

// problem 1
class Solution1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var solutionMap:[Int: Int] = [:]
        
        for (index, element) in nums.enumerated() {
            let targetValue = target - element
            if let targetValueIndex = solutionMap[targetValue] {
                return [targetValueIndex, index]
            }
            else {
                solutionMap[element] = index
            }
        }
        return []
        
    }
}

// problem 2
class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution2 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var hasCarryValue: Bool = false
        var currentL1Node = l1
        var currentL2Node = l2
        var rootReturnNode: ListNode?
        var currentReturnNode: ListNode?
        
        while currentL1Node != nil || currentL2Node != nil {
            let l1Value = currentL1Node != nil ? currentL1Node!.val : 0
            let l2Value = currentL2Node != nil ? currentL2Node!.val : 0
            
            var resultValue = l1Value + l2Value

            if hasCarryValue {
                resultValue += 1
                hasCarryValue = false
            }
            
            if resultValue > 9 {
                resultValue -= 10
                hasCarryValue = true
            }
            currentL1Node = currentL1Node?.next
            currentL2Node = currentL2Node?.next
            
            if rootReturnNode == nil {
                rootReturnNode = ListNode(resultValue)
                currentReturnNode = rootReturnNode
            }
            else {
                currentReturnNode?.next = ListNode(resultValue)
                currentReturnNode = currentReturnNode?.next
                
            }
            
        }
        
        if hasCarryValue {
            currentReturnNode?.next = ListNode(1)
        }
        
        return rootReturnNode
    }
}

// problem 3
class Solution3 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var rVal: Int = 0
        var subSequence:[String] = []
        var subSequenceIndexmap:[String:Int] = [:]
        var subSequenceIndexOffset = 0
        let stringArray = s.characters.map { (character) -> String in
            character.description
        }
        
        for element in stringArray {
            if let previousMatchingIndex = subSequenceIndexmap[element] , previousMatchingIndex >= subSequenceIndexOffset {
                // remove all reference in subSequence up to and including that point ; remap
                let subsequenceMatchingIndex = previousMatchingIndex - subSequenceIndexOffset
                if subsequenceMatchingIndex + 1 == subSequence.count {
                    subSequenceIndexOffset += subSequence.count
                    subSequence = []
                }
                else {
                    let newSubSequence = subSequence.dropFirst(subsequenceMatchingIndex + 1)
                    subSequence = Array(newSubSequence)
                    subSequenceIndexOffset += subsequenceMatchingIndex + 1
                }
            }
            
            // keep appending
            subSequenceIndexmap[element] = subSequenceIndexOffset + subSequence.count
            subSequence.append(element)
            
            rVal = max(rVal, subSequence.count)
        }
        
        return rVal
    }
}

let solution3 = Solution3()
let problem3Test = "abcdefg"
solution3.lengthOfLongestSubstring(problem3Test)




