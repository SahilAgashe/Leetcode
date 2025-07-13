// 380. Insert Delete GetRandom O(1)
// https://leetcode.com/problems/insert-delete-getrandom-o1/description/
// Medium


// Recap 
// We can use (Hash Table) Dictionary (Unordered Map) for insertion and removal
// For getRandom we can try to use Array
// We can implement RandomizedSet using Dictionary And Array
class RandomizedSet {

    private var array: Array<Int>
    private var unorderedMap: Dictionary<Int, Int> // Element <--> Index
    private var size: Int

    init() {
        array = Array<Int>()
        unorderedMap = Dictionary<Int, Int>()
        size = 0
    }
    
    func insert(_ val: Int) -> Bool { // Avg TC = O(1) , Dictionary == Hash Table
        if unorderedMap[val] == nil {
            array.append(val)
            unorderedMap[val] = size
            size = size + 1
            return true
        }
        return false
    }
    
    func remove(_ val: Int) -> Bool { // Avg TC = O(1)
        if let valIndex = unorderedMap[val] {
            array[valIndex] = array[size - 1]
            unorderedMap[array[size - 1]] = valIndex
            array.removeLast()
            size = size - 1
            unorderedMap[val] = nil
            return true
        }
        return false
    }
    
    
    func getRandom() -> Int { // Avg TC = O(1)
        let random = Int.random(in: 0...(size - 1))
        return array[random % size]
    }
    /*
    Swift's implementation of Int.random(in:) uses:
    1] A fast cryptographically secure random number generator: 
     SystemRandomNumberGenerator (based on arc4random_buf or getrandom())
    2] Daniel Lemire’s algorithm to map a 64-bit random number to a target range efficiently and without modulo bias.
    3] Worst Case => >O(1) , constant time , Avg Case => O(1)
    4] For all practical purposes, Int.random(in:) is constant time.
       It's fast, secure, and high-quality — suitable for most use cases.
    */
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */