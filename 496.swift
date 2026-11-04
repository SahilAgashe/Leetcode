// 496. Next Greater Element I
// https://leetcode.com/problems/next-greater-element-i/description/
// Easy


class Solution {
    // TC = O(n + m), SC = O(n) , n = nums2.count , m = nums1.count
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var nextGreaterMap = Dictionary<Int, Int>() // Element --> Next greater element
        let n = nums2.count 

        // Here we are using Monotonic Stack (Monotonic Decreasing Stack)
        // Monotonic stack has decreasing order from bottom to top 
        // largest element at bottom, smallest element at top in the stack
        var stack = Array<Int>() 

        for i in (0..<n).reversed() {
            // The nested while loop does constant O(1) operations on average across all iterations.
            while let last = stack.last, nums2[i] >= last {
                stack.popLast()
            }

            // Top of stack is next greater; if stack is empty, default to -1
            nextGreaterMap[nums2[i]] = stack.last ?? -1

            stack.append(nums2[i])
        }

        return nums1.map { nextGreaterMap[$0, default: -1]}
    }
}

// Next / Previous Greater => Monotonic Decreasing Stack from bottom to top (largest element at bottom)
// Next / Previous Smaller => Monotonic Increasing Stack from bottom to top (smallest element at bottom)


class Learning {
    // Problem: https://www.geeksforgeeks.org/problems/next-larger-element-1587115620/1 
    
    /*
    You are given an array arr[] of integers, the task is to find the next greater for each element of the array in order of their appearance in the array. Next greater element of an element in the array is the nearest element on the right which is greater than the current element.
    If there does not exist next greater of current element, then next greater element for current element is -1.

    Input: arr[] = [1, 3, 2, 4]
    Output: [3, 4, 4, -1]
    Explanation: The next larger element to 1 is 3, 3 is 4, 2 is 4 
    and for 4, since it doesn't exist, it is -1.
    */

    // Naive Or Bruteforce 
    // TC = O(N^2)
    func nextGreaterElementNaive(_ arr: [Int]) -> [Int] {
        var ans = Array(repeating: -1, count: arr.count)

        for i in 0..<arr.count {
            for j in (i + 1)..<arr.count {
                if arr[j] > arr[i] {
                    ans[i] = arr[j]
                    break
                }
            }
        }

        return ans
    }

    // Naive Or Bruteforce 
    // TC = O(N)
    func nextGreaterElement(_ arr: [Int]) -> [Int] {
        var ans = Array(repeating: -1, count: arr.count)

        // Here we are using Monotonic Stack (Monotonic Decreasing Stack)
        // Monotonic stack has decreasing order from bottom to top 
        // largest element at bottom, smallest element at top in the stack
        var stack = Array<Int>() 

        for i in (0..<arr.count).reversed() {
            // The nested while loop does constant O(1) operations on average across all iterations.
            while let last = stack.last, arr[i] >= last {
                stack.popLast()
            }

            // Top of stack is next greater; if stack is empty, default to -1
            ans[i] = stack.last ?? -1

            stack.append(arr[i])
        }

        return ans

        // Here TC = O(N)
        /*
        Why is the TC = O(N)?
        1. Outer for loop: Runs exactly N times (once for each element in arr).
        2. Inner while loop: Runs only when elements are popped from the stack.
        3. The Key Insight: Every element in arr is pushed onto the stack exactly ONCE and popped from the stack at most ONCE.
            * You can't pop an item that was never pushed.
            * Therefore, across the entire execution of the for loop, stack.removeLast() can execute at most N times total—not N times per outer loop iteration.
        This concept is called Amortized Analysis. The nested while loop does constant O(1) operations on average across all iterations.
        */
    }
}
