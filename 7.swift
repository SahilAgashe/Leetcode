// 7. Reverse Integer
// https://leetcode.com/problems/reverse-integer/description/
// Medium, but Easy as per SAA

class Solution {
    func reverse(_ x: Int) -> Int {
        var num = x
        var reverse = 0
        while num != 0 {
            let rem = num % 10 
            reverse = reverse * 10 + rem 
            num = num / 10
        }
        // Overflow check for 32 bit integer
        if reverse > Int32.max  || reverse < Int32.min {
            return 0
        }

        return reverse
    }
}
// Time Complexity: O(log|x|) with base 10
// Space Complexity: O(1) — constant space
