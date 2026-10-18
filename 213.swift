// 213. House Robber II
// https://leetcode.com/problems/house-robber-ii/description/
// Medium , (Very Easy! Believe That) 

// Recursion , but TLE 
// TC = O(2^n), SC = O(n)
class Solution1 {
    private func solve(_ nums: [Int], _ i: Int) -> Int {
        // Base Case 1: Empty array or Invalid index
        if i >= nums.count {
            return 0
        }

        // Recursive Cases
        let include = nums[i] + solve(nums, i + 2)
        let exclude = solve(nums, i + 1)
        let ans = max(include, exclude)
        return ans
    }

    // 198. House Robber 
    func robI(_ nums: [Int]) -> Int {
        return solve(nums, 0)
        /* 
        Think in mind
        Traversing array starting from index i = 0
        */
    }

    func rob(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 1 {
            return nums[0]
        } else if n == 2 {
            return max(nums[0], nums[1])
        } else {
            let includeFirst = robI(Array(nums[0..<(n - 1)]))
            let excludeFirst = robI(Array(nums[1..<n]))
            return max(includeFirst, excludeFirst)
        }
    }
}

// Solving Using Top Down Apprach (Recursion + Memoization)
// TC = O(n), SC = O(n)
class Solution2 {
    private func solve(_ nums: [Int], _ i: Int, _ dp: inout [Int]) -> Int {
        // Base Case 1: Empty array or Invalid index
        if i >= nums.count {
            return 0
        }
        
        if dp[i] != -1 {
            return dp[i]
        }

        // Recursive Cases
        let include = nums[i] + solve(nums, i + 2, &dp)
        let exclude = solve(nums, i + 1, &dp)
        let ans = max(include, exclude)
        dp[i] = ans
        return dp[i]
    }

    // 198. House Robber 
    func robI(_ nums: [Int]) -> Int {
        var dp = Array<Int>(repeating: -1, count: nums.count)
        return solve(nums, 0, &dp)
        /* 
        Think in mind
        Traversing array starting from index i = 0
        */
    }

    func rob(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 1 {
            return nums[0]
        } else if n == 2 {
            return max(nums[0], nums[1])
        } else {
            let includeFirst = robI(Array(nums[0..<(n - 1)]))
            let excludeFirst = robI(Array(nums[1..<n]))
            return max(includeFirst, excludeFirst)
        }
    }
    
}


// Solving Using Bottom Up Apprach (Tabulation)
// TC = O(n), SC = O(n)
class Solution {

    // 198. House Robber 
    func robI(_ nums: [Int]) -> Int {
        let n = nums.count
        var dp = Array<Int>(repeating: 0, count: n + 2)

        // Best Case 
        dp[n] = 0
        dp[n + 1] = 0

        for i in (0..<n).reversed() {
            let include = nums[i] + dp[i + 2]
            let exclude = dp [i + 1]
            let ans = max(include, exclude)
            dp[i] = ans
        }

        return dp[0]
        // State 
        // dp[i] = maximum amount of money you can rob 
        // tonight without alerting the police 
        // from array nums starting from index i 
    }

    func rob(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 1 {
            return nums[0]
        } else if n == 2 {
            return max(nums[0], nums[1])
        } else {
            let includeFirst = robI(Array(nums[0..<(n - 1)]))
            let excludeFirst = robI(Array(nums[1..<n]))
            return max(includeFirst, excludeFirst)
        }
    }

}
