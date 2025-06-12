// 141. Linked List Cycle
// https://leetcode.com/problems/linked-list-cycle/description/
// Easy 

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

// Follow up: Can you solve it using O(1) (i.e. constant) memory?
class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var fastPointer: ListNode? = head
        var slowPointer: ListNode? = head 
        while fastPointer != nil {
            fastPointer = fastPointer?.next?.next
            slowPointer = slowPointer?.next 
            // Here need to use identity operator "===", as ListNode is reference type
            // if I use equal to operator "==" , will get error: binary operator '==' cannot be applied to two 'ListNode'
            // As ListNode does not conforms to Equatable protocol 
            if let slowPointer , let fastPointer, slowPointer === fastPointer {
                return true
            }
        }
        return false 
    }
}