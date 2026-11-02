// 785. Is Graph Bipartite?
// https://leetcode.com/problems/is-graph-bipartite/description/
// Medium

import Collections

// Approach: Using DFS , It uses Adjacency List Graph Representation
// TC => O(V+E) , V = no. of vertices , E = no. of Edges
class Solution1 {
    // Input Graph is represented as Adjacency List 
    // Using DFS
    func isBipartite(_ graph: [[Int]]) -> Bool {
        let m = graph.count // no. of rows OR number of vertices
        // 0 ===> Uncolored OR Unvisited
        // 1 ===> Red  (Colored Or Visited)
        // -1 ===> Yellow (Colored Or Visited)

        // For tracking Colored / Visited  
        var vertexColor = Array<Int>(repeating: 0, count: m) 
        
        for i in 0..<m {
            // Graph can have multiple components Or Graph can be disconnected!
            if vertexColor[i] == 0 {
                let result = dfs(i, 1, &vertexColor, graph)
                if !result {
                    return false
                }
            }
        }

        return true
    }

    private func dfs(_ i: Int, _ color: Int, _ vertexColor: inout [Int], _ graph: [[Int]]) -> Bool {
        // Coloring Vertex And So Marking Visited
        vertexColor[i] = color

        // Exploring the vertex
        for j in 0..<graph[i].count {
            let neighbour = graph[i][j]
            // It was not visited or not colored previously
            if vertexColor[neighbour] == 0 {
              // If any branch fails the color test, propagate false back
              let result = dfs(neighbour, -color, &vertexColor, graph)
              if !result {
                return false
              }
            } 
             // It is already visited or colored
            else {
              // same color as parent (adjacents have same color)
              if vertexColor[neighbour] == color {
                return false
              }
            }
        }

        return true
    }
}


// Approach: Using BFS , It uses Adjacency List Graph Representation
// TC => O(V+E) , V = no. of vertices , E = no. of Edges
class Solution {
    // Input Graph is represented as Adjacency List 
    // Using BFS
    func isBipartite(_ graph: [[Int]]) -> Bool {
        let m = graph.count // no. of rows OR number of vertices
        // 0 ===> Uncolored OR Unvisited
        // 1 ===> Red  (Colored Or Visited)
        // -1 ===> Yellow (Colored Or Visited)

        // For tracking Colored / Visited  
        var vertexColor = Array<Int>(repeating: 0, count: m) 

        var q = Deque<Int>()
        
        for i in 0..<m {
            // Graph can have multiple components Or Graph can be disconnected!
            if vertexColor[i] == 0 {
                q.append(i)
                // Marking Visited OR Coloring
                vertexColor[i] = 1
                while(!q.isEmpty) {
                    let first = q.removeFirst() 
                    for j in 0..<graph[first].count {
                        let neighbour = graph[first][j]
                        // if not visited or colored
                        if vertexColor[neighbour] == 0 {
                         q.append(neighbour)
                         // Marking Visited OR Coloring
                         vertexColor[neighbour] = -vertexColor[first]
                        } 
                        // if already visited or colored
                        else {
                         if vertexColor[neighbour] == vertexColor[first] {
                            return false
                         }
                        }
                    }
                }
            }
        }

        return true
    }
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


/*
Two main terms in DFS & BFS (By Abdul Bari Sir Lecture)
1. Visiting a vertex
2. Exploration of vertex

BFS
We explore a vertex completely, then we go to next vertex for exploration
Like Queue(FIFO)

DFS 
Once we visited a vertex, once we start exploring it, we suspend its exploration ,
then go for next vertex for exploration, and recursively continue this process. 
Like Stack!(LIFO)
*/



/*
Time Complexity of DFS / BFS based on Graph Representation

For Adjacency List Representation of Graph
Time Complexity of DFS / BFS
=> O(V+E) 
Processing each node once O(V) + traversing all edge lists O(E)
so O(V + E)

For Adjacency Matrix Representation of Graph
Time Complexity of DFS / BFS
=> O(V*V)
Checking every column O(V) in a row  for each of the V nodes
so O(V*V)
*/
