# 53. Maximum Subarray

`Easy`

Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

#### Example:

```
Input: [-2,1,-3,4,-1,2,1,-5,4],
Output: 6
Explanation: [4,-1,2,1] has the largest sum = 6.
```
#### Follow up:

If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.

# SOLUTION

## #1

一開始直覺可以用 dictionary 的方式做些操作，但後來實在怎樣寫都不對  
後來實在沒什麼想法，就參考別人的做法：  
1. 先排除 0 個元素的情況，並將第一個值預設為最大值, 及連續最大值
2. 跑回圈，把**新的值**及**新的值與加連續最大值的加總**做 max
3. 新的連續最大值再與最大值做 max
4. 最後最大值的結果就是答案

```swift
func maxSubArray(_ nums: [Int]) -> Int {
    guard var maxValue = nums.first else {
        return 0
    }
    var last = maxValue
    for i in 1..<nums.count {
        last = max(nums[i], nums[i] + last)
        maxValue = max(maxValue, last)
    }
    return maxValue
}
```

中間的一些問題：  
**新的值**及**新的值與加連續最大值的加總** `相等` 時重新定位，所以不用再考慮前面加總的結果也會是最終結果。

Runtime: **36 ms**, faster than **91.43%** of Swift online submissions for Maximum Subarray.
Memory Usage: **21.1 MB**, less than **16.67%** of Swift online submissions for Maximum Subarray.