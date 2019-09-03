# 118. Pascal's Triangle

`Easy`

Given a non-negative integer numRows, generate the first numRows of Pascal's triangle.

#### Example:

```
Input: 5
Output:
[
     [1],
    [1,1],
   [1,2,1],
  [1,3,3,1],
 [1,4,6,4,1]
]
```

# SOLUTION

## #1

一開始覺得先排除極端值，再將巢狀陣列中最後的一筆結果轉成下一列的結果應該可行
那問題就在於怎轉成下一列的結果：
1. 先預設第一個值為 `1`， 並排除最後一個值也為 `1`
2. 剩餘就是填格子拉

```swift
func generate(_ numRows: Int) -> [[Int]] {
    guard numRows > 0 else {
        return []
    }
    
    var result: [[Int]] = []
    for _ in 0..<numRows {
        result.append(generateRow(result.last ?? []))
    }
    return result
}

func generateRow(_ referenceRow: [Int]) -> [Int] {
    var result = [1]
    for i in 0..<referenceRow.count {
        if i == referenceRow.count - 1 {
            result.append(1)
        }
        else if i + 1 < referenceRow.count {
            result.append(referenceRow[i] + referenceRow[i+1])
        }
    }
    return result
}
```

效能還ok，但陣列中的元素多應該效能會不佳

Runtime: **4 ms**, faster than **93.03%** of Swift online submissions for Pascal's Triangle.
Memory Usage: **21.2** MB, less than **100.00%** of Swift online submissions for Pascal's Triangle.

## #2

第2次是參考其他人做法：
1. 先將陣列空間塞1初始化出來
2. 然後再考慮陣列有對稱性，應該只需要跑一半陣列的時間就可以完成
3. 剩下就一樣做加總

```swift
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
```

效果感覺還可以，平均的記憶體有較少  
中間計算的部分可能有更好的方式再精簡  
理論上所需時間應該也減少了(?)

Runtime: **4 ms**, faster than **93.06%** of Swift online submissions for Pascal's Triangle.
Memory Usage: **20.8 MB**, less than **100.00%** of Swift online submissions for Pascal's Triangle.

## #3

最後是參考網路上的做法

```swift
func generate(_ numRows: Int) -> [[Int]] {
    var ret: [[Int]] = []
    for r in 0..<numRows {
        var row = [Int](repeating: 1, count: r + 1)
        if r >= 2 {
            for c in 1..<row.count-1 {
                let prevRow = ret[r-1]
                row[c] = prevRow[c-1] + prevRow[c]
            }
        }
        
        ret += [row]
    }
    return ret
}
```

算法差不多，但可能是平台 bug 可以跑出 0 ms 的結果

Runtime: **0 ms**, faster than **100%** of Swift online submissions for Pascal's Triangle.
Memory Usage: **21 MB**, less than **100.00%** of Swift online submissions for Pascal's Triangle.
