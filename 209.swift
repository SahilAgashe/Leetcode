// 209. Minimum Size Subarray Sum
// https://leetcode.com/problems/minimum-size-subarray-sum/description/
// Medium

// Naive Approach or Bruteforce
// TC = O(n^2) ; On Submission Giving TLE 
class Solution1 {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        
        let n = nums.count
        var ans = Int.max

        // subarray starts with index i 
        for i in 0..<n {
            var sum = 0
            // subarray ends with index j
            for j in i..<n {
                sum += nums[j]
                if sum >= target {
                    ans = min(ans, j - i + 1)
               }
            }
        }

        return ans == Int.max ? 0 : ans
    }
}

// Approach: Sliding Window (Two Pointer - Sliding Window)
// TC = O(2N) = O(N)
// It has while loop, still its time complexity is O(2N) = O(N)
// Even though there is a while loop inside the for loop,
// each element is added by right once and removed by left at most once.
// So, TC = O(2N) = O(N)
class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var ans = Int.max
        var left = 0 
        let n = nums.count
        var sum = 0
        for right in 0..<n {
            sum += nums[right]
            while sum >= target {
                ans = min(ans, right - left + 1)
                sum -= nums[left]
                left += 1
            }
        }

        return ans == Int.max ? 0 : ans
    }

    // Ref: https://www.youtube.com/watch?v=A5XgKA7FDQE (Anjali Kumari)
}
