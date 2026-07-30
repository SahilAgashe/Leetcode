// 1047. Remove All Adjacent Duplicates In String
// Easy 
// https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string/description/ 

class Solution {
    func removeDuplicates(_ s: String) -> String {
        var stack = [Character]()
        for char in s {
            // top of stack is stack.last
            if let last = stack.last, last == char {
                stack.popLast()
            } else {
                stack.append(char)
            }
        }
        return String(stack)
    }
}

// Note: This problem covers push , pop , top of Stack.
