// 26. Remove Duplicates from Sorted Array
// https://leetcode.com/problems/remove-duplicates-from-sorted-array/description/
// Easy 


class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        let n = nums.count
        var j = 0 // next valid index to fill
        for i in 0..<n {
            if i == 0 { 
                j = 1
            } else { // i > 0
            let curr = nums[i]
            let prev = nums[i - 1]
              if curr != prev {
                nums[j] = curr
                j += 1
              }
            }
        }

        return j 
    }
}


class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var prev = 0

        for i in 1..<nums.count {
            if nums[i] != nums[prev] {
                nums[prev + 1] = nums[i]
                prev = prev + 1
            }
        }

        return prev + 1
    }
}
