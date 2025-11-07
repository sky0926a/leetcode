import Foundation

struct SolutionLC0970 {
    func powerfulIntegers(_ x: Int, _ y: Int, _ bound: Int) -> [Int] {
        let x = max(min(100, x), 1)
        let y = max(min(100, y), 1)
        let bound = max(min(bound, p(10, 6)), 0)
        var result: [Int] = []
        var i = 0
        var j = 0
        repeat {
            repeat {
                let value = p(x, i) + p(y, j)
                if value <= bound, !result.contains(value) {
                    result.append(value)
                }
                j += 1
            } while p(y, j) < bound && y - 1 > 0
            i += 1
            j = 0
        } while p(x, i) < bound && x - 1 > 0
        return result
    }

    private func p(_ a: Int, _ b: Int) -> Int {
        return Int(pow(Double(a), Double(b)))
    }
}
