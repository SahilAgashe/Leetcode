// 560. Subarray Sum Equals K
// https://leetcode.com/problems/subarray-sum-equals-k/description/
// Medium , But it is very easy!

// Approach: Prefix Sum , Hash Table 
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

             // checking if subarray nums[0...i] has sum k
            if prefixSum == k {
                ans += 1
            }

            // Assume array looks like [somePrefixSum|subArrayHavingsumK]
            // prefixSum = somePrefixSum + k 
            // somePrefixSum = prefixSum - k
            if let somePrefixSumFrequency = prefixSumMap[prefixSum - k] {
                ans += somePrefixSumFrequency
            }
             prefixSumMap[prefixSum, default: 0] += 1
        }
        return ans
    }
}
