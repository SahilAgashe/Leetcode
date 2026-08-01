// 347. Top K Frequent Elements
// https://leetcode.com/problems/top-k-frequent-elements/description/
// Medium (Easy As Per SAA)

import Collections 

class Solution {
    private struct ElementCount: Comparable {
        let number: Int 
        let frequency: Int 

        static func < (lhs: ElementCount, rhs: ElementCount) -> Bool {
            return lhs.frequency < rhs.frequency
        }
    }

    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var frequencyMap = [Int: Int]() 
        var minHeap = Heap<ElementCount>()

        for num in nums {
            frequencyMap[num, default: 0] += 1 
        }

        for (num, count) in frequencyMap {
            let elementCount = ElementCount(number: num, frequency: count)
            minHeap.insert(elementCount)
            // We need to maintain heap of size k
            if minHeap.count > k {
                minHeap.removeMin()
            }
        }

        let minHeapArray: [ElementCount] = minHeap.unordered
        return minHeapArray.map { $0.number }
    }
}

/*
1] Size Constraint O(K): By popping elements whenever minHeap.count > k, the heap only maintains the $K$ highest-frequency elements.
2] minHeap.unordered: Since the final order of elements in the output doesn't matter (per LeetCode requirements), extracting elements using .unordered avoids extra sorting overhead when converting the heap to an array.
*/
