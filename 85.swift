// 85. Maximal Rectangle
// https://leetcode.com/problems/maximal-rectangle/description/
// Hard (Easy As Per SAA, If you 84. Largest Rectangle in Histogram)


class Solution {
    // TC = O(rc) , SC = O(c) for extra stack
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        let r = matrix.count
        let c = matrix[0].count 
        // histogram's bar height
        var heights = Array(repeating: 0, count: c)
        var maxArea = 0

        for i in 0..<r {
            for j in 0..<c {
                let isOne = matrix[i][j] == "1"
                if isOne {
                    heights[j] += 1
                } else { // just assing zero, heights / histogram / building cant float!
                    heights[j] = 0
                }
            }
            let area = largestRectangleArea(heights)
            maxArea = max(maxArea, area)
        }
        return maxArea
    }

    // Intuition : next smaller element & previous smaller element
    // TC = O(n), SC = O(n)
    private func largestRectangleArea(_ heights: [Int]) -> Int {
        let n = heights.count
        var nextSmallerIndex = getNextSmallerIndexArray(heights) // TC = O(n), SC = O(n)
        var previousSmallerIndex = getPreviousSmallerIndexArray(heights) // TC = O(n), SC = O(n)
        print(nextSmallerIndex)
        print(previousSmallerIndex)
        var maxArea = 0

        for (i, h) in heights.enumerated() {
            let l = h 
            var nsi = nextSmallerIndex[i] 
            let psi = previousSmallerIndex[i] 
            // if nsi == -1, it does not exists, means nsi = n 
            // if psi does not exists means, psi = -1 obviously as start index of arr is zero
            // But no need to worry as psi = -1 by default
            if nsi == -1 { 
                nsi = n
            }
            // b = bars btn i and nsi + i's contribution + bars btn psi and i 
            // b = (nsi - i - 1) + 1 + (i - psi -1)
            let b = nsi - psi - 1
            let area = l * b
            maxArea = max(area, maxArea)
        }
        return maxArea
    }

    private func getNextSmallerIndexArray(_ nums: [Int]) -> [Int] {
        // Monotonic Stack: Elements are in decreasing order from top to bottom
        var stack = [Int]() 
        let n = nums.count 
        var ans = [Int](repeating: -1, count: n)

        for i in (0..<n).reversed() {
            let num = nums[i]
            while let topIndex = stack.last, num <= nums[topIndex] {
                stack.popLast()
            }

            // Get index of next smaller element
            ans[i] = stack.last ?? -1

            // Push index of current element
            stack.append(i)
        }
        return ans
    }

    private func getPreviousSmallerIndexArray(_ nums: [Int]) -> [Int] {
        // Monotonic Stack: Elements are in decreasing order from top to bottom
        var stack = [Int]() 
        let n = nums.count 
        var ans = [Int](repeating: -1, count: n)

        for i in 0..<n {
            let num = nums[i]
            while let topIndex = stack.last, num <= nums[topIndex] {
                stack.popLast()
            }

            // Get index of previous smaller element
            ans[i] = stack.last ?? -1

            // Push index of current element
            stack.append(i)
        }
        return ans
    }
}
