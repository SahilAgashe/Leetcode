// 42. Trapping Rain Water
// https://leetcode.com/problems/trapping-rain-water/description/
// Hard

// MARK: Topic => Array Preprocessing 
class Solution {
    func trap(_ height: [Int]) -> Int {
        let n = height.count
        var ans = 0
        // base cases
        if n <= 2  { return ans}

        // lmx[i] => Max value from height[0] to height[i] , including both ends , while left traversal
        var lmx = Array<Int>(repeating: 0, count: n)
        // rmx[i] => Max value from height[i] to height[n - 1] , including both ends , while right traversal
        var rmx = Array<Int>(repeating: 0, count: n)

        lmx[0] = height[0]
        rmx[n - 1] = height[n - 1]

        for i in 1..<n {
            lmx[i] = max(lmx[i - 1], height[i])
        }

        for i in (0..<(n - 1)).reversed() {
            rmx[i] = max(rmx[i + 1], height[i])
        }

        for i in 1..<(n - 1) {
            let left = lmx[i - 1]
            let right = rmx[i + 1]
            let diff = min(left, right) - height[i]
            let waterTrapped = diff < 0 ? 0 : diff
            ans = ans + waterTrapped 
        }

        return ans
    }
}

/*
Dry Run
a    [0,1,0,2,1,0,1,3,2,1,2,1]

lmx  0,1,1,2,2,2,2,3,3,3,3,3
rmx  3,3,3,3,3,3,3,3,2,2,2,1
w[i]  0,0,1,0,1,2,1,0,0,1,0,0

lmx[i] => max of a[0] to a[i] (including both ends) while left traversal
rmx[i] => max of a[i] to a[n - i] (including both ends) while right traversal
w[i] => water trapped at i 

w[i] => min(lmx[i - 1] , rmx[i + 1]) - a[i]
w[0] = 0
w[n - 1] = 0

Ans = Total trapped rain water => sum of all w[i]
*/
