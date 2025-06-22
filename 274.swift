// 274. H-Index
// https://leetcode.com/problems/h-index/description/
// Medium 

class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        let n = citations.count
        var freq = Array(repeating: 0, count: n + 2) // indexing 0...(n + 1)

        for i in 0..<n {
            let val = citations[i]
            if val > n { freq[n + 1] += 1} 
            else {
                freq[val] += 1
            }
        }

        var count = 0
        for i in (0...(n + 1)).reversed() {
            count += freq[i]
            if count >= i { return i }
        }

        return 0
    }
}
// TC => O(n) , SC = O(n)