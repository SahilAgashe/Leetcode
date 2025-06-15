// 125. Valid Palindrome
// https://leetcode.com/problems/valid-palindrome/description/
// Easy 

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let s = s.filter({$0.isLetter || $0.isNumber}).lowercased()
        let n = s.count
        let arr = Array<Character>(s)
        var low = 0
        var high = n - 1

        while low < high {
            if arr[low] != arr[high] { return false }
            low += 1
            high -= 1 
        }
        return true
    }
}