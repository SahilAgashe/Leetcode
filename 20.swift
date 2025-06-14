// 20. Valid Parentheses
// https://leetcode.com/problems/valid-parentheses/description/
// Easy 

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = Array<Character>() 
        for x in s {
            let ch: Character = x
            if ch == "{" || ch == "(" || ch == "[" { 
                stack.append(ch)
            } else if ch == "}" {
                if let top = stack.last, top == "{" { stack.removeLast() }
                 else { return false }
            } else if ch == ")" {
                if let top = stack.last, top == "(" { stack.removeLast() }
                 else { return false }
            }
            else if ch == "]" {
                if let top = stack.last, top == "[" { stack.removeLast() }
                 else { return false }
            } else {
                return false
            }
        }

        return stack.isEmpty
    }
}
