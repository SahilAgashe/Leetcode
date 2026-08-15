// 862. Shortest Subarray with Sum at Least K
// https://leetcode.com/problems/shortest-subarray-with-sum-at-least-k/description/
// Hard but As Per SAA, it is very Easy

import Collections 

// Using Monotonically increasing deque to get min prefix sum
class Solution {
     // Complexity Analysis
     // TC: O(N) — Throughout the entire algorithm, each index is popped from the front at most once and from the back at most once.
     // SC: O(N) — To store prefix sums 
    func shortestSubarray(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var ans = n + 1
        // prefixSums[i] = P[i] = sum(nums[0...i])
        var prefixSums = Array<Int>(repeating: 0, count: n)
        //The Deque is a monotonically increasing queue 
        // that stores the indices of the prefixSums array such that
        // their corresponding prefix sum values are in strictly increasing order.
        var deque = Deque<Int>()

        // Step 1: Compute Prefix Sums where prefixSums[i] = sum(nums[0...i]) = P[i]
        var currSum = 0
        for i in 0..<n {
            currSum += nums[i]
            prefixSums[i] = currSum
        }

        for i in 0..<n {
            let currSum = prefixSums[i]

            // Subarray starting at index 0 (nums[0...i])
            if currSum >= k {
                ans = min(ans , i + 1)
            }

            // Subarray starting after index j (nums[j+1...i])
            // 1. Peek at the smallest prefix sum using `.first`
            // 2. Check if currSum - prefixSums[firstIndex]) >= k
            while let firstIndex = deque.first, (currSum - prefixSums[firstIndex]) >= k {
                let j = firstIndex
                // let length = i - (j + 1) + 1  = i - j - 1 + 1 = i - j
                ans = min(ans, i - j)
                let _ = deque.popFirst()
            }
            // Danger Zone || Mistake Zone in above while condition
            // If you use popFirst() directly in the while let condition, 
            // you permanently delete an element from the deque even when 
            // it fails the condition (currSum - prefixSums[firstIndex]) >= k
            // So, first use first, check condition, then only pop!

            // Maintain monotonically increasing deque
            while let lastIndex = deque.last, currSum <= prefixSums[lastIndex] {
                let _ = deque.popLast()
            }

            deque.append(i)
        }

        return ans <= n ? ans : -1
    }
}


// Using min heap to get min prefix sum
class SolutionUsingMinHeap {
    private struct HeapElement: Comparable {
        let value: Int
        let index: Int

        static func < (lhs: HeapElement, rhs: HeapElement) -> Bool {
            lhs.value < rhs.value
        }
    }

     // Complexity Analysis
     // TC: O(Nlog N) — Each element is inserted into the heap once and popped at most once.
     // SC: O(N) — To store prefix sums and heap elements.
    func shortestSubarray(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var ans = n + 1
        // prefixSums[i] = P[i] = sum(nums[0...i])
        var prefixSums = Array<Int>(repeating: 0, count: n)
        var minHeap = Heap<HeapElement>()

        // Step 1: Compute Prefix Sums where prefixSums[i] = sum(nums[0...i]) = P[i]
        var currSum = 0
        for i in 0..<n {
            currSum += nums[i]
            prefixSums[i] = currSum
        }

        for i in 0..<n {
            let currSum = prefixSums[i]

            // Subarray starting at index 0 (nums[0...i])
            if currSum >= k {
                ans = min(ans , i + 1)
            }

            // Subarray starting after index j (nums[j+1...i])
            // 1. Peek at the smallest prefix sum using `.min`
            // 2. Check if currSum - top.value >= targetK
            while let top = minHeap.min, (currSum - top.value) >= k {
                let j = top.index
                // let length = i - (j + 1) + 1  = i - j - 1 + 1 = i - j
                ans = min(ans, i - j)
                let _ = minHeap.popMin()
            }
            // Danger Zone || Mistake Zone in above while condition
            // If you use popMin() directly in the while let condition, 
            // you permanently delete an element from the heap even when 
            // it fails the condition (currSum - top.value) >= k
            // So, first use min, check condition, then only pop!

            let heapElement = HeapElement(value: currSum, index: i)
            minHeap.insert(heapElement)
        }
        // return (ans == n + 1) ? -1 : ans , OR use below
        return ans <= n ? ans : -1
    }
}

/*
To make a subarray sum as large as possible (>= K), you need to subtract the smallest possible prefix sum from your current prefix sum.

Mathematically, the sum of a subarray ending at index i and starting after index j is:
Subarray Sum = P[i] - P[j]

We want this difference to be at least K:
P[i] - P[j] >= K  ==>>  P[j] <= P[i] - K

Key Reasons Behind Using Minimum Prefix Sum
* Maximizing the Difference: For a fixed current prefix sum P[i], 
making P[i] - P[j] large requires P[j] to be as small as possible. 
If P[j] were large, subtracting it would make the resulting subarray sum smaller, 
making it harder to reach K.
* If we use maximum prefix sum p[j], it will decreases P[i] - P[j] (makes reaching >= K harder).


Intuitive Comparison
Using Minimum Prefix Sum P[j]	
Increases P[i] - P[j] 
(helps reach >= K).
Keeps smaller values that are easy to surpass.

Using Maximum Prefix Sum P[j]
Decreases P[i] - P[j]      
(makes reaching >= K harder).
Keeps large values that yield tiny or negative subarray sums.
*/



// Variant: Shortest Subarray with Sum at Least K , nums only positive
// 209. Minimum Size Subarray Sum
// Solution: We can use Variable Sliding Window, in this variant. 
// But we can't use Variable Sliding Window in 862
