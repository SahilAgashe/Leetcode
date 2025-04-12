// 144. Binary Tree Preorder Traversal
// https://leetcode.com/problems/binary-tree-preorder-traversal/description/
// EASY

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
    private var preorderNodeValues = [Int]()

    private func preorder(_ root: TreeNode?) {
       guard let root else { return }
       preorderNodeValues.append(root.val)
       preorder(root.left)
       preorder(root.right)
    }

    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        preorderNodeValues = []
        preorder(root)
        return preorderNodeValues
    }
}