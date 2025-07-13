// 9. Palindrome Number
// https://leetcode.com/problems/palindrome-number/description/
// Easy

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        return getReverse(x) == x
    }

    func getReverse(_ x: Int) -> Int {
        var n = x 
        var sum = 0
        while n > 0 {
            let rem = n % 10
            sum = sum * 10 + rem
            n = n / 10
        }
        return sum
    }
}