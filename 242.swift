// 242. Valid Anagram
// https://leetcode.com/problems/valid-anagram/description/
// Easy


// Approach: Hash Map of Characters And its frequency
// Follow Up: What if the inputs contain Unicode characters?
// How would you adapt your solution to such a case?
// then this is the correct solution for follow up question
// TC = O(n) , SC = O(n)
class Solution1 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        let s = Array(s)
        let t = Array(t)
        var map = Dictionary<Character, Int>()

        if s.count != t.count { return false }

        for i in 0..<s.count {
            map[s[i], default: 0] += 1
            map[t[i], default: 0] -= 1
        }

        for (key, value) in map {
            // print("key => \(key)", "value => \(value)")
            if value != 0 {
                return false
            }
        }
        return true
    }
}

// Notes
// Ascii values of a to z => 97 to 122 
// Ascii values of A to Z => 65 to 90


// Approach: Hash Map of Characters And its frequency
// Optimal solve as here input string contains only lowercase english letters
// Space Optimal Approach
// TC = O(n) , SC = O(26) = O(1)
class Solution2 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }

        var mapArray = Array(repeating: 0, count: 26)
        let s = Array(s)
        let t = Array(t)
        let n = s.count 


        for i in 0..<n {
            let asciiValueOfCh1 = Int(s[i].asciiValue ?? 0)
            let asciiValueOfCh2 = Int(t[i].asciiValue ?? 0)
            mapArray[asciiValueOfCh1 - 97] += 1
            mapArray[asciiValueOfCh2 - 97] -= 1
        }

        for i in 0..<26 {
            if mapArray[i] != 0 {
                return false
            }
        }
        return true
    }
}


// Approach: Hash Map of Characters And its frequency
// Optimal solve as here input string contains only lowercase english letters
// Without using new Array of characters 
// Space Optimal Approach
// TC = O(n) , SC = O(26) = O(1)
class Solution3 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }

        var mapArray = Array(repeating: 0, count: 26)
        let n = s.count 

        for (ch1, ch2) in zip(s, t) {
            let asciiValueOfCh1 = Int(ch1.asciiValue ?? 0)
            let asciiValueOfCh2 = Int(ch2.asciiValue ?? 0)
            mapArray[asciiValueOfCh1 - 97] += 1
            mapArray[asciiValueOfCh2 - 97] -= 1
        }

        for i in 0..<26 {
            if mapArray[i] != 0 {
                return false
            }
        }

        return true
    }
}

// Approach: Sorting : TC = O(nlog) And SC = O(1) 
class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }

        return s.sorted() == t.sorted()
    }
}
