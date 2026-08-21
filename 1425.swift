// 1425. Constrained Subsequence Sum
// https://leetcode.com/problems/constrained-subsequence-sum/description/
// Hard, But Believe Me it is very Easy!!! Thank You God! 

// Solution Using DP 
// TC = O(nk), but here it will give TLE
class SolutionUsingDP {
    func constrainedSubsetSum(_ nums: [Int], _ k: Int) -> Int {
        // dp[i] = the maximum sum of a non-empty subsequence of input array nums ending at i
        // dp[i] = nums[i] + max(0, dp[i - 1], dp[i - 2], ... dp [i - x]) , where i - x <= k 
        // where in max we added 0 representing if we dont want to include it in any previous subsequence
        // dp[0] = nums[0] // base condition 
        // here ans = maximum element from dp array 
        let n = nums.count
        var dp = [Int](repeating: 0, count: n)
        dp[0] = nums[0]
        var ans = nums[0]
        for i in 1..<n {
            var maxi = 0
            for j in 1...k {
                if i - j >= 0 {
                     maxi = max(maxi, dp[i - j])
                }
            }
            dp[i] = nums[i] + maxi
            ans = max(ans, dp[i])
        }
        return ans
        // TC = O(nk), but here it will give TLE (Time Limit Exceeded)
    }
}

// Using Monotonic Decreasing Deque 
// TC = O(n)
class Solution {
    func constrainedSubsetSum(_ nums: [Int], _ k: Int) -> Int {
        // dp[i] = the maximum sum of a non-empty subsequence of input array nums ending at i
        // dp[i] = nums[i] + max(0, dp[i - 1], dp[i - 2], ... dp [i - x]) , where i - x <= k 
        // where in max we added 0 representing if we dont want to include it in any previous subsequence
        // dp[0] = nums[0] // base condition 
        // here ans = maximum element from dp array 
        let n = nums.count
        var dp = [Int](repeating: 0, count: n)
        dp[0] = nums[0]
        var ans = Int.min

        // To track maximum element of dp for (k + 1) sized window
        // We will store indexes to track (k + 1) sized window
        let ws = k + 1  // window size
        var deque = Deque<Int>() 

        for i in 0..<n {
            // ws sized window ended at i, starts at x 
            // i - x + 1 = ws , x = i - ws + 1,
            // if first <= x - 1, we need to remove out of window element
            if let first = deque.first, first <= i - ws {
                deque.popFirst()
            }

            if let first = deque.first {
                dp[i] = nums[i] + max(0, dp[first])
            } else {
                dp[i] = nums[i]
            }
            ans = max(ans, dp[i])

            // Maintain monotonic decreasing deque to append current element's index 
            while let top = deque.last, dp[i] >= dp[top] {
                deque.popLast()
            }

            // append current index
            deque.append(i)
        }
        return ans
    }

    /*
    Complexity Analysis
* Time Complexity: O(n)
    * Iterating through the array takes n steps.
    * Inside the loop, each index i is pushed into deque exactly once and popped from deque at most once.
    * Because amortized operations per element are constant, the inner while loop runs at most n times across the entire execution of the algorithm, yielding an overall linear time complexity.
* Space Complexity: O(n)
    * The dp array requires O(n) auxiliary space to store results for every index.
    * The deque stores up to k indices at any given moment, requiring O(k) space.
    * Since k <= n, the total dominant space complexity is O(n).
    */
}

/* 
Approach 1] 
We can solve this using Dynamic Programming
But TC = O(nk), and here as per constraints 
1 <= k <= nums.length <= 10^5

We can not use nk => 10^10 which is greater than 10^8

Approach 2] Monotonic Decreasing Deque
TC = O(n)

*/
