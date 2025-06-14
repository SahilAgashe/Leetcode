// 242. Valid Anagram
// https://leetcode.com/problems/valid-anagram/description/
// Easy 

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        optimalSolve(s,t)
        //naiveSolve(s,t)
    }

    // Optimal Approach: TC = O(n)
    func optimalSolve(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }

        var charMap = Dictionary<Character,Int>() // Character <--> Frequency
        let n = s.count

        let s = Array<Character>(s)
        let t = Array<Character>(t)

        for i in 0..<n {
            if let value = charMap[s[i]] {
                charMap[s[i]] = value + 1
            } else { charMap[s[i]] = 1 }

            if let value = charMap[t[i]] {
                charMap[t[i]] = value - 1
            } else { charMap[t[i]] = -1 }
        }

        for value in charMap.values {
            if value != 0 { return false }
        }
        return true
    }

    // Naive Approach: TC = O(nlogn)
    func naiveSolve(_ s: String, _ t: String) -> Bool {
        let s = s.sorted()
        let t = t.sorted()
        return s == t
    }
}

/*
Naive Approach => Sort strings, then compare : TC = nlogn , n is the size of an array
Optimal Approach => 
Use frequency map ,
increase count for first string traversal , 
decrease count for second string traversal ,
check frequency map , all frequencies must be zero for anagram
*/

