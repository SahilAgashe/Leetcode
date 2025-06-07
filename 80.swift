// 80. Remove Duplicates from Sorted Array II
// https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/description/
// Medium 

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var prev = 0
        var prevFreq = 1

        for i in 1..<nums.count {
            if nums[i] != nums[prev] {
                nums[prev + 1] = nums[i]
                prev = prev + 1
                prevFreq = 1
            } else if nums[i] == nums[prev] && prevFreq == 1 {
                nums[prev + 1] = nums[i]
                prev = prev + 1
                prevFreq = 2
            }
        }

        return prev + 1
    }
}