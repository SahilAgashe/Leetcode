// 540. Single Element in a Sorted Array
// https://leetcode.com/problems/single-element-in-a-sorted-array/description/
// Medium 

// Approach: Binary Search 
// TC = O(log n)
class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left < right {
            var mid = left + (right - left) / 2
            
            // Ensure `mid` is always an EVEN index so we compare pair start (even) with pair end (odd)
            if mid % 2 == 1 {
                mid -= 1
            }
            
            // Compare the even index with its next neighbor
            if nums[mid] == nums[mid + 1] {
                // Pair is valid, single element must be on the right side
                left = mid + 2
            } else {
                // Pair is broken, single element is mid or on the left side
                right = mid
            }
        }
        
        return nums[left]
    }
}

/*
Why not left <= right 
=> 
if left == right, and mid is even, then again right = mid, so it will be infinite loop.
So, We need to make , left < right and return nums[left] 
*/
