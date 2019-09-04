/// # 970. Powerful Integers
import Foundation

class Solution {
    
    /// - Parameters:
    ///   - x: 2
    ///   - y: 3
    ///   - bound: 10
    /// - Returns: [2,3,4,5,7,9,10]
    func powerfulIntegers(_ x: Int, _ y: Int, _ bound: Int) -> [Int] {
        let x: Int = max(min(100, x), 1)
        let y: Int = max(min(100, y), 1)
        let bound: Int = max(min(bound, p(10, 6)), 0)
        var result: [Int] = []
        var i = 0, j = 0
        
        repeat {
            repeat {
                let value = p(x, i) + p(y, j)
                if value <= bound, !result.contains(value){
                    result.append(value)
                }
                j += 1
            } while p(y, j) < bound && y - 1 > 0
            i += 1
            j = 0
        } while p(x, i) < bound && x - 1 > 0
        
        return result
    }
    
    func p(_ a: Int,_ b: Int) -> Int {
        return Int(pow(Double(a), Double(b)))
    }
}

/// Test Case
let x = 2
let y = 3
let bound = 10
Solution().powerfulIntegers(x, y, bound)
