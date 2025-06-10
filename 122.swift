// 122. Best Time to Buy and Sell Stock II
// https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/description/
// Medium

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        var totalProfit = 0

        for i in 1..<n {
            if prices[i] > prices[i - 1] {
                totalProfit = totalProfit + (prices[i] - prices[i-1])
            }
        }

        return totalProfit
    }
}
/* 
Note:
for [a, b, c, d] , such that a < b < c < d 
d - a => (b - a) + (c - b) + (d - c)
*/

// Other approaches 
// Recursion, Memoization, DP