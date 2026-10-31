// 5. Longest Palindromic Substring
// https://leetcode.com/problems/longest-palindromic-substring/description/
// Medium


// Approach: Two Pointers Approach 
// TC => O(N * N) 
class Solution {
    func longestPalindrome(_ s: String) -> String {
        let s = Array(s)

        var startIndex = 0
        var endIndex = 0
        var L = 0

        // TC = O(N)
        for i in 0..<s.count {
            let oddLength = expand(i, i, s)
            let evenLength = expand(i, i + 1, s)
            var isOddMax = false
            if oddLength > evenLength {
                isOddMax = true
            }

            if isOddMax {
                if oddLength > L {
                  startIndex = i - (oddLength / 2)
                  endIndex =  i + (oddLength / 2)
                  L = endIndex - startIndex + 1
                }
            } else {
                if evenLength > L {
                  startIndex = i - (evenLength / 2) + 1
                  endIndex =  i + (evenLength / 2)
                  L = endIndex - startIndex + 1
                }
            }

        }

        return String(s[startIndex...endIndex])
    }

    // TC = O(N/2)
    private func expand(_ left: Int, _ right: Int, _ s: [Character]) -> Int {
        var left = left
        var right = right
        while (left >= 0 && right < s.count && s[left] == s[right]) {
            left -= 1
            right += 1
        }

        let length = (right - 1) - (left + 1) + 1 // OR right - left - 1
        return length
    }
}

/*

for odd legth palindrome, for index i  ===>>>
L = currMaxLegth 
start = i - (L / 2)
end =  i + (L / 2)
example: aba , L = 3 , currently at b , i = 1

for even length palindrome, for index i  ===>>>
L = currMaxLegth 
start = i - (L / 2) + 1
end =  i + (L / 2)
example: aa , L = 2 , currently at first a , i = 0 

*/

// Optimal Approach: Manacher's Algorithm
// TC = O(N)
// SC = O(N)
