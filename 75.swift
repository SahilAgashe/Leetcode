// Leetcode 75.Sort Colors
// https://leetcode.com/problems/sort-colors/description/
// Medium (As per SAA, It is very once you understand!!! And You can Believe That!)

class Solution {
    // DNF Algorithm (Dutch National Flag Algorithm) OR 3-way partitioning Algorithm
    func sortColors(_ nums: inout [Int]) {
        let n = nums.count
        var low = 0
        var mid = 0 
        var high = n - 1

        while mid <= high {
            if nums[mid] == 0 {
                nums.swapAt(mid, low)
                low += 1
                mid += 1
            } else if nums[mid] == 1 {
                mid += 1
            } else { // else if nums[mid] == 2
                nums.swapAt(mid, high)
                high -= 1
            }
        }
    }
}

// 0 to low - 1 (All zeros)
// low to mid - 1 (All ones)
// mid to high (Unexplored area) (xxxxx)
// high + 1 to n - 1 (All twos)

// Imagine array as using above indexing
// 00000 11111 xxxxx 22222

// Solution follow => Striver's Video(Better) or Gemini Explaination for understanding!. It's very easy!!!
