// 583. Delete Operation for Two Strings
// https://leetcode.com/problems/delete-operation-for-two-strings/description/
// Medium , But it is very easy believe that (Based on Edit Distance Problem)

// Recursion but TLE 
// TC => O(2^(m+n)), SC => O(m + n)
class Solution1 {
    // i => index iterator of w1 , j => index iterator of w2
    private func solve(_ w1: [Character], _ w2: [Character], _ i: Int, _ j: Int) -> Int {
        // Base Case 1: If w1 is exhausted, Ans => remaining characters of w2
        if i == w1.count {
            return w2.count - j  // (w2.count - 1) - j + 1 
        }

        // Base Case 2: If w2 is exhausted, Ans => remaining characters of w1
        if j == w2.count {
            return w1.count - i // (w1.count - 1) - i + 1
        }

        // Recursive Cases
        if w1[i] == w2[j] {
            return solve(w1, w2, i + 1, j + 1)
        } else {
            // delete in w2
            let deleteInW2 = 1 + solve(w1, w2, i, j + 1)
            // delete in w1
            let deleteInW1 = 1 + solve(w1, w2, i + 1, j)
            let ans = min(deleteInW2, deleteInW1)
            return ans
        }
    }

    func minDistance(_ word1: String, _ word2: String) -> Int {
        let w1 = Array<Character>(word1)
        let w2 = Array<Character>(word2)
        return solve(w1, w2, 0 , 0)
        /* 
        We are traversing both strings w1 & w2,
        where w1 starts from i index & w2 starts from j index
        */
    }
}

// Solving using Top Down DP Apprach (Recursion + Memoization)
// TC => O(mn), SC => O(mn)
class Solution2 {
    // i => index iterator of w1 , j => index iterator of w2
    private func solve(_ w1: [Character], _ w2: [Character], _ i: Int, _ j: Int, _ dp: inout [[Int]]) -> Int {
        // Base Case 1: If w1 is exhausted, Ans => remaining characters of w2
        if i == w1.count {
            return w2.count - j  // (w2.count - 1) - j + 1 
        }

        // Base Case 2: If w2 is exhausted, Ans => remaining characters of w1
        if j == w2.count {
            return w1.count - i // (w1.count - 1) - i + 1
        }

        if dp[i][j] != -1 {
            return dp[i][j]
        }

        // Recursive Cases
        if w1[i] == w2[j] {
            dp[i][j] = solve(w1, w2, i + 1, j + 1, &dp)
        } else {
            // delete in w2
            let deleteInW2 = 1 + solve(w1, w2, i, j + 1, &dp)
            // delete in w1
            let deleteInW1 = 1 + solve(w1, w2, i + 1, j, &dp)
            let ans = min(deleteInW2, deleteInW1)
             dp[i][j] = ans
        }
        return dp[i][j]
    }

    func minDistance(_ word1: String, _ word2: String) -> Int {
        let w1 = Array<Character>(word1)
        let w2 = Array<Character>(word2)
        let temp = Array<Int>(repeating: -1, count: w2.count)
        var dp = Array<Array<Int>>(repeating: temp, count: w1.count)
        return solve(w1, w2, 0 , 0, &dp)
        /* 
        We are traversing both strings w1 & w2,
        where w1 starts from i index & w2 starts from j index
        */
    }
}

// Solving using Bottom Up DP Apprach (Tabulation)
// TC => O(mn), SC => O(mn)
class Solution3 {
    // i => index iterator of w1 , j => index iterator of w2
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let w1 = Array<Character>(word1)
        let w2 = Array<Character>(word2)
        let temp = Array<Int>(repeating: 0, count: w2.count + 1)
        var dp = Array<Array<Int>>(repeating: temp, count: w1.count + 1)
        /* 
        We are traversing both strings w1 & w2,
        where w1 starts from i index & w2 starts from j index
        */

        // Base Case 1: If w1 is exhausted, Ans => remaining characters of w2
        // as w1 is exhausted, we need to use w1.count as index, so plus one row
        for j in 0..<w2.count {
            dp[w1.count][j] = (w2.count - 1) - j + 1
        }

        // Base Case 2: If w2 is exhausted, Ans => remaining characters of w1
         // as w2 is exhausted, we need to use w2.count as index, so plus one column
        for i in 0..<w1.count {
            dp[i][w2.count] = (w1.count - 1) - i + 1
        }

        for i in (0..<w1.count).reversed() {
            for j in (0..<w2.count).reversed() {
                // Recursive Cases
                if w1[i] == w2[j] {
                    dp[i][j] = dp[i + 1][j + 1]
                } else {
                    // delete in w2
                    let deleteInW2 = 1 + dp[i][j + 1]
                    // delete in w1
                    let deleteInW1 = 1 + dp[i + 1][j]
                    let ans = min(deleteInW2, deleteInW1)
                    dp[i][j] = ans
                }
            }
        }

        return dp[0][0]
        // State of DP
        // dp[i][j] = the minimum number of steps required to 
        // make word1 and word2 the same
        // such that word1 starting from index i to word2 starting from index j
        // so ans is dp[0][0]
    }
}

/*
We can optimize the space complexity from O(mn) to O(n) (a 1D array) 
Where m = rows, n = columns
because computing dp[i][j] only depends on:
1] dp[i + 1][j] (the value from the next row in the same column)
2] dp[i][j + 1] (the value from the current row in the next column)
3] dp[i + 1][j + 1] (the diagonal value from the next row and next column)

Key Idea for Space Optimization
Instead of keeping all rows in memory, maintain Two 1D arrays:
next: Represents row i + 1.
curr: Represents row i being computed.
At each step, curr[j] uses values from next and curr[j + 1]. 
Once row i is finished, set next = curr and move to row i - 1.
*/

// Solving using Bottom Up DP Apprach (Tabulation) With Optimized Space
// TC => O(mn), SC => O(n), m = rows, n = columns 
// SC => O(n), because two rows on size n
class Solution {
    // i => index iterator of w1 , j => index iterator of w2
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let w1 = Array<Character>(word1)
        let w2 = Array<Character>(word2)
        let m = w1.count // rows 
        let n = w2.count // columns 

        //let temp = Array<Int>(repeating: 0, count: n + 1)
        //var dp = Array<Array<Int>>(repeating: temp, count: m + 1)
        var next = Array<Int>(repeating: 0, count: n + 1)
        var curr = Array<Int>(repeating: 0, count: n + 1)
        /* 
        We are traversing both strings w1 & w2,
        where w1 starts from i index & w2 starts from j index
        */

        // Base Case 1: If w1 is exhausted, Ans => remaining characters of w2
        // as w1 is exhausted, we need to use w1.count as index, so plus one row
        for j in 0..<w2.count {
            //dp[w1.count][j] = (w2.count - 1) - j + 1
            next[j] = (w2.count - 1) - j + 1
        }

        // Base Case 2: If w2 is exhausted, Ans => remaining characters of w1
        // as w2 is exhausted, we need to use w2.count as index, so plus one column
        // For this code , will need to traverse rows, we can do later, as required
        // for i in 0..<w1.count {
        //     dp[i][w2.count] = (w1.count - 1) - i + 1
        // }


        // next: Represents row i + 1.
        // curr: Represents row i being computed.
        for i in (0..<m).reversed() {
            // Base Case 2 , we are doing here
            curr[w2.count] = (w1.count - 1) - i + 1

            for j in (0..<n).reversed() {
                // Recursive Cases
                if w1[i] == w2[j] {
                    curr[j] = next[j + 1]
                } else {
                    // delete in w2
                    // let deleteInW2 = 1 + dp[i][j + 1]
                    let deleteInW2 = 1 + curr[j + 1]
                    // delete in w1
                    // let deleteInW1 = 1 + dp[i + 1][j]
                    let deleteInW1 = 1 + next[j]
                    let ans = min(deleteInW2, deleteInW1)
                    curr[j] = ans
                }
            }
            next = curr
        }

        return next[0]
        // State of DP
        // dp[i][j] = the minimum number of steps required to 
        // make word1 and word2 the same
        // such that word1 starting from index i to word2 starting from index j
        // so ans is dp[0][0]
    }
}
