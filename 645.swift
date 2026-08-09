// 645. Set Mismatch
// https://leetcode.com/problems/set-mismatch/description/
// Easy 


class OptimalSolution {
    // TC = O(N), Single Pass Of For-Loop
    func findErrorNums(_ nums: [Int]) -> [Int] {
        var nums = nums
        var duplicate = -1
        let n = nums.count
        let sumOfN: Int = (n * (n + 1)) / 2
        var currSum: Int = 0 
        // Find duplicate number
        for num in nums {
            let val = abs(num)
            currSum += val
            let targetIndex = val - 1
            if nums[targetIndex] < 0 {
                // Negative means, Already visited index 
                duplicate = val
            } else {
                nums[targetIndex] *= -1
            }
        }

        let missing = sumOfN - (currSum - (duplicate))
        return [duplicate, missing]
    }

    /*
        Optimal Time & Space:
        Time Complexity: O(N) — single pass over the array.
        Space Complexity: O(1) auxiliary space — mutates the array in-place without extra heap allocations.
        Integer Safety: Uses standard 64-bit Swift Int, preventing the precision loss previously present with Float.
    */
}

class Solution {
    // TC = O(2N) = O(N), Two Passes of For-Loop
    func findErrorNums(_ nums: [Int]) -> [Int] {
        var nums = nums
        var duplicate = -1
        var missing = -1

        // Find duplicate number
        for num in nums {
            let val = abs(num)
            let targetIndex = val - 1
            if nums[targetIndex] < 0 {
                // Negative means, Already visited index 
                duplicate = val
            } else {
                nums[targetIndex] *= -1
            }
        }

        // Find missing number
        for (index, num) in nums.enumerated() {
            // if positive number, means we never get its index in above loop
            if num > 0 {
                missing = index + 1
                break
            }
        }

        return [duplicate, missing]
    }

    /*
        Optimal Time & Space:
        Time Complexity: O(N) — single pass over the array.
        Space Complexity: O(1) auxiliary space — mutates the array in-place without extra heap allocations.
        Integer Safety: Uses standard 64-bit Swift Int, preventing the precision loss previously present with Float.
    */
}


/*
n sized array => 1 to n 
indexes = 0 to n - 1 
so logic is we can map element to index 
*/

