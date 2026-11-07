// 564. Find the Closest Palindrome
// https://leetcode.com/problems/find-the-closest-palindrome/description/
// Hard

class Solution {
    // Time Complexity: O(L), where L is the number of digits in n. String operations and conversions run in time proportional to the length of the string (at most 18 digits in LeetCode bounds).
    // Space Complexity: O(L) to store the candidate strings.
    func nearestPalindromic(_ n: String) -> String {
        let l = n.count // length
        guard let num = Int64(n) else { return "" } 
        var candidates = Set<Int64>() 

        // 1. Boundaries (Exact integer calculation)
        let candidate1 = Int64(pow(10.0 , Double((l - 1)))) - 1
        candidates.insert(candidate1)
        let candidate2 = Int64(pow(10.0, Double(l))) + 1
        candidates.insert(candidate2)

        // 2. Extract prefix
        let prefixLength = (l + 1) / 2 
        let prefixStr = String(n.prefix(prefixLength))
        guard let prefix = Int64(prefixStr) else { return "" }

        // 3. Mirror prefix - 1, prefix, prefix + 1
        for candidate in [prefix , prefix - 1 , prefix + 1] {
            let str = String(candidate)
            let isEven = (l % 2) == 0

            var newStr: String = isEven ? (str + str.reversed()) : ( str + str.dropLast().reversed())
            let value = Int64(newStr)! 
            candidates.insert(value)
        }

        // 4. Remove original number
        candidates.remove(num)

        // 5. Select closest candidate
        var bestCandidate: Int64 = Int64.max
        var minDiff = Int64.max
        for candidate in candidates {
            let diff = abs(candidate - num) 
            if diff < minDiff || (diff == minDiff && candidate < bestCandidate ) {
                minDiff = diff
                bestCandidate = candidate 
            }
        }

        return String(bestCandidate)
    }
}
/*
The core idea is to realize that the closest palindrome to an integer n (represented as a string)
is almost always formed by manipulating the first half (prefix) of the string.

Key Intuition
If n = 12345, its prefix is 123. The most natural palindrome we can construct with the same number of digits is formed by mirroring 123 =>  12321
However, to find the closest palindrome (and handle edge cases where changing digits changes length, like 1000  to 999 or 999 to 1001), we only need to test 5 candidate palindromes:
1. Mirror the prefix directly: prefix P
2. Mirror prefix - 1: prefix P - 1
3. Mirror prefix + 1: prefix P + 1
4. Lower boundary power of 10: 10^{L-1} - 1 (e.g., for 4-digit numbers, 999)
5. Upper boundary power of 10: 10^L + 1 (e.g., for 4-digit numbers, 10001)
Note: We explicitly exclude n itself from the candidates because the problem requires finding a palindrome different from n.


Worked Example: n = "12345"
* Length L = 5. Prefix of length ceil(5 / 2) = 3 is 123.
* Candidates:
    * Mirror 123 -> 12321 (abs diff: 12321 - 12345 = 24)
    * Mirror (123 - 1) = 122 -> 12221 (abs diff: 12221 - 12345 = 124)
    * Mirror (123 + 1) = 124 -> 12421 (abs diff: 12421 - 12345 = 76$)
    * Boundary low: $10^{4} - 1 = 9999 (abs diff: 9999 - 12345 = 2346)
    * Boundary high: $10^{5} + 1 = 100001 (abs diff: 100001 - 12345 = 87656)
* Minimum Difference: 24, achieved by 12321.
*/
