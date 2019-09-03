/// # 118. Pascal's Triangle

class Solution {
    
    /// - Parameter numRows: 5
    /// - Returns: [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]
    func generate(_ numRows: Int) -> [[Int]] {
        guard numRows > 0 else {
            return []
        }
        var result: [[Int]] = []
        for columnIndex in 1...numRows {
            var row = [Int](repeating: 1, count: columnIndex)
            if columnIndex - 2 > 0 {
                let prevRow = result[columnIndex-2]
                let targetIndex = columnIndex % 2 == 0 ? (columnIndex - 2) / 2 : (columnIndex - 1) / 2
                for rowIndex in 1...targetIndex {
                    let value = prevRow[rowIndex] + prevRow[rowIndex-1]
                    row[rowIndex] = value
                    row[prevRow.count - rowIndex] = value
                }
            }
            result.append(row)
        }
        return result
    }
}

/// Test Case
let numRows = 5
Solution().generate(numRows)
