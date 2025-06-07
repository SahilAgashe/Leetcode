// 169. Majority Element
// https://leetcode.com/problems/majority-element/description/
// Easy 

// Follow-up: Could you solve the problem in linear time and in O(1) space?
// Solution: Boyer-Moore Majority Voting Algorithm
class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var votes = 0
        var candidate = -1
        // First Traversal 
        for element in nums {
            if votes == 0 {
                candidate = element 
                votes = 1
            } else {
                if element == candidate { votes = votes + 1} 
                else { votes = votes - 1}
            }
        }

        // Second Traversal 
        var count = 0
        for element in nums {
            if element == candidate {
                count = count + 1
            }
        }
        if count > (nums.count / 2) {
            return candidate
        } else {
            // no majority element exists
            return -1 
        }

    }
}

// https://www.geeksforgeeks.org/boyer-moore-majority-voting-algorithm/ 