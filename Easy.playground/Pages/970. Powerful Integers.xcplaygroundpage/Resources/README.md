# 970. Powerful Integers

`Easy`

Given two positive integers `x` and `y`, an integer is *powerful* if it is equal to `x^i + y^j` for some integers `i >= 0` and `j >= 0`.

Return a list of all powerful integers that have value less than or equal to `bound`.

You may return the answer in any order.  In your answer, each value should occur at most once.

#### Note:

* The number of elements initialized in *nums1* and *nums2* are *m* and *n* respectively.
* You may assume that *nums1* has enough space (size that is greater or equal to *m* + *n*) to hold additional elements from *nums2*.

#### Example 1:

```
Input: x = 2, y = 3, bound = 10
Output: [2,3,4,5,7,9,10]
Explanation: 
2 = 2^0 + 3^0
3 = 2^1 + 3^0
4 = 2^0 + 3^1
5 = 2^1 + 3^1
7 = 2^2 + 3^1
9 = 2^3 + 3^0
10 = 2^0 + 3^2
```

#### Example 2:

```
Input: x = 3, y = 5, bound = 15
Output: [2,4,6,8,10,14]
```

#### Note:

* 1 <= x <= 100
* 1 <= y <= 100
* 0 <= bound <= 10^6


# SOLUTION

## #1

一開看完題目後的理解：
1. x,y用兩個迴圈去跑各自次方的加總
2. 排除 1 的平方，但目標至少跑一次

```swift
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
```

效能還ok，主要是要排除1的平方可能導致 while loop 停不下來

Runtime: **4 ms**, faster than **93.55%** of Swift online submissions for Powerful Integers.
Memory Usage: **20.9 MB**, less than **100.00%** of Swift online submissions for Powerful Integers.

## #2

第2次看網路上的解法差不多

```swift
func powerfulIntegers(_ x: Int, _ y: Int, _ bound: Int) -> [Int] {
    var i = 1
    var j = 1
    var a = x
    var b = y
    var ans = Set<Int>()
    
    if x > y {
        a = y
        b = x
    }
    while i <= bound {
        j = 1
        inner: while j <= bound {
            if i + j <= bound {
                ans.insert(i + j)
            }
            j *= b
            if j == 1 {break inner}
        }
        i *= a
        if i == 1 {break}
    }
    return Array(ans)
}
```

這題的 test case 用 Set 或直接判斷有沒有包含這個值好像速度差不多
但記憶體應該 Set 多一些

Runtime: **4 ms**, faster than **93.55%** of Swift online submissions for Powerful Integers.
Memory Usage: **22.3 MB**, less than **100.00%** of Swift online submissions for Powerful Integers.
