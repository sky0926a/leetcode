struct SolutionLC0026 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        var index = 0
        for i in 1..<nums.count {
            if nums[i] != nums[index] {
                index += 1
                nums[index] = nums[i]
            }
        }
        return index + 1
    }
}
