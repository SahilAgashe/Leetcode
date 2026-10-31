// 173. Binary Search Tree Iterator
// https://leetcode.com/problems/binary-search-tree-iterator/description/
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

// Could you implement next() and hasNext() to run in average O(1) time and use O(h) memory, where h is the height of the tree?

// Iterator iterates from lower values to higher values
class BSTIterator1 {
    
    private var stack = Array<TreeNode>()

    init(_ root: TreeNode?) {
        pushAll(root)
    }
    
    // You may assume that next() calls will always be valid, no needs to return Int? 
    // so I am using removeLast() , but always try to use popLast()
    func next() -> Int {
        let node = stack.removeLast()
        pushAll(node.right)
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
            root = node.left
        }
    }
}

/* 
Time Complexity =>
hasNext() is O(1): 
It simply checks whether the stack array is empty (!stack.isEmpty), which is a constant-time operation.
next() is Amortized O(1): A single call to next() may trigger pushAll and visit multiple nodes along a branch, taking O(H) time in the worst case. However, across a full traversal of the tree, every one of the N nodes is pushed to stack exactly once and popped from stack exactly once. Therefore, N calls to next() perform O(N) work total, averaging out to O(1) time per operation.
*/

/*
For your MyBSTIterator or BSTIterator, the space complexity is O(H), where H is the height of the Binary Search Tree.

Detailed Breakdown
* Best/Average Case (Balanced Tree): O(log N)If the tree is balanced (like an AVL tree or Red-Black tree), the maximum height of the tree is logN. The internal stack array will never hold more than logN nodes at any point.
* Worst Case (Skewed Tree): O(N)If the tree degrades into a straight line (e.g., each node only has a right child or only a left child), the height H equals N. In this worst-case scenario, the stack will hold up to N nodes.
Why is it O(H) space instead of O(N)?
Your iterator only stores nodes along the current path from the root to a leaf.

1. In the constructor, pushAll(root) traverses straight down along the leftmost (or rightmost) branch and pushes only those nodes onto the stack.
2. During iteration with next(), nodes are popped off, and pushAll only traverses down a new branch when a right (or left) subtree exists.
3. At no point are all N nodes kept in the stack simultaneously. The maximum depth of stack at any single moment is capped by the longest path from the root to a leaf—which is precisely H.
*/


// Iterator iterates from lower values to higher values
// Using popLast() , Better Code Quality
class BSTIterator {
    
    private var stack = Array<TreeNode>()

    init(_ root: TreeNode?) {
        pushAll(root)
    }
    
    // You may assume that next() calls will always be valid, no needs to return Int? 
    func next() -> Int {
        let node = stack.popLast()
        if let node {
            pushAll(node.right)
            return node.val
        }
        return Int.min
    }
    
    func hasNext() -> Bool {
        return !stack.isEmpty
    }

    // MARK: - Private Helpers
    private func pushAll(_ root: TreeNode?) {
        var root = root
        while let node = root {
            stack.append(node)
            root = node.left
        }
    }
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */

// MyBSTIterator: Iterator accepts reverse flag in the init
// If reverse is false, increasing order iterator
// If reverse is true, decreasing order iterator
class MyBSTIterator {
    
    private var stack = Array<TreeNode>()
    private let reverse: Bool

    init(_ root: TreeNode?, reverse: Bool = false) {
        self.reverse = reverse
        pushAll(root)
    }
    
    // You may assume that next() calls will always be valid, no needs to return Int? 
    func next() -> Int {
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
