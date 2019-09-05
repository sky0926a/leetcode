# 598. Range Addition II

`Easy`

Given an m * n matrix **M** initialized with all **0**'s and several update operations.

Operations are represented by a 2D array, and each operation is represented by an array with two **positive** integers **a** and **b**, which means **M[i][j]** should be **added by one** for all **0 <= i < a** and **0 <= j < b**.

You need to count and return the number of maximum integers in the matrix after performing all the operations.

#### Example 1:
```
Input: 
m = 3, n = 3
operations = [[2,2],[3,3]]
Output: 4
Explanation: 
Initially, M = 
[[0, 0, 0],
 [0, 0, 0],
 [0, 0, 0]]

After performing [2,2], M = 
[[1, 1, 0],
 [1, 1, 0],
 [0, 0, 0]]

After performing [3,3], M = 
[[2, 2, 1],
 [2, 2, 1],
 [1, 1, 1]]


So the maximum integer in M is 2, and there are four of it in M. So return 4.
```

#### Note:
1. The range of m and n is [1,40000].
2. The range of a is [1,m], and the range of b is [1,n].
3. The range of operations size won't exceed 10,000.

# SOLUTION

## #1

一開始看不太懂問題在描述啥  
了解之後大概有個方向：
1. 基本上就是從`(0, 0)`開始發展
2. 排除陣列數量 **0** 的問題

```swift
func maxCount(_ m: Int, _ n: Int, _ ops: [[Int]]) -> Int {
    guard ops.count > 0 else {
        return m * n
    }
    var m = m
    var n = n
    for size in ops {
        m = min(m, size[0])
        n = min(n, size[1])
    }
    return m * n
}
```

效能感覺上不去

Runtime: **44 ms**, faster than **77.78%** of Swift online submissions for Range Addition II.
Memory Usage: **21.1 MB**, less than **100.00%** of Swift online submissions for Range Addition II.

## #2

第2次看網路上的解法，感覺只差在 `for each`

```swift
func maxCount(_ m: Int, _ n: Int, _ ops: [[Int]]) -> Int {
    guard ops.count > 0 else {
        return m * n
    }
    var m = m
    var n = n
    for i in 0..<ops.count {
        m = min(m, ops[i][0])
        n = min(n, ops[i][1])
    }
    return m * n
}
```

效果感覺還可以，可能 for each 比直接 for 還要花時間

Runtime: **40 ms**, faster than **100.00%** of Swift online submissions for Range Addition II.
Memory Usage: **21.1 MB**, less than **100.00%** of Swift online submissions for Range Addition II.
