// 2965. Find Missing and Repeated Values
// https://leetcode.com/problems/find-missing-and-repeated-values/description/
// EASY

class Solution {
    func findMissingAndRepeatedValues(_ grid: [[Int]]) -> [Int] {
        let n = grid.count
        var freqArr = Array<Int>(repeating: 0, count: ((n * n) + 1))
        var ans: [Int] = [0, 0]

        for oneDArr in grid {
            for ele in oneDArr {
                freqArr[ele] = freqArr[ele] + 1
                if freqArr[ele] == 2 {
                    ans[0] = ele
                }
            }
        }

        for i in 1..<freqArr.count {
            if freqArr[i] == 0 {
                ans[1] = i
                break
            }
        }

        return ans
    }
}