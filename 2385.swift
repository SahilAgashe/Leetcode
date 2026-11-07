// 2385. Amount of Time for Binary Tree to Be Infected
// https://leetcode.com/problems/amount-of-time-for-binary-tree-to-be-infected/description/
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

/*
This is essentially finding the radius/max distance
in an undirected graph starting from the infected node.
*/
// This Question was asked in Phone Pe Interview DSA Round
class Solution {
    // TC = O(N) , SC = O(N)
    func amountOfTime(_ root: TreeNode?, _ start: Int) -> Int {
        // Adjacency List
        var adj = [Int: [Int]]() 
        // Step 1: Build the undirected graph from the tree
        buildGraph(root, nil, &adj)

        let n = adj.keys.count // no. of nodes
        var visited = Set<Int>()
        var queue = Deque<Int>() 
        queue.append(start)
        visited.insert(start)
        var time = 0

        // Step 2: BFS starting from `start`
        while !queue.isEmpty {
            let sz = queue.count 
            var ableToInfect = false
            for _ in 0..<sz {
                let first = queue.removeFirst() 
                for neighbour in adj[first, default: []] {
                    if !visited.contains(neighbour) {
                        queue.append(neighbour)
                        visited.insert(neighbour)
                        ableToInfect = true
                    }
                }
            }
            if ableToInfect {
                 time += 1
            }
        }
        return time 
    }

    private func buildGraph(_ node: TreeNode?, _ parent: TreeNode?, _ adj: inout [Int: [Int]]) {
        guard let node else { return }

        if let parent {
            adj[node.val, default: []].append(parent.val)
            adj[parent.val, default: []].append(node.val)
        }
        buildGraph(node.left, node, &adj)
        buildGraph(node.right, node, &adj)
    }
}

// Solution 2: One-Pass DFS (Space-Optimized)
// Instead of explicitly building an adjacency list, 
// you can use post-order traversal to calculate tree heights 
// and propagate the distance to the target node back up to ancestors.
// TO BE Continued...
