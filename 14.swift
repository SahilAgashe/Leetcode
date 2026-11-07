// 14. Longest Common Prefix
// https://leetcode.com/problems/longest-common-prefix/description/
// Easy


// TC = O(n) , n = strs size
// SC = O(s) , s = string length as in swift we are creating new array of characters from string
class Solution1 {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var ans = ""
        for (index , str) in strs.enumerated() {
            if index == 0 {
                ans = str
            } else {
                ans = getCommonPrefix(ans, str)
            }

            if ans.isEmpty { return ans }
        }
        return ans
    }

    private func getCommonPrefix(_ str1: String , _ str2: String) -> String {
        let str1 = Array(str1)
        let str2 = Array(str2)
        let l = min(str1.count , str2.count) 
        var ans = ""
        for i in 0..<l {
            if str1[i] == str2[i] {
                ans.append(str1[i])
            } else {
                return ans
            }
        }

        return ans
    }
}

// TC = O(n)
// SC = O(1)
class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard !strs.isEmpty , !strs[0].isEmpty else { return "" }
        var prefix = strs[0]

        for str in strs.dropFirst() {
            while !str.hasPrefix(prefix) {
                prefix.removeLast() 
                if prefix.isEmpty {
                    return prefix
                }
            }
        }
        return prefix
    }
}
