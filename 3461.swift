// 3461. Check If Digits Are Equal in String After Operations I
// https://leetcode.com/problems/check-if-digits-are-equal-in-string-after-operations-i/description/
// Easy 

class Solution {
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
