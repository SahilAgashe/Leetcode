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

 // Naive Solution: BST traversal & getting sorted array, 
 // then problem reduced to solving two sum for an sorted array
 // TC => O(N) => O(N) for traversal + O(N) for two pointer scan
 // SC => O(N) => O(N) for array + O(H) stack frame memory for the recursion , H = height of tree
class Solution1 {
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        var nums = [Int]()
        inorderTraversal(root, &nums)
        return twoSumOnSortedArray(nums, k)
    }

    // O(N)
    private func inorderTraversal(_ root: TreeNode?, _ nums: inout [Int]) {
        guard let root else { return }
        inorderTraversal(root.left, &nums)
        nums.append(root.val)
        inorderTraversal(root.right, &nums)
    }

    // TC = O(N)
    private func twoSumOnSortedArray(_ nums: [Int], _ k: Int) -> Bool {
        var low = 0 
        var high = nums.count - 1

        while low < high {
            let sum = nums[low] + nums[high]
            if sum == k {
                return true
            } else if sum < k {
                low += 1
            } else {
                high -= 1
            }
        }

        return false
    }
}


 // Improved Solve: Using Set (Hash Table)
 // TC = O(N) for traversal, N = no. of nodes 
 // SC = O(N) => O(N) for set + O(H) for recursion stack , H = height of the tree
class Solution2 {
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        var numSet = Set<Int>()
        return inorderTraversal(root, k, &numSet)
    }

    // TC = O(N)
    private func inorderTraversal(_ root: TreeNode?, _ k: Int, _ numSet: inout Set<Int>) -> Bool {
        guard let root else { return false }
        let validateLeft = inorderTraversal(root.left, k, &numSet)
        if validateLeft { return true }
        if numSet.contains(k - root.val) {
            return true
        }
        numSet.insert(root.val)
        return inorderTraversal(root.right, k, &numSet)
    }

}

 // Space Optimized Solution 
 // TC = O(N) for traversal, N = no. of nodes 
 // SC = O(H), H = height of the tree
class Solution3 {
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        let leftIterator = BSTIterator(root) // Ascending 
        let rightIterator = BSTIterator(root, reverse: true) // Descending

        var left = leftIterator.next()
        var right = rightIterator.next() 
        while let low = left , let high = right, low < high {
                let sum = low + high
                if sum == k {
                    return true
                } else if sum < k {
                    left = leftIterator.next()
                } else {
                    right = rightIterator.next()
                }
         }
         return false
    }

    private class BSTIterator {
        // Private Properties
        private var stack = Array<TreeNode>() 
        private var reverse: Bool

        // Public Init
        init(_ root: TreeNode?, reverse: Bool = false) {
            self.reverse = reverse
            pushAll(root)
        }

        // Public Helpers
        func next() -> Int? {
            let node = stack.popLast() 
            pushAll(reverse ? node?.left : node?.right)
            return node?.val
        } 

        func hasNext() -> Bool {
            return !stack.isEmpty
        }

        // MARK: - Private Helpers
        private func pushAll(_ root: TreeNode?) {
            var root = root
            while let node = root {
                stack.append(node)
                root = reverse ? node.right : node.left
            }
        }
    }
}



 // Space Optimized Solution 
 // TC = O(N) for traversal, N = no. of nodes 
 // SC = O(H), H = height of the tree
 // Code Quality Improvement 
 // We can remove optional, will never call edge cases! to handle nil
class Solution {
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        let leftIterator = BSTIterator(root) // Ascending 
        let rightIterator = BSTIterator(root, reverse: true) // Descending

        var left = leftIterator.next()
        var right = rightIterator.next() 
        while left < right {
                let sum = left + right
                if sum == k {
                    return true
                } else if sum < k {
                    left = leftIterator.next()
                } else {
                    right = rightIterator.next()
                }
         }
         return false
    }

    private class BSTIterator {
        // Private Properties
        private var stack = Array<TreeNode>() 
        private var reverse: Bool

        // Public Init
        init(_ root: TreeNode?, reverse: Bool = false) {
            self.reverse = reverse
            pushAll(root)
        }

        // Public Helpers
        func next() -> Int {
            // Using Remove Last here, as we are 100% sure
            // But try to alwasy use popLast()!
            let node = stack.removeLast() 
            pushAll(reverse ? node.left : node.right)
            return node.val
        } 

        func hasNext() -> Bool {
            return !stack.isEmpty
        }

        // MARK: - Private Helpers
        private func pushAll(_ root: TreeNode?) {
            var root = root
            while let node = root {
                stack.append(node)
                root = reverse ? node.right : node.left
            }
        }
    }
}

