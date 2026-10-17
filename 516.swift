// 516. Longest Palindromic Subsequence
// https://leetcode.com/problems/longest-palindromic-subsequence/description/
// Medium (Very Easy) 

// Solve "1143. Longest Common Subsequence" first then solve this.

class Solution {
    func longestPalindromeSubseq(_ s: String) -> Int {
        // Ans => LCS of s and reverse of s 
        return lcs(s, String(s.reversed()))
    }

    // i => iterator of t1 , j => iterator of t2
    func lcs(_ text1: String, _ text2: String) -> Int {
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
