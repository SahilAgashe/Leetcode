// 238. Product of Array Except Self
// https://leetcode.com/problems/product-of-array-except-self/description/
// Medium 

// TC = O(n) , SC = O(1) assuming output array does not count as extra space for SC analysis
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var ans = Array(repeating: 0, count: n)
        // ans[i] = product of left part * product of right part 

        // 1. Storing left product in ans[i] 
        // ans[i] = product of left part = product of all elements from k = 0 to k = i - 1
        ans[0] = 1 
        for i in 1..<n {
            ans[i] = ans[i - 1] * nums[i - 1]
        }

        // 2. Multiplying right product to already stored left product 
        var rightProduct = 1 
        for i in (0..<n).reversed() {
            ans[i] *= rightProduct
            rightProduct *= nums[i]
        }

        return ans
    }
}
