// 103. Binary Tree Zigzag Level Order Traversal
// https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/description/
// Medium 

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

// TC = O(N) , SC = O(N)

/*
Time Complexity: O(N)
BFS Traversal: Each node is enqueued and dequeued exactly once, taking O(1) time per node, 
totaling O(N).
Reversing Levels: Reversing an array of size K takes O(K) time. Across all levels, the sum of all level sizes is N. Therefore, reversing alternating levels takes O(N) overall time.
Total Time Complexity: O(N) + O(N) = O(N).
Space Complexity: O(N)
Queue Space: At any point, the queue holds at most the maximum number of nodes at any level (the maximum width of the tree). 
For a complete binary tree, the leaf level contains up to  N/2, requiring O(N) space in the worst case.
Output & Auxiliary Arrays: The ans array stores all N node values across all levels (O(N) space), and tempArray stores up to O(N) values per level.
Total Space Complexity: O(N).
*/
class Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        var queue = Deque<TreeNode>() 
        var ans = Array<Array<Int>>()

        guard let root else {
            return ans 
        }

        queue.append(root)
        var reverseToggle: Bool = false

        while !queue.isEmpty {
            let levelSize = queue.count

            var tempArray = [Int]()
            for _ in 0..<levelSize {
                let first = queue.popFirst() 
                if let val = first?.val {
                    tempArray.append(val)
                }

                if let left = first?.left {
                    queue.append(left)
                }
                if let right = first?.right {
                    queue.append(right)
                }
            }
            if reverseToggle {
                tempArray = tempArray.reversed()
            }
            reverseToggle.toggle()
            ans.append(tempArray)

        }

        return ans
    }
}
