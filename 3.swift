// 3. Longest Substring Without Repeating Characters
// https://leetcode.com/problems/longest-substring-without-repeating-characters/description/
// Medium

// Approach: Sliding Widnow , Hash Table , Two Pointers
// TC = O(N) Fastest / Optimal Solution 
// Here we are using map of Character & its last seen index
class Solution1 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let s = Array<Character>(s)
        let n = s.count 
        var map = Dictionary<Character, Int>() // Character -> Last seen index

        var start = 0
        var maxLength = 0
        for i in 0..<n {
            if let prevIndex = map[s[i]] {
                // Ensure start only moves forward to prevent re-including invalid characters
                start = max(start , prevIndex + 1)
            }
            map[s[i]] = i
            maxLength = max(maxLength, i - start + 1)
        }
        return maxLength
    }

    // Ref: https://www.youtube.com/watch?v=92dMI4paQY4
}

/*
Input: s: "ccbbcc" 
You can understand and do dry run on this test case
It will be clear!
why start = max(start , prevIndex + 1)
*/

/*
Question: Why should you convert a String to Array<Character> for string traversal and indexing in Swift?
Answer:
* O(1) Direct Access: Swift strings use Extended Grapheme Clusters to process variable-width Unicode characters correctly. 
Because character byte lengths vary, accessing arbitrary positions or counting offsets using String.Index takes O(n) linear time. 
Converting to Array<Character> allows true O(1) constant-time integer subscripting (array[i]).
* Clean & Simple Arithmetic: Integer indices enable standard math (i + 1, i - j) for position lookups and distance calculations, eliminating verbose String.Index offset calls like s.index(s.startIndex, offsetBy: i) or s.distance(from:to:).
* Predictable Execution Speed: You pay a single O(n) memory and time cost upfront to create the array, ensuring fast, constant-time lookups throughout all subsequent iterations.
*/

// Approach: Sliding Widnow , Hash Table , Two Pointers
// TC = O(2*N) = O(N) , it has while loop, it looks like O(N^2) , but it is O(2N)
// Here we are using map of Character & its frequency
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let s = Array<Character>(s)
        let n = s.count 
        var map = Dictionary<Character, Int>() // Character -> Frequency

        var start = 0
        var maxLength = 0
        for i in 0..<n {
            // if already present, then move start pointer forward, till duplicate removed
            while(map[s[i], default: 0] > 0) {
                map[s[start], default: 0] -= 1
                start += 1
            }
            map[s[i] , default: 0] += 1
            maxLength = max(maxLength, i - start + 1)
        }
        return maxLength
    }
    // Ref: https://www.youtube.com/watch?v=92dMI4paQY4
}
