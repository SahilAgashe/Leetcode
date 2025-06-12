// 45. Jump Game II
// https://leetcode.com/problems/jump-game-ii/description/
// Medium

class Solution {

    // DP: Bottom UP OR Tabular Approach
    func jump(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 1 { return 0 }
        if n == 2 { return nums[0] > 0 ? 1 : 0 }
        var dp = Array(repeating: -1, count: n)
        // dp[i] represents the minimum number of jumps to reach last index from 'i' th index
        dp[n-1] = 0

        for i in (0...(n - 2)).reversed() {
            if nums[i] < 1 { continue }
            for j in 1...nums[i] {
                let jumpIndex = i + j 
                if jumpIndex <= (n - 1) {
                    if dp[jumpIndex] == -1 { continue }
                    if dp[i] == -1 { dp[i] = 1 + dp[jumpIndex] }
                    dp[i] = min(dp[i], 1 + dp[jumpIndex])
                }
            }
        }
        return dp[0]
    }
}

/*
For array 'a' for size n 
for ith index, 
dp[i] represents the minimum number of jumps to reach last index from index ith index
dp(i) = 0, if i == n - 1
dp[i] = min of (1 + dp(i + j)) , j = [0, a[i]]
*/