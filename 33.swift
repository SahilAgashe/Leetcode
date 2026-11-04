// 33. Search in Rotated Sorted Array
// https://leetcode.com/problems/search-in-rotated-sorted-array/
// Medium 

// Approach: Binary Search
// TC = O(logN) , SC = O(1)
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0 
        var right = nums.count - 1 

        while left <= right {
            let mid = left + ((right - left) / 2)

            // Base Case 
            // Checking target with middle
            if nums[mid] == target {
                return mid
            } 
            // Left sub-array is sorted in increasing order
            else if nums[mid] >= nums[left] {
                // if target lies in left part
                if target >= nums[left] && target < nums[mid] {
                    right = mid - 1
                } else {
                    // target not in left part
                    left = mid + 1
                }
            } 
            // Right sub-array is sorted
            else { 
                // if target lies in right part
                if target > nums[mid] && target <= nums[right] {
                    left = mid + 1
                } else {
                    // target not in right part
                    right = mid - 1
                }
            }
        }

        return -1 
    }
}
