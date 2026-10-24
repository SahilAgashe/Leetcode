// 53. Maximum Subarray
// https://leetcode.com/problems/maximum-subarray/
// Medium , but it is easy!!

/*
The Core Intuition: "The Debt Metaphor"
Imagine you are walking down a path accumulating points (money/debt):
* Positive currSum is money in your pocket: 
Even if you encounter a negative number (a small loss), as long as your total sum stays positive,
it can still help boost a big positive number coming up later. Keep going!
* Negative currSum is debt: 
If your sum drops below 0, carrying it into the next element only hurts future possibilities.

The Rule: The moment your total goes negative, cut your losses and reset your running total back to 0.
Starting fresh at the next element is always better than starting with a deficit.

Note: Kadane’s algorithm operates at the intersection of both Dynamic Programming (DP) and Greedy strategies, which is why it is frequently categorized as both
*/

// TC = O(n), SC = O(1)
// Optimum approach, remember this intuition and code style! 
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        // Here if you check by tapping on `subarray` blue coloured word, as per Leetcode's definition,
        // A subarray is a contiguous non-empty sequence of elements within an array.
        // Initially ans = Int.min to avoid empty subarray whose sum = 0
        var maxSum = Int.min 
        var currSum = 0 
        for i in 0..<nums.count {
            currSum += nums[i]
            maxSum = max(maxSum, currSum)
            if currSum < 0 {
                currSum = 0
            }
        }

        return maxSum
    }
}

/*
Dynamic Programming vs. Greedy View
Kadane's algorithm actually sits right at the intersection of Dynamic Programming (DP) and Greedy:
* DP perspective: dp[i] represents the maximum subarray sum ending at index i dp[i] = max(nums[i], dp[i - 1] + nums[i])
* Greedy perspective: Since dp[i] only depends on dp[i-1], you don't need an entire DP array —you greedily maintain a single variable (currSum) and drop it whenever it becomes negative.
*/

// Solving using DP Array
// DP[i] = represents the maximum subarray sum ending at index i
// Ans = max of all maximum subarray sums
// TC = O(n), SC = O(n)
class Solution1 {

    func maxSubArray(_ nums: [Int]) -> Int {
        // Here if you check by tapping on `subarray` blue coloured word, as per Leetcode's definition,
        // A subarray is a contiguous non-empty sequence of elements within an array.
        // Initially Int.min to avoid empty subarray whose sum = 0
        var dp = Array<Int>(repeating: Int.min, count: nums.count)
        var maxSum = nums[0]
        for i in 0..<nums.count {
            if i == 0 {
                dp[i] = nums[i]
                continue
            }
            dp[i] = max(nums[i], dp[i - 1] + nums[i])
            maxSum = max(maxSum , dp[i])
        }

        return maxSum
    }
}
