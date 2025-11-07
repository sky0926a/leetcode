struct SolutionLC0001 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var index: [Int: Int] = [:]
        for (i, value) in nums.enumerated() {
            if let j = index[target - value] {
                return [j, i]
            }
            index[value] = i
        }
        return []
    }
}
