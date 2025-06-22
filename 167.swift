// 167. Two Sum II - Input Array Is Sorted
// https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/description/ 
// Medium

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        let n = numbers.count
        var low = 0
        var high = n - 1
        while low < high {
            let sum = numbers[low] + numbers[high]
            if sum == target { return [low + 1, high + 1]}
            else if sum > target { high = high - 1}
            else { low = low + 1}
        }
        return []
    }
}
