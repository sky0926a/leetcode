struct SolutionLC0189 {
    func rotate(_ nums: inout [Int], _ k: Int) {
        guard !nums.isEmpty else { return }
        let k = k % nums.count
        reverse(&nums, from: 0, to: nums.count)
        reverse(&nums, from: 0, to: k)
        reverse(&nums, from: k, to: nums.count)
    }

    private func reverse(_ nums: inout [Int], from startIndex: Int, to endIndex: Int) {
        var start = startIndex
        var end = endIndex - 1
        while start < end {
            nums.swapAt(start, end)
            start += 1
            end -= 1
        }
    }
}
