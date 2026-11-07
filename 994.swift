// 994. Rotting Oranges
// https://leetcode.com/problems/rotting-oranges/description/
// Medium 

/*
Multi-source BFS is a variation of breadth-first search where you start from multiple sources at once instead of just one. All sources are added to the queue initially, and the search expands outward in layers, ensuring the shortest distance to each node or cell.

Multi-source BFS is a small extension of standard single-source BFS. 
Multi-source BFS is the same algorithm, but instead of putting one node into the queue at the start, you put all source nodes into the queue at level 0. From there, BFS expands outward from all sources simultaneously, level by level. The result is the shortest distance from each cell to its nearest source, not to a specific source.
*/

class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var grid = grid // We will make fresh oranges to rotten
        let m = grid.count // rows 
        let n = grid[0].count // columns 
        var fresh = 0 

        var queue = Deque<(Int, Int)>() 
        let directions = [(0, -1), (0, 1), (1, 0), (-1, 0)] //  4-directions 
        var time = 0

        // 1. Collect all initial rotten oranges and count fresh oranges
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    fresh += 1
                } else if grid[i][j] == 2 {
                    queue.append((i, j))
                }
            }
        }

        // If there are no fresh oranges to start with, return 0
        if fresh == 0 { return 0 }

        // 2. Multi-source BFS
        while(!queue.isEmpty && fresh != 0) {
            let qSize = queue.count 
            for _ in 0..<qSize {
                let first = queue.removeFirst() 
                for (dx , dy) in directions {
                    let ni = first.0 + dx 
                    let nj = first.1 + dy 
                    if ni >= 0, nj >= 0 , ni < m , nj < n {
                        // if it is fresh
                        if grid[ni][nj] == 1 {
                            // Make it rotten
                            grid[ni][nj] = 2 
                            fresh -= 1
                            queue.append((ni, nj))
                        }
                    } 
                }
            }
            time += 1
        }

        // 3. Return time if all turned rotten, else -1
        return fresh == 0 ? time : -1 
    }
}
