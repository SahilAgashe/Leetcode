// 236. Lowest Common Ancestor of a Binary Tree
// https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/description/
// Medium , but it is very easy!

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

/*
Complexity Analysis
Time Complexity: O(N), In the worst case, every node in the tree is visited once.
Space Complexity: O(H), where H is the height of the tree.
O(log N) on a balanced binary tree. 
O(N) on a completely skewed tree due to recursion stack frames.
*/
class Solution1 {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil || p === root || q === root {
            return root 
        }

        let left = lowestCommonAncestor(root?.left, p, q)
        let right = lowestCommonAncestor(root?.right, p , q)
        
        if left != nil && right != nil {
            return root
        } else if left != nil {
            return left
        } else {
            return right
        }
    }
}

// Nil-Coalescing Operator
class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil || p === root || q === root {
            return root 
        }

        let left = lowestCommonAncestor(root?.left, p, q)
        let right = lowestCommonAncestor(root?.right, p , q)
        
        if left != nil && right != nil {
            return root
        } 

        return left ?? right 
    }
}

/*
Key Highlights
Identical Reference Checking: Using === correctly compares class reference identities rather than node values.

Nil-Coalescing Operator: Replacing else if left != nil with left ?? right achieves the exact same selection logic concisely.
*/
