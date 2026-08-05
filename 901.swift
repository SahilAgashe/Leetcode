// 901. Online Stock Span
// https://leetcode.com/problems/online-stock-span/description/
// Medium (Easy As Per SAA)
// Type: Monotonic Stack Previous/Next Greater Element

class StockSpanner {
    // Tuple of element & its index
    var stack: Array<(Int, Int)> 

    // Indexing for the Days
    var index: Int 

    init() {
        stack = Array<(Int, Int)>()
        index = 0
    }
    
    // TC = O(n) , SC = O(n)
    func next(_ price: Int) -> Int {
        // We need to find index of (PGE)previous greater element
        // Span of the day => current index - PGE index
        while let top = stack.last, price >= top.0 {
            stack.popLast()
        }

        // if no previous greater element, means it should be -1 index
        let pge = stack.last?.1 ?? -1 
        let ans = index - pge

        // push current element and its index for next elements
        stack.append((price, index))
        // update index for next element
        index += 1 
        return ans
    }
}

/**
 * Your StockSpanner object will be instantiated and called as such:
 * let obj = StockSpanner()
 * let ret_1: Int = obj.next(price)
 */
