// 496. Next Greater Element I
// https://leetcode.com/problems/next-greater-element-i/description/
// Easy


// Monotonic Stack Used: Monotonically Increasing from top to bottom
class Solution1 {

    // TC = O(n + m), SC = O(n) , n = nums2.count , m = nums1.count
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let n = nums2.count 
        var nextGreaterMap = [Int: Int]() 
        var stack = [Int]()

        // Traversing nums2 in reverse order
        for i in (0..<n).reversed() { 
            let curr = nums2[i]

            // The nested while loop does constant O(1) operations on average across all iterations.
            // The Key Insight: Every element in nums2 is pushed onto the stack exactly ONCE and popped from the stack at most ONCE.
            // Pop elements smaller than or equal to current
            while let last = stack.last, last <= curr {
                stack.popLast()
            }

            

            // Top of stack is next greater; if stack is empty, default to -1
            nextGreaterMap[curr] = stack.last ?? -1

            // Push current element for future items
            stack.append(curr)
        }

        return nums1.map { nextGreaterMap[$0, default: -1] }
    }
}


// Used reversed() on array directly instead of range
class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var nextGreaterMap = [Int: Int]() 
        var stack = [Int]()

        // Traversing nums2 in reverse order
        for num in nums2.reversed() {
            // Pop elements smaller than or equal to current
            while let last = stack.last, last <= num {
                stack.popLast()
            }

            // Top of stack is next greater; if stack is empty, default to -1
            nextGreaterMap[num] = stack.last ?? -1

            // Push current element for future items
            stack.append(num)
        }

        return nums1.map { nextGreaterMap[$0, default: -1] }
    }
}

/*
Why is the loop O(N) amortized?
1. Outer for loop: Runs exactly N times (once for each element in nums2).
2. Inner while loop: Runs only when elements are popped from the stack.
3. The Key Insight: Every element in nums2 is pushed onto the stack exactly ONCE and popped from the stack at most ONCE.
    * You can't pop an item that was never pushed.
    * Therefore, across the entire execution of the for loop, stack.removeLast() can execute at most N times total—not N times per outer loop iteration.
This concept is called Amortized Analysis. The nested while loop does constant O(1) operations on average across all iterations.
*/
