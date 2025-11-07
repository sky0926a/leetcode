struct SolutionLC0268 {
    func missingNumber(_ nums: [Int]) -> Int {
        let sorted = nums.sorted()
        for i in 0..<sorted.count {
            if sorted[i] != i {
                return i
            }
        }
        return sorted.count
    }
}
