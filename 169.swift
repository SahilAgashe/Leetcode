// 169. Majority Element
// https://leetcode.com/problems/majority-element/description/
// Easy 

// Follow-up: Could you solve the problem in linear time and in O(1) space?
// Solution: Boyer-Moore Majority Voting Algorithm
// https://www.geeksforgeeks.org/boyer-moore-majority-voting-algorithm/ 

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        let n = nums.count
        var votes = 0
        var candidate = -1

        // first pass O(N), to select potential candidate
        for i in 0..<n {
            if votes == 0 {
                votes = 1 
                candidate = nums[i]
            } else {
                if nums[i] == candidate {
                    votes += 1
                } else {
                    votes -= 1
                }
            }
        }

        // As question mention, there is always majority element, we can just return without validating potential candidate, which is required process as per the Boyer–Moore Voting Algorithm.
        return candidate

        // second pass O(N), to validate majority element
        var count = 0
        for i in 0..<n {
            if nums[i] == candidate {
                count += 1
            }
        }
        if count > (n / 2) {
            return candidate
        } else { 
            return -1
        }
    }
}

/*
The Boyer–Moore Voting Algorithm efficiently finds the majority element in an array—an element that appears more than N/2 times—using two passes. In the first pass, it selects a potential candidate by increasing a counter when the same element is encountered and decreasing it when a different element appears, effectively canceling out non-majority elements. In the second pass, the algorithm verifies whether this candidate actually occurs more than N/2 times. This method runs in O(N) time and requires only O(1) extra space, making it both fast and memory-efficient.
*/
