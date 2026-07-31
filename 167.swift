// 167. Two Sum II - Input Array Is Sorted
// https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/description/ 
// Medium

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        let n = numbers.count
        var low = 0
        var high = n - 1
        var ans = [Int]()
        while (low < high) {
            let sum = numbers[low] + numbers[high]
            if sum == target {
                ans = [low + 1, high + 1]
                break;
            } else if sum < target { 
                low += 1 
            } else { // sum > target
                high -= 1
            }
        }
        return ans
    }   
}
