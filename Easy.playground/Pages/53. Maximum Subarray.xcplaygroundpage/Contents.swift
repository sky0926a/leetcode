/// # 53. Maximum Subarray

class Solution {
    
    /// - Parameter nums: [-2,1,-3,4,-1,2,1,-5,4]
    /// - Returns: 6
    func maxSubArray(_ nums: [Int]) -> Int {
        guard var maxValue = nums.first else {
            return 0
        }
        var last = maxValue
        for i in 1..<nums.count {
            last = max(nums[i], nums[i] + last)
            maxValue = max(maxValue, last)
        }
        
        return maxValue
    }
}

/// Test Case
let nums = [-2,1,-3,4,-1,2,1,-5,4]
Solution().maxSubArray(nums)
