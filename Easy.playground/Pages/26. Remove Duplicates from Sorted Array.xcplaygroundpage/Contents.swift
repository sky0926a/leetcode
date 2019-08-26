/// # 26. Remove Duplicates from Sorted Array

class Solution {
    
    /// - Parameter nums: [0,0,1,1,1,2,2,3,3,4]
    /// - Returns: 5
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        var index = 0;
        for i in 1..<nums.count{
            if (nums[i] != nums[index]) {
                index += 1
                nums[index] = nums[i]
            }
        }
        return index + 1
    }
}

/// Test Case
var input = [0,0,1,1,1,2,2,3,3,4]
Solution().removeDuplicates(&input)
print(input)
