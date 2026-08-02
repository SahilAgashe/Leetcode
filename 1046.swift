// 1046. Last Stone Weight
// https://leetcode.com/problems/last-stone-weight/description/
// Easy (Very Easy As Per SAA)

import Collections 
// heap: https://swiftpackageindex.com/apple/swift-collections/main/documentation/heapmodule/heap/init(_:)
class Solution {
    // TC = O(n + nlogn), SC = O(n)
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var maxHeap = Heap<Int>(stones) // Array to heap TC = O(n), SC = O(n)

        // TC = O(nlogn)
        while maxHeap.count > 1 {
            let heaviest = maxHeap.removeMax() 
            let secondHeaviest = maxHeap.removeMax()
            maxHeap.insert(heaviest - secondHeaviest)
        }

        return maxHeap.max!
    }
}
