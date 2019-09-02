/// # 35. Search Insert Position

class Solution {
    
    /// - Parameters:
    ///   - nums: nums = [1,3,5,6]
    ///   - target: 5
    /// - Returns: 2
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else { return 0 }
        var start = 0
        var end = nums.count - 1
        while start + 1 < end {
            let middle = (start + end) / 2
            let value = nums[middle]
            if value == target {
                return middle
            } else if value > target {
                end = middle - 1
            } else {
                start = middle + 1
            }
        }
        
        if nums[start] >= target {
            return start
        } else if nums[end] >= target {
            return end
        }
        
        return end + 1
    }
}

/// Test Case
let nums = [1,3,5,6]
let target = 5

Solution().searchInsert(nums, target)
