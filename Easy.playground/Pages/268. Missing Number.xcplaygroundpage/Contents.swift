/// # 268. Missing Number

class Solution {
    
    /// - Parameter nums: [3, 0, 1]
    /// - Returns: 2
    func missingNumber(_ nums: [Int]) -> Int {
        var nums = nums.sorted()
        for i in 0..<nums.count {
            if nums[i] != i {
                return i
            }
        }
        return nums.count
    }
}

/// Test Case
let input = [3,0,1]
Solution().missingNumber(input)
