// 72. Edit Distance
// https://leetcode.com/problems/edit-distance/description/
// Medium

// Recursion , But TLE 
// TC => O(3^{m + n}) SC => O(m + n) (Call stack)
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
            // insert in w1
            let insertAns = 1 + solve(w1, w2, i, j + 1)
            // delete in w1
            let deleteAns = 1 + solve(w1, w2, i + 1, j)
            // replace
            let replaceAns = 1 + solve(w1, w2, i + 1, j + 1)
            let ans = min(insertAns, deleteAns, replaceAns)
            return ans
        }
    }

    func minDistance(_ word1: String, _ word2: String) -> Int {
        let w1 = Array<Character>(word1)
        let w2 = Array<Character>(word2)
        return solve(w1, w2, 0, 0)
        /*
        Think in mind: 
        We are traversing both w1 & w2 strings and comparing indexes starting from index 0 to end. 
        */
    }
}
/*
w1, horse , i index
w2, ros , j index
*/

/*
To get your submission accepted & avoid recursion, 
Use DP! 
Two approaches
1] Top-Down DP (Recursion + Memoization)
2] Bottom-Up DP (Tabulation) 

Bottom-Up DP (Tabulation) is always recommended  
1.No Call Stack Overhead
2.Space Optimization
3.CPU Cache Friendliness

No Call Stack Overhead: 
Top-Down dynamic programming makes O(m \times n) recursive function calls. 
Pushing and popping frames off the call stack adds measurable runtime CPU overhead
 and risks Stack Overflow errors if inputs are extremely large.
Space Optimization: 
In Tabular DP, row $i$ only depends on row i - 1. You can discard older rows 
and maintain just 1D or two 1D arrays, cutting memory consumption significantly.
CPU Cache Friendliness: 
Iterating sequentially over contiguous arrays in double loops takes
better advantage of CPU L1/L2 cache locality compared to pointer jumps in recursive calls.
*/

// Using Top-Down DP (Recursion + Memoization)
/*
3 steps to convert from Recursion to Top-Down DP (Recursion + Memoization)
1] Create and pass the dp array: 
Initialize a dp table with a sentinel value (e.g., -1 or nil) representing "uncalculated" states,
and pass it by reference (e.g., inout in Swift) to recursive calls.
2] Check before computing: 
Right after the base cases, check if dp[state] already holds a calculated answer (i.e., dp[state] != -1).
If so, return it immediately.
3] Store before returning: 
Whenever a recursive result is calculated, store it in dp[state] before returning it.
*/


// Using Top-Down DP (Recursion + Memoization)
// TC => O(mn), SC => O(mn)
class Solution2 {
    // i => index iterator of w1 , j => index iterator of w2
    private func solve(_ w1: [Character], _ w2: [Character], _ i: Int, _ j: Int, _ dp: inout [[Int]]) -> Int{
        // Base Case 1: If w1 is exhausted, Ans => remaining characters of w2
        if i == w1.count {
            return (w2.count - 1) - j + 1
        }

        // Base Case 2: If w2 is exhausted, Ans => remaining characters of w1
        if j == w2.count {
            return (w1.count - 1) - i + 1
        }

        if dp[i][j] != -1 {
            return dp[i][j]
        }

        // Recursive Cases
        if w1[i] == w2[j] {
            dp[i][j] = solve(w1, w2, i + 1, j + 1, &dp)
        } else {
            // insert in w1
            let insertAns = 1 + solve(w1, w2, i, j + 1, &dp)
            // delete in w1
            let deleteAns = 1 + solve(w1, w2, i + 1, j, &dp)
            // replace
            let replaceAns = 1 + solve(w1, w2, i + 1, j + 1, &dp)
            dp[i][j] = min(insertAns, deleteAns, replaceAns) 
        }
        return dp[i][j]
    }

    func minDistance(_ word1: String, _ word2: String) -> Int {
        let tempArray = Array<Int>(repeating: -1, count: word2.count)
        var dp = Array<Array<Int>>(repeating: tempArray, count: word1.count)
        // so dp[i][j] , i stands for rows for w1 , j stands for columns for w2
        let w1 = Array<Character>(word1)
        let w2 = Array<Character>(word2)
        return solve(w1, w2, 0, 0, &dp)
    }
}

// Using Bottom-Up DP (Tabulation) 
// TC = O(mn) , SC = O(mn)
class Solution {
    // i => index iterator of w1 , j => index iterator of w2
    func minDistance(_ word1: String, _ word2: String) -> Int {
        // why plus one column & plus one row, you will get it. 
        let tempArray = Array<Int>(repeating: 0, count: word2.count + 1)
        var dp = Array<Array<Int>>(repeating: tempArray, count: word1.count + 1)
        // so dp[i][j] , i stands for rows for w1 , j stands for columns for w2
        let w1 = Array<Character>(word1)
        let w2 = Array<Character>(word2)

        // Base Case 1: If w1 is exhausted, Ans => remaining characters of w2
        // for w1 exhausted case,  we need w1.count as index, so we have plus one row
        for j in 0...w2.count { 
            dp[w1.count][j] = (w2.count - 1) - j + 1
        }

        // Base Case 2: If w2 is exhausted, Ans => remaining characters of w1
         // for w2 exhausted case,  we need w2.count as index, so we have plus one column
        for i in 0...w1.count {
            dp[i][w2.count] = (w1.count - 1) - i + 1
        }

        for i in (0..<w1.count).reversed() {
            for j in (0..<w2.count).reversed() {
                if w1[i] == w2[j] {
                    dp[i][j] = dp[i + 1][j + 1]
                } else {
                    // insert in w1
                   let insertAns = 1 + dp[i][j + 1]
                   // delete in w1
                   let deleteAns = 1 + dp[i + 1][j]
                   // replace
                   let replaceAns = 1 + dp[i + 1][j + 1]
                   dp[i][j] = min(insertAns, deleteAns, replaceAns) 
                }
            }
        }
        return dp[0][0]
        // State of DP
        // dp[i][j] = the minimum number of operations required
        // to convert word1 starting from index i to word2 starting from index j

        // so ans is dp[0][0]
    }
}
