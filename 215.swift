// 215. Kth Largest Element in an Array
// https://leetcode.com/problems/kth-largest-element-in-an-array/description/
// Medium (Easy As Per SAA)


import Collections // Apple's Swift Collections package 

class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var minHeap = Heap<Int>() // will use heap of size k 

        for num in nums {
            minHeap.insert(num) // O(logk)
            // Will need to maintain heap of size k 
            if minHeap.count > k {
                minHeap.removeMin()
            }
        }
        // kth largest element => (n - k + 1)th smallest 
        // That's why we maintain heap of size k
        // The root of the min-heap is the kth largest element
        return minHeap.min!
    }
}

/* 
Intution Behind Using Min Heap 
10, 9, 8, 7, 6, 5 , 4, 3, 2, 1
for n = 10 elements
1st largest => 10 , 10th smallest = 10 
2nd largest => 9 , 9th smallest => 9 
3rd largest => 8 , 8th smallest => 8 
...
10th largest => 10, 1st smallest => 1

kth largest => (n - k + 1)th smallest 
*/
