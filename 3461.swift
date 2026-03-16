// 3461. Check If Digits Are Equal in String After Operations I
// https://leetcode.com/problems/check-if-digits-are-equal-in-string-after-operations-i/description/
// Easy 

class Solution {
    func hasSameDigits(_ s: String) -> Bool { 
        let n = s.count 
        var digits: [Int] = s.map { Int(String($0)) ?? 0 }

        // base conditions
        if n < 2 { return false}
        if n == 2 { return digits[0] == digits[1] }

        // if n > 2 
        var temp = n
        var lastIndex = n - 1
        while lastIndex >= 2 {
            for i in 0...(lastIndex - 1) {
                let t = digits[i] + digits[i + 1]
                digits[i] = t % 10
            }
            lastIndex -= 1
        }
        return digits[0] == digits[1]
    }
}