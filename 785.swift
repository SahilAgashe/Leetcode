// 785. Is Graph Bipartite?
// https://leetcode.com/problems/is-graph-bipartite/description/
// Medium


class Solution {
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
