/// # 204. Count Primes

class Solution {

    /// - Parameter n: 10
    /// - Returns: 4
    func countPrimes(_ n: Int) -> Int {
        guard n > 2 else {
            return 0
        }
        var result: [Int] = []
        for i in 2..<n {
            result.append(i)
        }
        var index = 0
        while result[index] < (n / 2) {
            let prime = result[index]
            var removeIndex = index
            while removeIndex < result.count {
                let value = result[removeIndex]
                if value % prime == 0 && value != prime {
                    result.remove(at: removeIndex)
                }
                removeIndex += 1
            }
            index += 1
            print(result)
        }
        return result.count
    }
}

/// Test Case
let n = 10
Solution().countPrimes(n)
