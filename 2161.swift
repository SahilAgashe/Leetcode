// 2161. Partition Array According to Given Pivot
// https://leetcode.com/problems/partition-array-according-to-given-pivot/description/
// Medium (Easy As Per SAA)

class Solution {
    // TC = O(n), SC = O(n)
    func pivotArray(_ nums: [Int], _ pivot: Int) -> [Int] {
        var less = [Int]()
        var equal = [Int]()
        var greater = [Int]()

        for num in nums {
            if num < pivot {
                less.append(num)
            } else if num > pivot {
                greater.append(num)
            } else {
                equal.append(num)
            }
        }
        return less + equal + greater
    }
}
