/// # 189. Rotate Array

class Solution {
    
    /// - Parameters:
    ///   - nums: [1, 2, 3, 4, 5, 6, 7]
    ///   - k: 3
    /// - Returns:
    ///   - nums: [5, 6, 7, 1, 2, 3, 4]
    func rotate(_ nums: inout [Int], _ k: Int) {
        let k = k % nums.count
        reverse(&nums, from: 0, to: nums.count)
        reverse(&nums, from: 0, to: k)
        reverse(&nums, from: k, to: nums.count)
    }
    
    func reverse(_ nums: inout [Int], from startIndex: Int, to endIndex: Int) {
        var start = startIndex
        var end = endIndex - 1
        while start < end {
            let tmp = nums[start]
            nums[start] = nums[end]
            nums[end] = tmp
            start += 1
            end -= 1
        }
    }
}

var input = [1, 2, 3, 4, 5, 6, 7]
Solution().rotate(&input, 3)
print(input)
