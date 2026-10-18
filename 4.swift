// 4. Median of Two Sorted Arrays
// https://leetcode.com/problems/median-of-two-sorted-arrays/description/
// Hard, but it is easy!


// TC = O(median of (m + n)) , SC = O(median of (m + n))
// Approach: Two Pointers 
class Solution1 {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let m = nums1.count
        let n = nums2.count 
        let totalSize = m + n
        let isOddSize = (totalSize % 2) == 1
        let medianIndex: Int 
        if isOddSize {
            medianIndex = totalSize / 2
        } else {
            // for even size, median will be average of two middle
            medianIndex = totalSize / 2 
        }
        var finalArray = Array<Int>(repeating: 0, count: medianIndex + 1)

        var i = 0 // iterator for nums1
        var j = 0 // iterator for nums2 
        var k = 0 // iterator for finalArray

        while i < m && j < n && k < (medianIndex + 1){
            if nums1[i] < nums2[j] {
                finalArray[k] = nums1[i]
                 i = i + 1
                 k = k + 1
            } else {
                finalArray[k] = nums2[j]
                 j = j + 1
                 k = k + 1
            }
        }

        // Add remaining elements 
        while i < m && k < (medianIndex + 1) {
            finalArray[k] = nums1[i]
            i = i + 1
            k = k + 1
        }

        // Add remaining elements 
        while j < n && k < (medianIndex + 1) {
            finalArray[k] = nums2[j]
            j = j + 1
            k = k + 1
        }

        if isOddSize {
            return Double(finalArray[medianIndex])
        } else {
            let sum = finalArray[medianIndex] + finalArray[medianIndex - 1]
            return Double(Double(sum) / 2.0)
        }
    }
}


// TC = O(median of (m + n)) , SC = O(1)
// Optimized Space Two Pointers Approch
// Instead of keeping track of all elements, we can just track only two elements
class Solution2 {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let m = nums1.count
        let n = nums2.count 
        let totalSize = m + n
        let isOddSize = (totalSize % 2) == 1
        let medianIndex: Int 
        if isOddSize {
            medianIndex = totalSize / 2
        } else {
            // for even size, median will be average of two middle
            medianIndex = totalSize / 2 
        }

        var i = 0 // iterator for nums1
        var j = 0 // iterator for nums2 
        var k = 0 // iterator for finalArray

        var curr = 0 
        var prev = 0
        var foundMedian = false

        while i < m && j < n && k < (medianIndex + 1) && !foundMedian{
            prev = curr
            if nums1[i] < nums2[j] {
                curr =  nums1[i]
                 i = i + 1
                 k = k + 1
            } else {
                curr = nums2[j]
                 j = j + 1
                 k = k + 1
            }

            if k == (medianIndex + 1) {
                foundMedian = true 
            }
        }

        // Add remaining elements 
        while i < m && k < (medianIndex + 1) && !foundMedian{
            prev = curr
            curr = nums1[i]
            i = i + 1
            k = k + 1
            if k == (medianIndex + 1) {
                foundMedian = true 
            }
        }

        // Add remaining elements 
        while j < n && k < (medianIndex + 1) && !foundMedian{
            prev = curr
            curr = nums2[j]
            j = j + 1
            k = k + 1
            if k == (medianIndex + 1) {
                foundMedian = true 
            }
        }

        if isOddSize {
            return Double(curr)
        } else {
            let sum = curr + prev
            return Double(Double(sum) / 2.0)
        }
    }
}


// Using Binary Search Partition Algorithm 
/*
To achieve the Binary Search Partition approach, instead of merging elements one by one, you divide both arrays into a Left Half and a Right Half such that:

Equal Division: The total number of elements in the combined left half equals the total number of elements in the combined right half.

Sorted Order Preserved: Every element in the combined left half is less than or equal to every element in the combined right half.
*/
// TC = O(log(min(m,n))) , SC = O(1)
class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        // Ensure nums1 is the smaller array to optimize binary search range
        if nums1.count > nums2.count {
            return findMedianSortedArrays(nums2, nums1)
        }
        
        let m = nums1.count
        let n = nums2.count
        var low = 0
        var high = m 
        
        while low <= high {
            let partition1 = (low + high) / 2
            let partition2 = (m + n + 1) / 2 - partition1
            
            let maxLeft1 = (partition1 == 0) ? Int.min : nums1[partition1 - 1]
            let minRight1 = (partition1 == m) ? Int.max : nums1[partition1]
            
            let maxLeft2 = (partition2 == 0) ? Int.min : nums2[partition2 - 1]
            let minRight2 = (partition2 == n) ? Int.max : nums2[partition2]
            
            if maxLeft1 <= minRight2 && maxLeft2 <= minRight1 {
                // Correct partition found
                if (m + n) % 2 == 1 {
                    return Double(max(maxLeft1, maxLeft2))
                } else {
                    let leftMax = Double(max(maxLeft1, maxLeft2))
                    let rightMin = Double(min(minRight1, minRight2))
                    return (leftMax + rightMin) / 2.0
                }
            } else if maxLeft1 > minRight2 {
                // Too far right in nums1
                high = partition1 - 1
            } else {
                // Too far left in nums1
                low = partition1 + 1
            }
        }
        
        return 0.0
    }
}
/*
Visualizing the Partition Logic
Suppose nums1 = [1, 3, 8, 9, 15] (m = 5) and 
nums2 = [7, 11, 18, 19, 21, 25] (n = 6).
Total length = 11 (odd).
 Target left half size = (5 + 6 + 1) / 2 = 6 elements.

Attempt 1: Cut nums1 at middle index 2 (elements: [1, 3] | [8, 9, 15])
  nums1:  1   3   |   8   9   15       -> maxLeft1 = 3,  minRight1 = 8
  nums2:  7  11  18  21 | 25           -> maxLeft2 = 21, minRight2 = 25  (Needs 4 elements from nums2)

Check: maxLeft2 (21) <= minRight1 (8)? FALSE!
Adjustment: 21 is too big for the left side. We need fewer elements from nums2, which means MORE elements from nums1.
Move binary search range in nums1 to the RIGHT (low = partition1 + 1).

---------------------------------------------------------------------------------------------------------

Attempt 2: Cut nums1 at index 3 (elements: [1, 3, 8] | [9, 15])
  nums1:  1   3   8   |   9   15       -> maxLeft1 = 8,  minRight1 = 9
  nums2:  7  11  18   |  21   25       -> maxLeft2 = 18, minRight2 = 21  (Needs 3 elements from nums2)

Check:
  1. maxLeft1 (8) <= minRight2 (21)  -> TRUE
  2. maxLeft2 (18) <= minRight1 (9)  -> FALSE (18 > 9)
Adjustment: Move binary search range in nums1 to the RIGHT again.

---------------------------------------------------------------------------------------------------------

Attempt 3: Cut nums1 at index 4 (elements: [1, 3, 8, 9] | [15])
  nums1:  1   3   8   9   |   15       -> maxLeft1 = 9,  minRight1 = 15
  nums2:  7  11           |   18  21 25 -> maxLeft2 = 11, minRight2 = 18 (Needs 2 elements from nums2)

Check:
  1. maxLeft1 (9) <= minRight2 (18)  -> TRUE
  2. maxLeft2 (11) <= minRight1 (15) -> TRUE

VALID PARTITION FOUND!
Left side:  [1, 3, 8, 9, 7, 11]  (max = 11)
Right side: [15, 18, 21, 25]     (min = 15)

Since total size (11) is odd, Median = max(maxLeft1, maxLeft2) = max(9, 11) = 11.
*/

/*
Step-by-Step Algorithm Rules
1. Always run Binary Search on the smaller array: Set nums1 as the smaller array m <= n. This ensures:
    * Binary search time complexity is O(log(min(m,n))).
    * partition2 = (m + n + 1) / 2 - partition1 is always valid and non-negative.
2. Handle Edge Cases at Boundaries: If a partition lands at index 0 or array boundary m/n:
    * If partition1 == 0: There are no elements in nums1's left part. Set maxLeft1 = -∞.
    * If partition1 == m: There are no elements in nums1's right part. Set minRight1 = +∞.
    * Apply the same logic for maxLeft2 and minRight2.
3. Adjust the Binary Search Window:
    * If maxLeft1 > minRight2: nums1 contributed too many large elements. Move left: high = partition1 - 1.
    * If maxLeft2 > minRight1: nums1 contributed too few elements. Move right: low = partition1 + 1.
4. Calculate Median Once Partition is Valid:
    * Odd total count (m + n is odd): Median = max(maxLeft1, maxLeft2) 
    * Even total count (m + n is even): Median = (max(maxLeft1, maxLeft2) + min(minRight1, minRight2)) / 2.0 

The partition calculation balances the combined left side of both arrays so it holds exactly half of the total elements.
1. Calculating partition1
partition1 represents how many elements from nums1 are placed into the left half.
Since we use binary search on nums1 within the range [0, m] (where m is nums1.count), partition1 is simply the midpoint of the current binary search range:
partition1 = (low + high) / 2
* If partition1 == 0: 0 elements from nums1 are in the left half (all of nums1 is on the right).
* If partition1 == m: All m elements from nums1 are in the left half.
2. Calculating partition2
partition2 represents how many elements from nums2 are placed into the left half.
Once partition1 is chosen, partition2 is fixed automatically because the total number of elements in the combined left half must equal half of the overall total elements:
partition2 = (m + n + 1)/2 - partition1
Why + 1 in (m + n + 1) / 2?
Adding 1 before integer division handles both even and odd total lengths seamlessly:
* Even total length (m + n = 10): (10 + 1) / 2 = 5. The left half gets 5 elements, and the right half gets 5 elements.
* Odd total length (m + n = 11): (11 + 1) / 2 = 6. The left half gets 6 elements, and the right half gets 5 elements.
By making the left half 1 element larger when the total count is odd, the median will always be the maximum element of the left half max(maxLeft1, maxLeft2).
*/
