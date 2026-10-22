// 235. Lowest Common Ancestor of a Binary Search Tree
// https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/description/
// Medium 

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

// LCA of Binary Tree (Does not take benefits of BST)
// TC = O(N) , SC = O(H) ; N = no. of nodes in tree, H = height of the tree (Depth of recursive call stack)
class Solution1 {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        // Base Case
        if root == nil || p === root || q === root {
            return root 
        }

        // Recursive Cases 
        let left = lowestCommonAncestor(root?.left, p, q)
        let right = lowestCommonAncestor(root?.right, p , q)

        if left != nil && right != nil {
            return root
        } 
        return left ?? right
    }
}

// LCA of BST (Take benefits fo BST)
// Recursive Approach
// TC = O(H) , SC = O(H) ; H = height of the tree (Depth of recursive call stack)
class Solution2 {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        // Base Case
        guard let root, let p, let q else { return nil }

        // Recursive Cases 
        if p.val < root.val && q.val < root.val {
            return lowestCommonAncestor(root.left, p, q)
        } else if p.val > root.val && q.val > root.val {
            return lowestCommonAncestor(root.right, p , q)
        } else {
            // This case will handle  p === root || q === root 
            // Also it will handle the logic of p & q are both in different directions(left & right)
            return root
        }

    }
}

// LCA of BST (Take benefits fo BST)
// Iterative Approach
// TC = O(H) , SC = O(1) , H = height of the tree (Depth of recursive call stack)
/*
Time Complexity: O(H) where H is the height of the tree O(logN) for a balanced tree, O(N) for a completely skewed tree). You only visit one node per level.
Space Complexity: O(1) auxiliary space. Unlike the recursive approach, which uses O(H) call stack space, this loop runs with a single pointer (temp) in constant memory.
*/
class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        var temp = root 
        guard let p , let q else { return nil }
        while let node = temp {
            if p.val < node.val && q.val < node.val {
                temp = node.left
            } else if p.val > node.val && q.val > node.val {
                temp = node.right
            } else {
                return temp
            }
        }
        return temp
    }
}
