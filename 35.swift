// 35. Search Insert Position
// https://leetcode.com/problems/search-insert-position/description/
// Easy

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        modifiedBinarySearch(nums, target)
    }

    func modifiedBinarySearch(_ arr: [Int], _ key: Int) -> Int {
        var low = 0
        var high = arr.count - 1
        var mid = -1
    
        while low <= high {
            mid = low + ((high - low) / 2)
            if arr[mid] > key {
                high = mid - 1
            } else if arr[mid] < key {
                low = mid + 1
            } else {
                return mid
            }
        }
        return arr[mid] > key ? mid : mid + 1
    }
}