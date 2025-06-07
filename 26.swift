// 26. Remove Duplicates from Sorted Array
// https://leetcode.com/problems/remove-duplicates-from-sorted-array/description/
// Easy 

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