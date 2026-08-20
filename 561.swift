// 561. Array Partition
// https://leetcode.com/problems/array-partition/description/ 
// Easy 

class Solution {
    func arrayPairSum(_ nums: [Int]) -> Int {
        // sort the array
        let nums = nums.sorted()
        let n = nums.count 
        var sum = 0
        var i = 0
        while i < n {
            sum += nums[i]
            i += 2
        }

        return sum
    }
}

// Just sort the array, you will automatically get the required pairs. 
