struct SolutionLC0118 {
    func generate(_ numRows: Int) -> [[Int]] {
        guard numRows > 0 else {
            return []
        }
        var result: [[Int]] = []
        for columnIndex in 1...numRows {
            var row = [Int](repeating: 1, count: columnIndex)
            if columnIndex - 2 > 0 {
                let prevRow = result[columnIndex - 2]
                let targetIndex = columnIndex % 2 == 0 ? (columnIndex - 2) / 2 : (columnIndex - 1) / 2
                for rowIndex in 1...targetIndex {
                    let value = prevRow[rowIndex] + prevRow[rowIndex - 1]
                    row[rowIndex] = value
                    row[prevRow.count - rowIndex] = value
                }
            }
            result.append(row)
        }
        return result
    }
}
