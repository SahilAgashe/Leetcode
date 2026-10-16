// 70. Climbing Stairs
// https://leetcode.com/problems/climbing-stairs/description/
// Easy

// Topic: Fibonacci Series
// TC = O(1) , Updating fibonacci stoarge array initialy => O(k) TC , k is size of array
class Solution {
    var storage = Array<Int>(repeating: 0, count: 46)

    init() {
        for i in 0..<46 {
            if i <= 3 { 
                storage[i] = i
            } else {
                storage[i] = storage[i - 1] + storage[i - 2]
            }
        }
    }

    func climbStairs(_ n: Int) -> Int {
        return storage[n]
    }

}

/* 
for n = 1, ans => 1
for n = 2, ans => 2 
for n = 3, ans => 3
for n = 4, ans => 5 [(1,1,1,1),(1,1,2),(1,2,1),(2,1,1),(2,2)]
for n = 5, ans => 8 

f(n) = n , n <= 3 
f(n) = f(n - 1) + f(n - 2) , n > 3 , Fibbonacci Series
*/
