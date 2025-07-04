// 206. Reverse Linked List
// https://leetcode.com/problems/reverse-linked-list/description/
// Easy 

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var curr = head // to traverse linked list 
        var prev: ListNode? = nil
        // Traverse linked list
        while curr != nil {
            let temp = curr
            curr = curr?.next 
            temp?.next = prev
            prev = temp
        }

        return prev
    }
}

