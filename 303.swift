// 303. Range Sum Query - Immutable
// https://leetcode.com/problems/range-sum-query-immutable/description/
// Easy 

class NumArray {
    private var prefixSumArray: Array<Int>

    // TC = O(n)
    init(_ nums: [Int]) {
        let n = nums.count
        prefixSumArray = Array<Int>(repeating: 0, count: n)
        var tempSum = 0
        for i in 0..<nums.count {
            tempSum += nums[i]
            prefixSumArray[i] = tempSum
        }
    }
    
    // TC = O(1)
    func sumRange(_ left: Int, _ right: Int) -> Int {
        var ans = prefixSumArray[right]
        if (left - 1) >= 0 {
            ans = ans - prefixSumArray[left - 1]
        }
        return ans
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * let ret_1: Int = obj.sumRange(left, right)
 */
