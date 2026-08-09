// 268. Missing Number
// https://leetcode.com/problems/missing-number/description/
// Easy

class SolutionUsingSum {
    func missingNumber(_ nums: [Int]) -> Int {
        let n = nums.count
        let sumOfNums = nums.reduce(0, {$0 + $1})
        let sumOfFirstN = ((n + 1) * n) / 2
        return sumOfFirstN - sumOfNums
    }
}

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let n = nums.count
        let xorOfNums = nums.reduce(0, {$0 ^ $1})
        let xorOfFirstN = (1..<(n + 1)).reduce(0, {$0 ^ $1})
        // We can also use Closed Range, And also can convert first it into array. 
        // let xorOfFirstN = (1...n).reduce(0, {$0 ^ $1})
        // let xorOfFirstN = Array<Int>(1..<(n + 1)).reduce(0, {$0 ^ $1})
        // let xorOfFirstN = Array<Int>(1...n).reduce(0, {$0 ^ $1})
        return xorOfNums ^ xorOfFirstN
    }
}
/*
    0 XOR 0 = 0
    0 XOR 1 = 1 
    1 XOR 0 = 1
    1 XOR 1 = 0 
    Odd number of ones = 1
    Even number of ones = 0
    0 XOR A = A 
*/
