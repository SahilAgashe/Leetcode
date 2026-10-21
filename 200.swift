// 200. Number of Islands
// https://leetcode.com/problems/number-of-islands/description/
// Medium , But it is very easy!!!

// Approach: DFS (Recursion)
// TC = O(MN), SC = O(MN), M = Rows count , N = Columns count 
/*
Complexity Analysis
Let M be the number of rows and N be the number of columns in the grid.
Time Complexity: O(MN)
* Every cell is visited a constant number of times. The double loop checks every cell once, and the DFS visits each land cell "1" at most once.
Space Complexity:
* O(MN) auxiliary space for the vis matrix + O(MN) worst-case call stack space (for a grid filled entirely with "1"s). Total auxiliary space = O(MN).
*/
class Solution {
    private func dfs(_ i: Int, _ j: Int, _ vis: inout [[Bool]], _ grid: [[Character]]) {
        let m = grid.count
        let n = grid[0].count 

        // Base Cases
        if (i < 0 || j < 0 || i >= m || j >= n || vis[i][j] || grid[i][j] == "0") {
            return 
        }

        // Mark Visited
        vis[i][j] = true

        // Recursive Cases || Checking Neighbours || Exploration
        dfs(i, j + 1, &vis, grid) // Right
        dfs(i, j - 1, &vis, grid) // Left 
        dfs(i + 1, j, &vis, grid) // Top
        dfs(i - 1, j, &vis, grid) // Bottom
    }


    func numIslands(_ grid: [[Character]]) -> Int {
        let m = grid.count
        let n = grid[0].count 
        let tempArray = Array<Bool>(repeating: false, count: n)
        var vis = Array<Array<Bool>>(repeating: tempArray, count: m)

        // Count of connected components
        var ans = 0 

        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == "1" && !vis[i][j] {
                     dfs(i, j, &vis, grid)
                     ans += 1
                }
            }
        }

        return ans
    }
}

/*
Graphs can have many components
A Graph having only one connected component => Connected Graph
A Graph having multiple connected components => Disconnected Graph

Graph is said to be connected if there exists at least one path between each and every pair of vertices in graph G, otherwise, it is disconnected. 
*/


// Approach: In-Place DFS Solution (Without Visited Matrix)
// TC = O(MN)
// SC = O(MN)
// * In-Place Optimized Code: O(1) extra matrix space + O(MN) worst-case call stack space. Total auxiliary space = O(MN) 
class Solution2 {
    private func dfs(_ i: Int, _ j: Int, _ grid: inout [[Character]]) {
        let m = grid.count
        let n = grid[0].count 

        // Base Cases
        if (i < 0 || j < 0 || i >= m || j >= n || grid[i][j] == "0") {
            return 
        }

        grid[i][j] = "0"

        // Recursive Cases || Checking Neighbours
        dfs(i, j + 1, &grid) // Right
        dfs(i, j - 1, &grid) // Left 
        dfs(i + 1, j, &grid) // Top
        dfs(i - 1, j, &grid) // Bottom
    }


    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        let m = grid.count
        let n = grid[0].count 

        // Count of connected components
        var ans = 0 

        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == "1" {
                     dfs(i, j, &grid)
                     ans += 1
                }
            }
        }

        return ans
    }
}

import Collections 
// Approach: BFS 
// TC = O(MN), SC = O(MN)
class Solution3 {

    func numIslands(_ grid: [[Character]]) -> Int {
        let m = grid.count
        let n = grid[0].count 
        let tempArray = Array<Bool>(repeating: false, count: n)
        var vis = Array<Array<Bool>>(repeating: tempArray, count: m)

        let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)] // Right , Left , Top , Bottom 

        // Count of connected components
        var ans = 0 

        for i in 0..<m {
            for j in 0..<n {
                
                // Process only unvisited land cells
                if !vis[i][j] && grid[i][j] == "1" {
                    ans += 1
                    var queue = Deque<(Int, Int)>()
                    queue.append((i,j))
                    // MARK VISITED IMMEDIATELY ON ENQUEUE
                    vis[i][j] = true

                    while !queue.isEmpty {
                        let first = queue.removeFirst()
                        let rowIndex = first.0
                        let columnIndex = first.1

                        // Exploration
                        for (dx, dy) in directions {
                            let ri = rowIndex + dx 
                            let ci = columnIndex + dy
                            if ri >= 0 && ci >= 0 && ri < m 
                            && ci < n && !vis[ri][ci]  && grid[ri][ci] == "1" {
                                queue.append((ri, ci))
                                // MARK VISITED IMMEDIATELY ON ENQUEUE
                                vis[ri][ci] = true
                            }
                        }
                    }
                }
            }
        }

        return ans
    }

    /*
    If you are marking cells as visited (vis[rowIndex][columnIndex] = true) after popping them from the queue instead of when pushing them into the queue.
    then,
    Because a cell isn't marked as visited at the time it gets enqueued, multiple adjacent cells can add the exact same neighbor to the queue multiple times during the loop. This causes exponential queue growth and redundant iterations.
    So MARK VISITED IMMEDIATELY ON ENQUEUE!!!
    */
}


// Approach: BFS (Without Visited Matrix)
// TC = O(MN), SC = O(MN)
class Solution4 {

    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        let m = grid.count
        let n = grid[0].count 

        let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)] // Right , Left , Top , Bottom 

        // Count of connected components
        var ans = 0 

        for i in 0..<m {
            for j in 0..<n {
                
                // Process only unvisited land cells
                if grid[i][j] == "1" {
                    ans += 1
                    var queue = Deque<(Int, Int)>()
                    queue.append((i,j))
                    // MARK VISITED IMMEDIATELY ON ENQUEUE
                    grid[i][j] = "0"

                    while !queue.isEmpty {
                        let first = queue.removeFirst()
                        let rowIndex = first.0
                        let columnIndex = first.1

                        // Exploration
                        for (dx, dy) in directions {
                            let ri = rowIndex + dx 
                            let ci = columnIndex + dy
                            if ri >= 0 && ci >= 0 && ri < m 
                            && ci < n && grid[ri][ci] == "1" {
                                queue.append((ri, ci))
                                // MARK VISITED IMMEDIATELY ON ENQUEUE
                                grid[ri][ci] = "0"
                            }
                        }
                    }
                }
            }
        }

        return ans
    }

    /*
    If you are marking cells as visited (vis[rowIndex][columnIndex] = true) after popping them from the queue instead of when pushing them into the queue.
    then,
    Because a cell isn't marked as visited at the time it gets enqueued, multiple adjacent cells can add the exact same neighbor to the queue multiple times during the loop. This causes exponential queue growth and redundant iterations.
    So MARK VISITED IMMEDIATELY ON ENQUEUE!!!
    */
}
/*
Here are the key differences between Depth-First Search (DFS) and Breadth-First Search (BFS):

* Traversal Strategy
    * DFS: Explores as deep as possible along each branch before backtracking to explore alternative paths.
    * BFS: Explores the graph layer-by-layer (level-by-level), visiting all immediate neighbors before moving to the next distance level.
* Underlying Data Structure
    * DFS: Uses a Stack (Last-In, First-Out / LIFO), which is typically implemented using the system's call stack via recursion or an explicit stack structure.
    * BFS: Uses a Queue (First-In, First-Out / FIFO) to process nodes in the exact order they are discovered.
* Space Complexity
    * DFS: Space complexity is proportional to the maximum height/depth ($H$) of the search tree or graph: $O(H)$. It uses less memory in wide, shallow graphs.
    * BFS: Space complexity is proportional to the maximum width ($W$) of the search tree or graph: $O(W)$. It uses less memory in deep, narrow graphs.
* Shortest Path Property
    * DFS: Does not guarantee the shortest path in unweighted graphs, as it follows a single path to completion before considering shorter alternatives.
    * BFS: Guarantees the shortest path (fewest edges) from the source node to any target node in an unweighted graph because it expands outward uniformly.
* Completeness on Infinite Graphs
    * DFS: Is not complete on infinite graphs—it can get trapped traversing down an infinitely long path and never discover a solution located elsewhere.
    * BFS: Is complete on infinite graphs (assuming a finite branching factor) because it evaluates paths by increasing length, ensuring it will eventually reach any finite target.
* Primary Use Cases
    * DFS: Best for connectivity testing, cycle detection, topological sorting, finding strongly connected components, and solving puzzles with exhaustive constraint satisfaction (e.g., Sudoku, mazes).
    * BFS: Best for finding the shortest path or minimum steps in unweighted graphs, finding nodes within a specific radius $K$, and level-order processing.
*/
