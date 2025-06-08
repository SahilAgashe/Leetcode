// 189. Rotate Array
// https://leetcode.com/problems/rotate-array/description/
// Medium 

/*
Try to come up with as many solutions as you can. There are at least three different ways to solve this problem.
Could you do it in-place with O(1) extra space?
*/
class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let n = nums.count
        let k = k % n // k can be greater than n , so make it in between 0 to n - 1
        if n > k {
        reverse(&nums, low: 0, high: n - k - 1) // reverse first n - k elements
        reverse(&nums, low: n - k, high: n - 1) // reverse last k elements
        reverse(&nums, low: 0, high: n - 1) // reverse whole array
        }
    }

    func reverse(_ nums: inout [Int], low: Int, high: Int) {
        var low = low 
        var high = high
        while low < high {
            // swap two numbers
            let temp = nums[low]
            nums[low] = nums[high]
            nums[high] = temp
            low = low + 1
            high = high - 1
        }
    }
}