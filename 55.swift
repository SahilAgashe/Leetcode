// 55. Jump Game
// https://leetcode.com/problems/jump-game/description/
// Medium 

class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        let n = nums.count
        if n == 1 { return true }

        // dp[i] represents can reach the last index from 'i'th index
        var dp = Array(repeating: false, count: n)
        dp[n-1] = true


        for i in (0...(n - 2)).reversed() {
            if nums[i] == 0 { continue }
            for j in 1...nums[i] {
                let jumpIndex = i + j
                if jumpIndex >= n { break }
                if dp[jumpIndex] {
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