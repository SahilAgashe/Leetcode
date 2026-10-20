// 987. Vertical Order Traversal of a Binary Tree
// https://leetcode.com/problems/vertical-order-traversal-of-a-binary-tree/description/
// Hard, but it will be very easy after practice!

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
/*
Let N be the total number of nodes in the binary tree:
* BFS Traversal: O(N) — every node is processed once via the queue q.
* Dictionary Operations: Standard map lookups and insertions average O(1).
* Sorting Phase:
    * Sorting C unique columns takes O(ClogC).
    * For each column, sorting levels takes O(LlogL).
    * Sorting values at identical coordinates takes O(KlogK).
    * Combined sorting time across all buckets is bounded by O(Nlog N) in the worst case (when all nodes land on the same column/level).
* Overall Time Complexity: O(Nlog N)
* Overall Space Complexity: O(N) for the queue and nested dictionary.
*/
    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {

        // HD = Horizontal Distance from root 
        // LN = Level distance
        // Dictionary of<HZ , Dictionary of <LevelDistance , Node Values>>
        var nodes = Dictionary<Int, Dictionary<Int, Array<Int>>>()

        // node with its origin (HD , LD) : x => HD, y => LD
        var q = Deque<(TreeNode, Int, Int)>()
        var ans = [[Int]]() 

        guard let root else {
            return ans
        }

        q.append((root, 0, 0 ))

        while !q.isEmpty {
            let first = q.removeFirst() 
            let hd = first.1
            let ld = first.2

            nodes[hd, default: [:]][ld, default: []].append(first.0.val)

            if let left = first.0.left {
                 q.append((left, hd - 1, ld + 1))
            }

            if let right = first.0.right {
                q.append((right, hd + 1, ld + 1))
            }
        }

        // 1. Sort by Horizontal Distance (from left to right)
        for hd in nodes.keys.sorted() {
            var tempArray = [Int]()

            // 2. Sort by Level Distance (top to bottom)
            for level in nodes[hd, default: [:]].keys.sorted() {
                if let array = nodes[hd, default: [:]][level] {
                    // 3. Sort node values ascending if they share the exact same (HD, LD)
                    let sortedArray = array.sorted()
                    tempArray.append(contentsOf: sortedArray)
                }
            }
            ans.append(tempArray)
        }

        return ans
    }
}

/*
Why OrderedDictionary Doesn't Help Here
1. Preserves Insertion Order, Not Sorted Order: OrderedDictionary maintains keys in the exact order they are inserted (like an array), not in numerical/sorted order. Because BFS visits nodes level-by-level, the horizontal distances (hd) are inserted out of order (e.g., 0, then -1, then 1, then -2). You still have to call .keys.sorted() anyway.
2. Performance Overhead: OrderedDictionary maintains both a hash table and an array internally to track insertion order. This extra overhead makes insertions slower and uses more memory than standard Swift Dictionary.


When OrderedDictionary IS Useful
OrderedDictionary shines in real-world software engineering scenarios where insertion sequence matters:
* LRU Caches & Recent History: Tracking items in the order they were accessed or added so you can remove the oldest item efficiently.
* JSON/API Serialization: Preserving key order in JSON objects (e.g., matching field orders required by external server APIs or configuration files).
* UI Lists & Forms: Maintaining stable row ordering in a form or list view while still allowing $O(1)$ fast key lookups by identifier.
* Reordering Data: Swapping or reordering keys without rebuilding the dictionary from scratch.
*/
