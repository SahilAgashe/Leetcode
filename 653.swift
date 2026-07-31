// 653. Two Sum IV - Input is a BST
// https://leetcode.com/problems/two-sum-iv-input-is-a-bst/description/
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
class Solution1 {
    // TC = O(N), SC = O(N)
    var elementSet = Set<Int>()
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        if root == nil { return false }
        let currValue = root!.val
        if elementSet.contains(k - currValue) { return true }  
        elementSet.insert(currValue)
        let checkLeftTree = findTarget(root?.left, k)
        if checkLeftTree { return true }
        return findTarget(root?.right, k)
    }
}


class Solution {

    // Two-Pointer BST Iterator (O(h) Space Optimal)
    // TC = O(N), SC = O(h), h = height of the tree
    // O(h) — Memory for two stacks (leftNodes and rightNodes arrays) proportional to tree height h.
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        var leftNodes = [TreeNode]() // letfmost path
        var rightNodes = [TreeNode]() // rightmost path
        var ans: Bool = false

        // initialize leftmost path
        var currLeft: TreeNode? = root
        while let node = currLeft {
            leftNodes.append(node)
            currLeft = node.left
        }

        // initialize leftmost path
        var currRight = root
        while let node = currRight {
            rightNodes.append(node)
            currRight = node.right
        }

        while let left = leftNodes.last,
              let right = rightNodes.last,
              left !== right { // left and right are reference types so !== operator
                let sum = left.val + right.val 
                if sum == k {
                    ans = true 
                    break
                } else if sum < k {
                    // Move forward iterator (next smallest element)
                    // 1. Pop the current smallest element, and grab its right child
                    var curr = leftNodes.popLast()?.right
                    // 2. Traverse as far left as possible from that right child
                    while let node = curr {
                        leftNodes.append(node)
                        curr = node.left
                    }
                } else { // else if sum > k
                    // Move reverse iterator (next largest element)
                    // 1. Pop the current largest element, and grab its left child
                    var curr = rightNodes.popLast()?.left
                    // 2. Traverse as far right as possible from that left child
                    while let node = curr {
                        rightNodes.append(node)
                        curr = node.right
                    }
                }
         }

         return ans
    }
}
