// 55. Jump Game
// https://leetcode.com/problems/jump-game/description/
// Medium 

class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        let n = nums.count
        // dp[i] represents can reach the last index from 'i'th index
        var dp = Array(repeating: false, count: n)
        dp[n-1] = true

        for i in (0..<n).reversed() {
            let jumpIndex = i + nums[i]
            for j in 0...jumpIndex {
                if dp[j] {
                    dp[i] = true
                    break
                }
            }
        }
        return dp[0]
    }
}

/*
For array 'a' of size n 
for ith index, 
dp[i] represents can reach the last index from 'i'th index
dp(i) = true, if i == n - 1
dp[i] = if any one is true from dp(i + j) , j = [0, a[i]]
*/