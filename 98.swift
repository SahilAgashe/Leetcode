// 98. Validate Binary Search Tree
// Medium 
// https://leetcode.com/problems/validate-binary-search-tree/description/

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
 // DFS , Inorder Traversal 
 // TC = O(N) , SC = O(N), Extra space of Array is required
class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        var inorderTraversalArray = Array<Int>() 
        inorderTraversal(root, &inorderTraversalArray)
        //print(inorderTraversalArray)
        return isSortedArray(inorderTraversalArray)
    }

    private func inorderTraversal(_ root: TreeNode?, _ traversal: inout [Int]) {
        guard let root else {
            return 
        }
        // left 
        inorderTraversal(root.left, &traversal)
        // root 
        traversal.append(root.val)
        // right
        inorderTraversal(root.right, &traversal)
    }

    private func isSortedArray(_ arr: [Int]) -> Bool {
        if arr.count < 2 { return true }

        for i in 1..<arr.count {
            if arr[i] <= arr[i - 1] {
                return false
            }
        }
        return true
    }
}

 // In-Order Traversal with Previous Node Pointer
 // Recursion 
 // DFS , Inorder Traversal 
 // TC = O(N) , SC = O(H) 
 // SC = O(H) , Recursive Call stack depth equals tree height H O(log N) average for balanced trees, O(N) worst-case for skewed trees.
 // No extra space of array required here!
class Solution2 {

    func isValidBST(_ root: TreeNode?) -> Bool {
        var prev: Int? = nil
        return inorderTraversal(root, &prev)
    }

    private func inorderTraversal(_ root: TreeNode?, _ prev: inout Int?) -> Bool {
        guard let root else {
            return true
        }
        // left 
        let checkLeft = inorderTraversal(root.left, &prev)

        if !checkLeft {
            return false
        }

        // root 
        if let prev, prev >= root.val {
            return false
        }
        prev = root.val

        // right
        return inorderTraversal(root.right, &prev)
    }

}

 // Range Validation 
 // Recursion 
 // DFS , Inorder Traversal 
 // TC = O(N) , SC = O(H) 
 // SC = O(H) , Recursive Call stack depth equals tree height H O(log N) average for balanced trees, O(N) worst-case for skewed trees.
 // No extra space of array required here!
class Solution3 {

    func isValidBST(_ root: TreeNode?) -> Bool {
        return validate(root, nil, nil)
    }

    private func validate(_ root: TreeNode?, _ min: Int?, _ max: Int?) -> Bool {
        guard let root else { return true }

        if let min, root.val <= min { return false }
        if let max, root.val >= max { return false }

        return validate(root.left, min, root.val) && 
               validate(root.right, root.val, max)
    }

}
