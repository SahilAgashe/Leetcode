// 283. Move Zeroes
// https://leetcode.com/problems/move-zeroes/description/
// Easy 


class Solution1 {
    func moveZeroes(_ nums: inout [Int]) {
        var indexToUpdate = 0
        for i in 0..<nums.count {
            if nums[i] == 0 {
                continue
            } else {
                nums.swapAt(i , indexToUpdate)
                indexToUpdate += 1
            }
        }
    }
}

class Solution2 {
    func moveZeroes(_ nums: inout [Int]) {
        var indexToUpdate = 0
        for i in 0..<nums.count {
            if nums[i] != 0 {
                nums.swapAt(i , indexToUpdate)
                indexToUpdate += 1
            }
        }
    }
}

class Solution3 {
    func moveZeroes(_ nums: inout [Int]) {
        var indexToUpdate = 0
        for i in 0..<nums.count {
            if nums[i] != 0 {
                if i != indexToUpdate {
                    nums.swapAt(i , indexToUpdate)
                }
                 indexToUpdate += 1
            }
        }
    }
}

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var writeIndex = 0
        for (readIndex, value) in nums.enumerated() {
            if value != 0 {
                if readIndex != writeIndex {
                    nums.swapAt(readIndex, writeIndex)
                }
                 writeIndex += 1
            }
        }
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
