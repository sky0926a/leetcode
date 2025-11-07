struct SolutionLC0204 {
    func countPrimes(_ n: Int) -> Int {
        guard n > 2 else {
            return 0
        }
        var result: [Int] = Array(2..<n)
        var index = 0
        while index < result.count, result[index] < n / 2 {
            let prime = result[index]
            var removeIndex = index + 1
            while removeIndex < result.count {
                if result[removeIndex] % prime == 0 {
                    result.remove(at: removeIndex)
                } else {
                    removeIndex += 1
                }
            }
            index += 1
        }
        return result.count
    }
}
