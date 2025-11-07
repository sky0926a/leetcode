struct SolutionLC0035 {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else { return 0 }
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
