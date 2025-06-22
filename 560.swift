// 560. Subarray Sum Equals K 
// https://leetcode.com/problems/subarray-sum-equals-k/description/
// Medium 

class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var prefixSumFreqMap = Dictionary<Int,Int>() // prefixSum <---> Frequency
        var ans = 0 // total number of subarrays whose sum equals to k

        // Getting Prefix Sum
        var prefixSum = Array<Int>(repeating:0, count: n)
        prefixSum[0] = nums[0]
        for i in 1..<n {
            prefixSum[i] = prefixSum[i-1] + nums[i]
        }

        for i in 0..<n {
            let currPrefixSum = prefixSum[i]
            if currPrefixSum == k { ans += 1}
            let val = currPrefixSum - k 
            if let freq = prefixSumFreqMap[val] {
                ans += freq
            } 

            if let val = prefixSumFreqMap[currPrefixSum] {
                 prefixSumFreqMap[currPrefixSum] = val + 1
            } else {
                prefixSumFreqMap[currPrefixSum] = 1 
            }
        }

        return ans
    }
}