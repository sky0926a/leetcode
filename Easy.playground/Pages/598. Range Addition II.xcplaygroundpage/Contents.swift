/// # 598. Range Addition II

class Solution {
    
    /// - Parameters:
    ///   - m: 3
    ///   - n: 3
    ///   - ops: [[2,2],[3,3]]
    /// - Returns: 4
    func maxCount(_ m: Int, _ n: Int, _ ops: [[Int]]) -> Int {
        guard ops.count > 0 else {
            return m * n
        }
        var m = m
        var n = n
        for i in 0..<ops.count {
            m = min(m, ops[i][0])
            n = min(n, ops[i][1])
        }
        return m * n
    }
}

/// Test Case
let m = 3
let n = 3
let ops = [[2,2],[3,3]]
Solution().maxCount(m, n, ops)
