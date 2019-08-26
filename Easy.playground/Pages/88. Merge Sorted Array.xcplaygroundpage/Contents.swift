/// # 88. Merge Sorted Array

class Solution {
    
    /// - Parameters:
    ///   - nums1: [1, 1, 5, 0, 0, 0]
    ///   - m: 3
    ///   - nums2: [0, 1, 4]
    ///   - n: 3
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = m - 1, j = n - 1
        while i >= 0 || j >= 0 {
            if j < 0 || (i >= 0 && nums1[i] > nums2[j]) {
                nums1[i + j + 1] = nums1[i]
                i -= 1
            } else {
                nums1[i + j + 1] = nums2[j]
                j -= 1
            }
        }
    }
}

/// Test Case
var nums1: [Int] = [1, 1, 5, 0, 0, 0]
let m = 3
var nums2: [Int] = [0, 1, 4]
let n = 3
Solution().merge(&nums1,m,nums2,n)

