// 102. Binary Tree Level Order Traversal
// https://leetcode.com/problems/binary-tree-level-order-traversal/description/
// Medium , But it is very easy!

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

import Collections 

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var ans = [[Int]]() 
        var queue = Deque<TreeNode>() 

        guard let root else {
            return ans
        }

        queue.append(root)

        while !queue.isEmpty  {
            var tempArr = [Int]()
            let levelSize = queue.count

            for _ in 0..<levelSize {
                let first = queue.popFirst()
                if let val = first?.val {
                    tempArr.append(val)
                }
                if let left = first?.left {
                    queue.append(left)
                }

                if let right = first?.right {
                    queue.append(right)
               }
            }
                        
            if !tempArr.isEmpty {
                ans.append(tempArr)
            }

        }
        return ans
    }
}

/*
Q => 
push => 3 | 9 | 20 | 15 | 7
pop => 3 | 9 | 20 
*/

/*
Note: Dont use removeFirst() / removeLast() , instead use popFirst() / popLast()
Mention that popFirst() / popLast() returns an optional and safely handles popping without crashing if the collection were empty
*/
