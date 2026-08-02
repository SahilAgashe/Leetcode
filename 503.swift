// 503. Next Greater Element II
// https://leetcode.com/problems/next-greater-element-ii/description/
// Medium (Easy As Per SAA)


class Solution {
    // TC = O(2n) , SC = O(n)
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var stack = [Int]()
        var answer = [Int](repeating: -1, count: n)

        // TC = O(2n) = O(n)
        for i in (0..<(2 * n)).reversed() {
            let num = nums[i % n]

            // TC = O(1)
            while let top = stack.last, num >= top {
                stack.popLast()
            }

            // if stack top exists such that top > num, otherwise assign -1 as default
            answer[i % n] = stack.last ?? -1

            // push current element on stack for others
            stack.append(num)
        }

        return answer
    }
}

/*
For circular, we can just traverse array two times
And use modulo operator.
Traverse from 0 to 2n - 1, update answer for 0 to n - 1 using modulo operator.
*/
