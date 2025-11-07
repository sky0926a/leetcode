struct SolutionLC0724 {
    func pivotIndex(_ nums: [Int]) -> Int {
        var right = nums.reduce(0, +)
        var left = 0
        for (index, value) in nums.enumerated() {
            right -= value
            if left == right {
                return index
            }
            left += value
        }
        return -1
    }
}
