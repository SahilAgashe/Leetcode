// 2390. Removing Stars From a String
// Medium (But it is very easy as per SAA)
// https://leetcode.com/problems/removing-stars-from-a-string/description/

class Solution {
    func removeStars(_ s: String) -> String {
        var stack = Array<Character>()
        for ch in s {
            if ch == "*" {
                stack.popLast()
            } else {
                stack.append(ch)
            }
        }
        return String(stack)
    }
}

/*
popLast() vs removeLast(): Mention that popLast() returns an Optional 
and safely handles popping without crashing if the stack were empty (defensive programming).
*/
