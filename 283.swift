// 283. Move Zeroes
// https://leetcode.com/problems/move-zeroes/description/
// Easy 


class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var writeIndex = 0
        for (readIndex, num) in nums.enumerated() {
            if num != 0 {
                if writeIndex != readIndex {
                    nums.swapAt(writeIndex, readIndex)
                }
                writeIndex += 1
            } 
        }
        return 
    }
}

/*
Why This Is Optimal
1. Eliminates Self-Swapping: Adding if writeIndex != readIndex ensures you perform 0 array write operations until the first zero is encountered.
2. Optimal Time Complexity: O(n) — Single pass through the array.
3. Optimal Space Complexity: O(1) — In-place mutation with zero extra memory allocations.
4. Swift Standard Practice: nums.enumerated() provides clean access to indices and values without indexing overhead, and swapAt executes efficiently in memory.
This code will achieve optimal performance runtime on LeetCode.
*/
