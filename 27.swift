// 27. Remove Element
// https://leetcode.com/problems/remove-element/description/
// Easy 

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var ans = 0
        for i in 0..<nums.count {
            if nums[i] != val {
                nums[ans] = nums[i]
                ans = ans + 1
            }
        }

        return ans
    }
}