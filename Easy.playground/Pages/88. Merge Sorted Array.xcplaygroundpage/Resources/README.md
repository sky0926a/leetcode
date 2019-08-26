# 88. Merge Sorted Array

`Easy`

Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.

#### Note:

* The number of elements initialized in *nums1* and *nums2* are *m* and *n* respectively.
* You may assume that *nums1* has enough space (size that is greater or equal to *m* + *n*) to hold additional elements from *nums2*.

#### Example 1:

```
Input:
nums1 = [1,2,3,0,0,0], m = 3
nums2 = [2,5,6],       n = 3

Output: [1,2,2,3,5,6]
```

# SOLUTION

## #1

一開始先直接取代m後面n位，再排序

```swift
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    for i in 0..<n {
        nums1[i+m] = nums2[i]
    }
    nums1 = nums1.sorted()
}
```

效能還ok，但多做一次 sort 覺得應該有更好的做法

Runtime: **8 ms**, faster than **99.77%** of Swift online submissions for Merge Sorted Array.
Memory Usage: **21.2 MB**, less than **33.33%** of Swift online submissions for Merge Sorted Array.

## #2

第2次看網路上的解法，只需 m + n 次，也無使用多餘空間  
但速度好像沒有顯著提升

```swift
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var i = m - 1, j = n - 1
    while i >= 0 || j >= 0 {
        if j < 0 || (i >= 0 && nums1[i] > nums2[j]) {
            nums1[i + j + 1] = nums1[i]
            i -= 1
        } 
        else {
            nums1[i + j + 1] = nums2[j]
            j -= 1
        }
    }
}
```

效果感覺還可以，Time: O(n), Space: O(1)

Runtime: **12 ms**, faster than **87.53%** of Swift online submissions for Merge Sorted Array.
Memory Usage: **20.9 MB**, less than **33.33%** of Swift online submissions for Merge Sorted Array.
