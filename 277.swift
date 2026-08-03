// 277. Find the Celebrity
// Premium Leetcode 277 Question 
// https://leetcode.ca/2016-09-02-277-Find-the-Celebrity/ 
// Medium (Easy As Per SAA) 

class SolutionLeetcode277 {
    
    // MARK: - Problem
    /*
     Suppose you are at a party with n people labeled from 0 to n - 1 and among them, there may exist one  celebrity. The definition of a celebrity is that all the other n - 1 people know the celebrity, but the celebrity does not know any of them.

     Now you want to find out who the celebrity is or verify that there is not one. You are only allowed to ask questions like: "Hi, A. Do you know B?" to get information about whether A knows B. You need to find out the celebrity (or verify there is not one) by asking as few questions as possible (in the asymptotic sense).

     You are given a helper function bool knows(a, b) that tells you whether a knows b. Implement a function int findCelebrity(n). There will be exactly one celebrity if they are at the party.

     Return the celebrity's label if there is a celebrity at the party. If there is no celebrity, return -1.
     */
    
    // MARK: - Solution
    
    /*
    The knows API is already defined for you.
    return a bool, whether a knows b
    func knows(a: Int, b: Int) -> Bool
     */
    
    // Checks whether a knows b.
    // It is already provided by leetcode, defined by me here just for running code!.
    private func knows(_ a: Int, _ b: Int) -> Bool {
        return Bool.random()
    }
    
    func findCelebrity(_ n: Int) -> Int {
        var candidate = -1
        
        // Find the potential candidate
        for i in 0..<n {
            if i == 0 {
                candidate = i
            } else {
                if knows(candidate, i) {
                    // so candidate will not be celebrity
                    // update potential candidate
                    candidate = i
                }
            }
        }
        
        // Now, Check if the candidate is a valid celebrity
        // by ensuring that everyone knows this person and this person knows no one
        for i in 0..<n {
            if candidate == i {
                continue
            }
            if !knows(i, candidate) || knows(candidate, i) {
                return -1
            }
        }
        
        return candidate
    }
}

// Matrix input format | Also ON GFG
// https://www.geeksforgeeks.org/problems/the-celebrity-problem/1
