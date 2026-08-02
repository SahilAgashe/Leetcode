// 973. K Closest Points to Origin
// https://leetcode.com/problems/k-closest-points-to-origin/description/
// Medium (Easy As Per SAA)


import Collections 
// heap: https://swiftpackageindex.com/apple/swift-collections/main/documentation/heapmodule/heap

// Using Min Heap, Based On Closest Distance
class Solution {
    private struct PointDistance: Comparable {
        let point: [Int]
        let distanceSqare: Int

        init(point: [Int]){
            self.point = point
            let x = point[0]
            let y = point[1]
            self.distanceSqare = x * x + y * y
        }

        // Based On Closest To Origin
        static func <(lhs: PointDistance, rhs: PointDistance) -> Bool {
            return lhs.distanceSqare > rhs.distanceSqare
        }
    }

    // TC = O(nlogk), n = points, SC = O(k)
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var minHeap = Heap<PointDistance>()

        for p in points {
            let pointDistance = PointDistance(point: p)
            minHeap.insert(pointDistance)
            if minHeap.count > k {
                minHeap.popMin()
            }
        }

        let minHeapArray: [PointDistance] = minHeap.unordered
        return minHeapArray.map { $0.point }
    }
}

// Using Max Heap, Based On Distance
class Solution2 {
    private struct Point: Comparable {
        let x: Int
        let y: Int
        let distanceSqare: Int

        init(x: Int, y: Int){
            self.x = x
            self.y = y
            self.distanceSqare = x * x + y * y
        }

        // Based on distance
        static func <(lhs: Point, rhs: Point) -> Bool {
            return lhs.distanceSqare < rhs.distanceSqare
        }
    }

    // TC = O(nlogk), n = points, SC = O(k)
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var maxHeap = Heap<Point>()

        for p in points {
            let x = p[0]
            let y = p[1]
            let point = Point(x: x, y: y)
            maxHeap.insert(point)
            if maxHeap.count > k {
                maxHeap.popMax()
            }
        }

        let maxHeapArray: [Point] = maxHeap.unordered
        return maxHeapArray.map { [$0.x, $0.y] }
    }
}
