// 1. Two Sum
// https://leetcode.com/problems/two-sum/description/
// Easy

class Solution {

    func twoSum(_ nums: [Int], _ target: Int) -> [Int] { 
        var indexMap = [Int: Int]() // Map of Element -> Index
        let n = nums.count 
        var ans = [Int]()
        for i in 0..<n {
            if let otherElementIndex = indexMap[target - nums[i]] {
                ans = [otherElementIndex, i]
                break
            } else {
                indexMap[nums[i]] = i
            }
        }
        return ans

        // TC = O(N)
        // SC = O(N)
    }

    // Two Sum Variation: We are returning two numbers that adds upto sum
    // We can use Set instead of Dictionary TC = O(N) , SC = O(N)
    // If Space complexity is constraint, We can solve using Sorting & Two Pointer approach
    // TC = O(Nlogn) to sort 
    // SC = O(1) if in-place sort.
    // Check for Leetcode 167. Two Sum II - Input Array Is Sorted
    func twoSumModifiedVersion(_ nums: [Int], _ target: Int) -> [Int] {
        var nums = nums
        // in-place sort
        nums.sort() 
        let n = nums.count
        var low = 0
        var high = n - 1
        var ans = [Int]()
        while (low < high) {
            let sum = nums[low] + nums[high]
            if sum == target {
                ans = [nums[low], nums[high]]
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
