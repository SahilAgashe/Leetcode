// 1143. Longest Common Subsequence
// https://leetcode.com/problems/longest-common-subsequence/description/
// Medium (But Very Easy)

// Recursion, But TLE 
// TC => O(2^(m+n)), SC => O(m + n)
class Solution1 {
    // i => iterator of t1 , j => iterator of t2
    private func solve(_ t1: [Character], _ t2: [Character], _ i: Int, _ j: Int) -> Int {
        // Base Case 1: Either is empty string 
        if i == t1.count || j == t2.count { 
            return 0
        }

        // Recursive Cases
        if t1[i] == t2[j] {
            return 1 + solve(t1, t2 , i + 1, j + 1)
        } else {
            return max(solve(t1, t2 , i, j + 1) , solve(t1, t2 , i + 1, j))
        }
    }


    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let t1 = Array<Character>(text1)
        let t2 = Array<Character>(text2)
        return solve(t1, t2 , 0, 0)
        /* Thinking in Mind
        Traversing both strings starting from index i & j
        */
    }
}

// Using Top Down Approach: (Recursion + Memoization)
// TC => O(mn), SC => O(mn)
class Solution2 {
    // i => iterator of t1 , j => iterator of t2
    private func solve(_ t1: [Character], _ t2: [Character], _ i: Int, _ j: Int, _ dp: inout [[Int]]) -> Int {
        // Base Case 1: Either is empty string 
        if i == t1.count || j == t2.count { 
            return 0
        }

        if dp[i][j] != -1 {
            return dp[i][j]
        }

        // Recursive Cases
        if t1[i] == t2[j] {
            dp[i][j] = 1 + solve(t1, t2 , i + 1, j + 1, &dp)
        } else {
            dp[i][j] = max(solve(t1, t2 , i, j + 1, &dp) , solve(t1, t2 , i + 1, j, &dp))
        }
        return dp[i][j]
    }


    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let temp = Array<Int>(repeating: -1, count: text2.count)
        var dp = Array<Array<Int>>(repeating: temp, count: text1.count)
        let t1 = Array<Character>(text1)
        let t2 = Array<Character>(text2)
        return solve(t1, t2 , 0, 0, &dp)
        /* Thinking in Mind
        Traversing both strings starting from index i & j 
        */
    }
}

// Using Bottom Up Approach | Tabulation Approach
// TC => O(mn), SC => O(mn)
class Solution {
    // i => iterator of t1 , j => iterator of t2
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let temp = Array<Int>(repeating: 0, count: text2.count + 1)
        var dp = Array<Array<Int>>(repeating: temp, count: text1.count + 1)
        let t1 = Array<Character>(text1)
        let t2 = Array<Character>(text2)
        /* Thinking in Mind
        Traversing both strings starting from index i & j
        */

        // Base Case 1: Either string is empty
        for i in 0...text1.count {
            dp[i][text2.count] = 0 
        }

        for j in 0...text2.count {
            dp[text1.count][j] = 0 
        }

        for i in (0..<text1.count).reversed() {
            for j in (0..<text2.count).reversed() {
                if t1[i] == t2[j] {
                    dp[i][j] = 1 + dp[i + 1][j + 1]
                } else {
                    dp[i][j] = max(dp[i][j + 1], dp[i + 1][j])
                }
            }
        }

        return dp[0][0]
        // State of DP
        // dp[i][j] = the length of  longest common subsequence of text1 & text2
        // text1 starts from index i & text2 starts from index j
        // so ans is dp[0][0]
    }
}
