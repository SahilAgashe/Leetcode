// 239. Sliding Window Maximum
// https://leetcode.com/problems/sliding-window-maximum/description/
// Hard (Easy As Per SAA)


import Collections 
// Deque module: https://swiftpackageindex.com/apple/swift-collections/main/documentation/dequemodule
class Solution {
    // Type: Monotonic Decreasing Deque
    // Why Decreasing Monotonic Condition, see at the bottom 
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        // Storing indexes for tracking k sized window
        var deque = Deque<Int>() 
        var ans = Array<Int>()

        for (index, num) in nums.enumerated() {
            // 1. Remove indices that are outside the current window
            // Window of size k ending at current index (including)
            // index - x + 1 = k , so x = index - k + 1
            if let first = deque.first, first <= (index - k) {
                deque.popFirst()
            }

            // 2. Maintain monotonic decreasing order:
            // Remove smaller elements from the back because they can never be the max
            while let top = deque.last, num >= nums[top] {
                deque.popLast()
            }

            // 3. Append current index
            deque.append(index)

            // 4. Record maximum for k sized windows
            if index >= (k - 1), let first = deque.first {
                let max = nums[first]
                ans.append(max)
            }
        }
        return ans
    }
}

/*
Why Decreasing Monotonic Condition? 
===> 
Here leetcode question asks to find maiximum of sliding window
So, What if we use increasing monotonic condition
if we get a smaller number during traversal, then we need to pop all maximum elements then we need to push that smaller number to maintain increasing monotonic order. 
So thats why we maintain decreasing monotonic order, 
so if we get smaller number or larger number, still we will have largest number in data structure. 

Same thinking will be applied to solve any monotonic data structure questions 
like monotonic stack. 
*/

/*
Core Rule of Thumb
Need Maximum in a range? => Decreasing Monotonic (Front is Max)
Need Minimum in a range? => Increasing Queue (Front is Min)
*/

/*
Complexity Analysis
* Time Complexity: O(N)
    * You loop through the array of length N once.
    * Every element (index) is appended to the deque exactly once and popped at most once.
    * Although there is a while loop inside the main loop, 
      across the entire execution of the function, deque.popLast() runs at most N times. 
    * This gives an amortized O(1) time per element, yielding an overall time complexity of O(N).
* Space Complexity: O(k)
    * The deque stores at most k elements at any given time (excluding the ans array needed for the output).
*/
