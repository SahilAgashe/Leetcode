// 104. Maximum Depth of Binary Tree
// https://leetcode.com/problems/maximum-depth-of-binary-tree/description/
// Easy

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

class Solution {
    // Using Recursion 
    // DFS , PreOrder Traversal 
    // TC = O(N) , N = no. of nodes in tree
    // SC = O(H) , H = Height of the tree
    // The recursion call stack uses space proportional to the height of the tree H.
    // In the worst case (skewed tree), H = N, yielding O(N) space.
    // A skewed binary tree is a binary tree where all internal nodes have only one child, 
    // In the best/balanced case, H = log N, yielding O(logN) space.
    func maxDepth(_ root: TreeNode?) -> Int {
        // Base Case 1: root is nil 
        guard let root else {
            return 0
        }

        // Recursive Cases
        let leftDepth = maxDepth(root.left)
        let rightDepth = maxDepth(root.right)

        let ans = 1 + max(leftDepth , rightDepth)

        return ans
    }
}
