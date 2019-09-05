# 724. Find Pivot Index

`Easy`

Given an array of integers nums, write a method that returns the "pivot" index of this array.

We define the pivot index as the index where the sum of the numbers to the left of the index is equal to the sum of the numbers to the right of the index.

If no such index exists, we should return -1. If there are multiple pivot indexes, you should return the left-most pivot index.

#### Example 1:
```
Input: 
nums = [1, 7, 3, 6, 5, 6]
Output: 3
Explanation: 
The sum of the numbers to the left of index 3 (nums[3] = 6) is equal to the sum of numbers to the right of index 3.
Also, 3 is the first index where this occurs.
```

#### Example 2:

```
Input: 
nums = [1, 2, 3]
Output: -1
Explanation: 
There is no index that satisfies the conditions in the problem statement.
```

#### Note:

* The length of `nums` will be in the range `[0, 10000]`.
* Each element `nums[i]` will be an integer in the range `[-1000, 1000]`.

# SOLUTION

## #1

一開始想說用while 逼近到中間
但是遇到負數，始終無法解決會有錯誤的問題
後來找到最佳解：
1. 先加總
2. 再減去逼近

```swift
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var right = 0
    var left = 0
    for i in 0..<nums.count {
        right += nums[i]
    }
    for i in 0..<nums.count {
        right -= nums[i]
        if left == right {
            return i
        }
        left += nums[i]
    }
    return -1
}
```

其中有用reduce去做一開始的陣列加總  
但速度其實蠻慢的

Runtime: **140 ms**, faster than **97.12%** of Swift online submissions for Find Pivot Index.
Memory Usage: **21 MB**, less than **25.00%** of Swift online submissions for Find Pivot Index.

