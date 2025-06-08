// 121. Best Time to Buy and Sell Stock
// https://leetcode.com/problems/best-time-to-buy-and-sell-stock/description/
// Easy

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0
        let n = prices.count
        if n < 2 { return maxProfit }
        
        var minValueBeforeIndexI = prices[0]
        for i in 1..<n {
            let valueAtIndexI = prices[i]
            let profitIfSellAtIndexI = valueAtIndexI - minValueBeforeIndexI 
            maxProfit = max(maxProfit, profitIfSellAtIndexI)
            minValueBeforeIndexI = min(minValueBeforeIndexI, valueAtIndexI)
        }
        return maxProfit
    }
}