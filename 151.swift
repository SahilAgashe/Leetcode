// 151. Reverse Words in a String
// https://leetcode.com/problems/reverse-words-in-a-string/description/
// Medium 

class Solution {
    func reverseWords(_ s: String) -> String {
        var s = Array<Character>(s)
        let n = s.count
        var ans = Array<Character>() 
        var word = Array<Character>()

        for i in 0..<n {
            if s[i] == " " {
                reverse(&word, low: 0, high: word.count - 1)
                if !word.isEmpty { 
                    ans.append(" ")
                    ans.append(contentsOf: word)
                    word = []
                }
            } else {
                word.append(s[i])
            }
        }
        if s[n - 1] != " " {
                reverse(&word, low: 0, high: word.count - 1)
                ans.append(" ")
                ans.append(contentsOf: word)
                word = []
        }
        ans.removeFirst()
        reverse(&ans, low: 0, high: ans.count - 1)
        return String(ans)
    }

    func reverse(_ s: inout Array<Character>, low: Int, high: Int) {
        guard low >= 0 , high < s.count else { return }
        var low = low
        var high = high
        while low < high {
            let lowStringIndex = low // s.index(s.startIndex, offsetBy: low)
            let highStringIndex = high // s.index(s.startIndex, offsetBy: high)
            let temp = s[lowStringIndex]
            s[lowStringIndex] = s[highStringIndex]
            s[highStringIndex] = temp
            low = low + 1
            high = high - 1
        }
    }
}