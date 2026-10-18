// 322. Coin Change (Also called as Target Sum)
// https://leetcode.com/problems/coin-change/description/
// Medium , But it is very easy

// This problem is also called as Target Sum 
// Recursion , But TLE
// TC = O(n^a) , n = coins.count , SC = O(a) , a = amount
// For Recursion generally TC = O(k^d) , SC = O(d)
// where k = branching factor (branches in recursion tree) 
// k = OR count of recursive function calls
// d = the maximum depth of the call stack
class Solution1 {
    private func solve(_ coins: [Int], _ a: Int) -> Int {
        // Base Case 1: Amount is successfully met
        if a == 0 {
            return 0
        }

        // Base Case 2: Negative Amount
        if a < 0 {
            return Int.max
        }

        var minCoins = Int.max
        for i in 0..<coins.count {
            let res = solve(coins, a - coins[i])
            if res != Int.max {
                minCoins = min(minCoins, 1 + res)
            }
        }
        return minCoins
    } 


    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        // Here you can not add logic of index,
        // As you have infinite supply of coins
        // There will be no index as the state in DP
        let ans = solve(coins, amount)
        return ans == Int.max ? -1 : ans
    }
}

// Top Down Approach (Recursion + Memoization)
// TC = O(n*a) , n = coins.count , SC = O(a) , a = amount
class Solution2 {
    private func solve(_ coins: [Int], _ a: Int, _ dp: inout [Int]) -> Int {
        // Base Case 1: Amount is successfully met
        if a == 0 {
            return 0
        }

        // Base Case 2: Negative Amount
        if a < 0 {
            return Int.max
        }

        if dp[a] != -1 {
            return dp[a]
        }

        var minCoins = Int.max
        for i in 0..<coins.count {
            let res = solve(coins, a - coins[i], &dp)
            if res != Int.max {
                minCoins = min(minCoins, 1 + res)
            }
        }
        dp[a] = minCoins
        return dp[a]
    } 


    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var dp = Array<Int>(repeating: -1, count: amount + 1)
        // Here you can not add logic of index,
        // As you have infinite supply of coins
        // There will be no index as the state in DP
        let ans = solve(coins, amount, &dp)
        return ans == Int.max ? -1 : ans
    }
}

// Bottom Up Approach (Tabulation)
// TC = O(n*a) , n = coins.count , SC = O(a) , a = amount
class Solution3 {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var dp = Array<Int>(repeating: Int.max, count: amount + 1)
        // Here you can not add logic of index,
        // As you have infinite supply of coins
        // There will be no index as the state in DP
        
        // Base Cases 
        dp[0] = 0 

        if amount == 0 { return 0 }
         
        // dp[i] = the fewest number of coins that you need to make up i amount
        
        for i in 1...amount {
            for j in 0..<coins.count {
                let reqIndex = i - coins[j]
                if reqIndex >= 0 , dp[reqIndex] != Int.max {
                   dp[i] = min(dp[i], 1 + dp[reqIndex])
                }
            }
        }

        return dp[amount] == Int.max ? -1 : dp[amount]
    }
}


// Bottom Up Approach (Tabulation) || More running time optimized logic
// TC = O(n*a) , n = coins.count , SC = O(a) , a = amount
class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var dp = Array<Int>(repeating: Int.max, count: amount + 1)
        // Here you can not add logic of index,
        // As you have infinite supply of coins
        // There will be no index as the state in DP
        
        // Base Cases 
        dp[0] = 0 

        if amount == 0 { return 0 }
        let coins = coins.sorted()
         
        // dp[i] = the fewest number of coins that you need to make up i amount
        
        for i in 1...amount {
            for j in 0..<coins.count {
                // Early loop exit
                if i < coins[j] { break } 
                let reqIndex = i - coins[j]
                if reqIndex >= 0 , dp[reqIndex] != Int.max {
                   dp[i] = min(dp[i], 1 + dp[reqIndex])
                }
            }
        }

        return dp[amount] == Int.max ? -1 : dp[amount]
    }
}
