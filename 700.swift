// 700. Search in a Binary Search Tree
// https://leetcode.com/problems/search-in-a-binary-search-tree/
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
 // Recursion
 // TC = O(H) , SC = O(H) , H = height of the tree
class Solution1 {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root else {
            return nil
        }

        if val == root.val {
            return root
        } else if val > root.val {
            return searchBST(root.right, val)
        } else {
            return searchBST(root.left, val)
        }
    }
}

// Iterative Approach 
 // TC = O(H) , SC = O(1) , H = height of the tree
class Solution {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        var temp = root
        while let node = temp, node.val != val {
            if val > node.val {
                temp = node.right
            } else {
                temp = node.left
            }
        }

        return temp
    }
}
