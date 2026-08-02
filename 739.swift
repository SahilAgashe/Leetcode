// 739. Daily Temperatures
// https://leetcode.com/problems/daily-temperatures/description/
// Medium (Easy As Per SAA)

class Solution {

    // TC = O(n), SC = O(n)
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        let n = temperatures.count
        var answer = [Int](repeating: 0, count: n)
        // Monotonic stack, storing indexes of elements (Elements are increasing from top to bottom in stack)
        var stack = [Int]() 

        for i in (0..<n).reversed() { // TC = O(n)
            let temp = temperatures[i]

            // TC = O(1)
            while let topIndex = stack.last, temp >= temperatures[topIndex] {
                stack.popLast()
            }

            // We got index of next greater element
            if let topIndex = stack.last {
                answer[i] = topIndex - i
            }

            // pushing indexing of current element
            stack.append(i)
        }
        return answer
    }
}
