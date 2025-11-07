// 3370. Smallest Number With All Set Bits
// https://leetcode.com/problems/smallest-number-with-all-set-bits/description/
// EASY 

class Solution {
    func smallestNumber(_ n: Int) -> Int {
        // let "x" is the minimum number of bits required to 'n' for its binary representation
        // Largest number possible with 'x' bits => 2^x - 1
        var count = 0
        var temp = n
        while temp != 0 {
            temp = temp >> 1
            count += 1
        }
        // 1 << x ==> 2^x
        let ans = (1 << count) - 1
        return ans
    }
}
