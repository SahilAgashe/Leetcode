// 392. Is Subsequence
// https://leetcode.com/problems/is-subsequence/description/
// Easy 

class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        if s.count > t.count { return false }
        if s.isEmpty { return true }

        let sArr = Array<Character>(s)
        var i = 0 // indexing for sArr

        for ch in t {
            if sArr[i] == ch {
                i += 1
                if i == sArr.count { return true }
            }
        }
        return false 
    }
}

// TODO: - Need to check this follow up! 
/* 
Follow up: Suppose there are lots of incoming s, say s1, s2, ..., sk where k >= 109,
and you want to check one by one to see if t has its subsequence. 
In this scenario, how would you change your code?.
*/