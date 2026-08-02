// 703. Kth Largest Element in a Stream
// https://leetcode.com/problems/kth-largest-element-in-a-stream/description/
// Easy 


import Collections 
// heap: https://swiftpackageindex.com/apple/swift-collections/main/documentation/heapmodule/heap
class KthLargest {
    private var minHeap = Heap<Int>() // SC = O(k), heap of size k 
    private let k: Int

    // TC = O(nlogk)
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        for num in nums {
            minHeap.insert(num)
            if minHeap.count > k {
                minHeap.popMin()
            }
        }
    }
    
    // TC = O(logk)
    func add(_ val: Int) -> Int { 
        minHeap.insert(val)
        if minHeap.count > self.k {
            minHeap.popMin()
        }
        return minHeap.min!
    }
}

/**
 * Your KthLargest object will be instantiated and called as such:
 * let obj = KthLargest(k, nums)
 * let ret_1: Int = obj.add(val)
 */
