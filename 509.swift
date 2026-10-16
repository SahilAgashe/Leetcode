// 509. Fibonacci Number
// https://leetcode.com/problems/fibonacci-number/description/
// Easy 

// Using Binet's Formula which uses Golden Ratio, TC = O(1) , 
// TC = O(1) assuming floating-point power operations run in constant time
class SolutionOptimized {
    func fib(_ n: Int) -> Int {
        let phi: Float = (1 + sqrt(5)) / 2
        let ans = (pow(phi, Float(n)) - pow((1 - phi), Float(n))) / sqrt(5)
        return Int(ans)
    }
}

/*
Any Fibonacci number can be calculated by using this formula, 
f(n) =  (φ^n − (1−φ)^n)/√5
f(n) denotes the Fibonacci number to be calculated
φ is the Golden ratio is (1 + √5)/2 = 1.618034 
*/


// TC = O(1), if we consider storage array update initially only time, k is size of the array
class Solution {
    private var storage = [Int](repeating: 0, count: 31)

    init() {
        storage[0] = 0
        storage[1] = 1
        storage[2] = 1 

        for i in 3..<31 {
            storage[i] = storage[i - 1] + storage[i - 2]
        }
    }
    func fib(_ n: Int) -> Int {
        return storage[n]
    }
}
