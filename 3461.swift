// 3461. Check If Digits Are Equal in String After Operations I
// https://leetcode.com/problems/check-if-digits-are-equal-in-string-after-operations-i/description/
// Easy 

class Solution {
    // Better Naive Solution 
    func hasSameDigits(_ s: String) -> Bool {
        let n = s.count
        var digits = s.map { Int(String($0)) ?? 0 }

        if n == 2 {
            return digits[0] == digits[1] ? true : false
        }

        // for n > 2 , 
        // there will be n - 2 operations
        var counter = n - 2 
        var updatedSize = n
        while counter > 0 {
            for i in 1..<updatedSize {
                digits[i - 1] = (digits[i] + digits[i - 1]) % 10
            }
            counter -= 1
            updatedSize -= 1
        }
        return digits[0] == digits[1] ? true : false
    }

}

class NaiveSolution {
    func hasSameDigits(_ s: String) -> Bool {
        var n = s.count
        var s = s
        var newString: String = ""
        while n > 2 {
            newString = operation(s)
            s = newString
            n = newString.count
        }

        if newString.count == 2 {
            let array = Array<Character>(newString)
            return array.first == array[1] ? true : false
        }

        return false
    }

    func operation(_ s: String) -> String {
        let s = Array<Character>(s)
        let n = s.count 
        if n <= 2 { return ""}
        var result = ""
        for i in 1..<n {
            let strCh: String = String(s[i])
            let digit = Int(strCh) ?? 0
            let prevDigit = Int(String(s[i - 1])) ?? 0
            let sum = (digit + prevDigit) % 10 
            result.append("\(sum)")
        }
        return result
    }
}