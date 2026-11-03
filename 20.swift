// 20. Valid Parentheses
// https://leetcode.com/problems/valid-parentheses/description/
// Easy 

// Approach: Stack
// Using if - else
// TC = O(n) , SC = O(n)
class Solution1 {
    func isValid(_ s: String) -> Bool {
        var stack = Array<Character>() 
        let n = s.count 

        for ch in s {
            if ch == "(" || ch == "{" || ch == "[" {
                stack.append(ch)
            } else if ch == ")" {
                if stack.last == "(" {
                    stack.popLast()
                } else {
                    return false
                }  
            } else if ch == "]" {
                if stack.last == "[" {
                    stack.popLast()
                } else {
                    return false
                }  
            } else if ch == "}" {
                if stack.last == "{" {
                    stack.popLast()
                } else {
                    return false
                }  
            }
        }

        return stack.isEmpty
    }
}


// Approach: Stack
// Using Swich | More Optimal 
// TC = O(n) , SC = O(n)
class Solution2 {
    func isValid(_ s: String) -> Bool {
        var stack = Array<Character>() 

        for ch in s {
            switch ch {
                case "(", "{", "[": 
                stack.append(ch)
                case ")": 
                    if stack.last == "(" {
                        stack.popLast()
                    } else {
                        return false
                    } 
                case "]": 
                    if stack.last == "[" {
                        stack.popLast()
                    } else {
                        return false
                    } 
                case "}": 
                    if stack.last == "{" {
                        stack.popLast()
                    } else {
                        return false
                    } 
                default: 
                    return false
            }
        }

        return stack.isEmpty
    }
}


// Approach: Stack
// Less chacter check overhead & Using switch statement
// TC = O(n) , SC = O(n)
class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = Array<Character>() 

        for ch in s {
            switch ch {
                case "(": 
                 stack.append(")")
                case "[": 
                 stack.append("]")
                case "{": 
                 stack.append("}")
                default: 
                 if stack.popLast() != ch {
                    return false
                 }
            }
        }

        return stack.isEmpty
    }
}
