// 560. Subarray Sum Equals K
// https://leetcode.com/problems/subarray-sum-equals-k/description/
// Medium , But it is very easy!

// TC = O(n) , SC = O(n)
class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count 
        // prefixSumMap stores: [PrefixSum: Frequency]
        var prefixSumMap = Dictionary<Int, Int>() 
        var ans = 0

        var prefixSum = 0
        for i in 0..<n {
            prefixSum += nums[i]
            if prefixSum == k {
                ans += 1
            }

            if let count = prefixSumMap[prefixSum - k] {
                ans += count
            }
             prefixSumMap[prefixSum, default: 0] += 1
        }
        return ans
    }
}
