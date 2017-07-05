//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


/**
 There are two sorted arrays nums1 and nums2 of size m and n respectively.
 
 Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
 */

class Solution {
    
    
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
        let (shortArray, longArray) = self.orderArraysByLength(nums1, nums2)
        
        var combinedArray = longArray
        for item in shortArray {
            print("inserting: \(item)  into: \(combinedArray)")
           combinedArray = self.insert(item, intoSortedArray: combinedArray, fromIndex: 0, toIndex: combinedArray.count)
        }
        
        return self.median(forArray: combinedArray)
    }
    
    func orderArraysByLength(_ arr1:[Int], _ arr2: [Int]) -> (sortArr: [Int], longArr: [Int]) {
        guard arr1.count < arr2.count else {
            return (arr2, arr1)
        }
        return (arr1, arr2)
    }
    
    func insert(_ int: Int, intoSortedArray array: [Int], fromIndex startIndex: Int = 0, toIndex end: Int?) -> [Int] {
        var endIndex: Int = array.count
        if end != nil {
            endIndex = end!
        }
        
        var rVal = array
        // binary insertion
        let sortedIndex = self.indexFor(int, intoSortedArray: array, fromIndex: startIndex, toIndex: endIndex)
        rVal.insert(int, at: sortedIndex)
        return rVal
    }
    
    func indexFor(_ int: Int, intoSortedArray array: [Int], fromIndex startIndex: Int, toIndex endIndex: Int) -> Int {
        // base case
        if  startIndex == endIndex {
            guard int < array[startIndex] else {
                return startIndex + 1
            }
            return startIndex
        }
        // recurse
        else {
            let indexRange = endIndex - startIndex
            guard indexRange != 1 else {
                return self.indexFor(int, intoSortedArray: array, fromIndex: startIndex, toIndex: startIndex)
            }
            
            let medianIndexOffset = Int(floor(Float(indexRange)/2.0)) - 1
            let medianIndex = startIndex + medianIndexOffset
            
            var newStartIndex = startIndex
            var newEndIndex = endIndex
            if int < array[medianIndex] {
                newEndIndex = medianIndex
            }
            else if (int == array[medianIndex]){
                newStartIndex = medianIndex
                newEndIndex = medianIndex
            }
            else {
                newStartIndex = medianIndex + 1
            }
            return self.indexFor(int, intoSortedArray: array, fromIndex: newStartIndex, toIndex: newEndIndex)
        }
    }
    
    func median(forArray array: [Int]) -> Double {
        print("median for: \(array)")
        guard array.count > 1 else {
            return Double(array[0])
        }
        
        let medianIndex = Int(floor(Float(array.count)/2.0))
        guard array.count % 2 == 0 else {
            return Double(array[medianIndex])
        }
        print(medianIndex)
        return Double(array[medianIndex] + array[medianIndex-1]) / 2.0
    }
}


func main() -> Int {

    
    let arr1:[Int] = []
    let arr2 = [2,3]
    
    let solution = Solution()
    
    solution.findMedianSortedArrays(arr1, arr2)
    
    print("\n\nHere")
    return 1
}

main()