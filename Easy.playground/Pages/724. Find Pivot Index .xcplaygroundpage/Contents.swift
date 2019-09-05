/// # 724. Find Pivot Index

class Solution {
    
    /// - Parameter nums: [1, 7, 3, 6, 5, 6]
    /// - Returns: 3
    func pivotIndex(_ nums: [Int]) -> Int {
        var right = 0
        var left = 0
        for i in 0..<nums.count {
            right += nums[i]
        }
        for i in 0..<nums.count {
            right -= nums[i]
            if left == right {
                return i
            }
            left += nums[i]
        }
        return -1
    }
}

/// Test Case
//let nums = [-1,-1,-1,-1,-1,0]
let nums = [1, 7, 3, 6, 5, 6]
Solution().pivotIndex(nums)
