// 88. Merge Sorted Array
// https://leetcode.com/problems/merge-sorted-array/description/
// Easy

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = m - 1 
        var j = n - 1 
        var k = m + n - 1

        while i >= 0 && j >= 0 {
            if nums1[i] <= nums2[j] {
                nums1[k] = nums2[j]
                k = k - 1
                j = j - 1
            } else {
                nums1[k] = nums1[i]
                k = k - 1
                i = i - 1
            }
        }

        // If there are any remaining elements from nums2, then add those in begining
        if j >= 0 {
         for ind in 0...j {
             nums1[ind] = nums2[ind]
         }
        }

    }

/*
Rough Algorithm: 
nums1 = m
nums2 = n 
mainArray Size => m + n 
Step 1: I will compare last elements, start filling array nums1 from (m + n - 1)
Step 2: If there are any remaining elements from nums2, then add those in begining
*/
}