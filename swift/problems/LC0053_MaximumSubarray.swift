struct SolutionLC0053 {
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
