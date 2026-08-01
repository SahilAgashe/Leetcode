// 692. Top K Frequent Words
// https://leetcode.com/problems/top-k-frequent-words/description/
// Medium (Easy As Per SAA)

import Collections 

class Solution {
    // ElementCount
    private struct ElementCount: Comparable {
        let word: String 
        let count: Int 

        static func <(lhs: ElementCount, rhs: ElementCount) -> Bool {
            if lhs.count == rhs.count {
                return lhs.word > rhs.word
            } else {
                 return lhs.count < rhs.count
            }
        }
    }

    // TC = O(nlogk) SC = O(n)
    func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        var frequencyMap = [String: Int]() 
        var minHeap = Heap<ElementCount>() 

        for word in words {
            frequencyMap[word, default: 0] += 1
        }

        for (word, count) in frequencyMap {
            let elementCount = ElementCount(word: word, count: count) 
            minHeap.insert(elementCount)
            if minHeap.count > k {
                minHeap.removeMin()
            }
        }

        let minHeapArray: [ElementCount] = minHeap.unordered.sorted(by: {
                if $0.count == $1.count {
                    return $0.word < $1.word
                } else {
                    return $0.count > $1.count
                }
            }
        )

        return minHeapArray.map { $0.word }
    }
}
