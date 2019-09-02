# 35. Search Insert Position

`Easy`

Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

You may assume no duplicates in the array.

#### Example 1:

```
Input: [1,3,5,6], 5
Output: 2
```
#### Example 2:

```
Input: [1,3,5,6], 2
Output: 1
```

#### Example 3:

```
Input: [1,3,5,6], 7
Output: 4
```

#### Example 4:

```
Input: [1,3,5,6], 0
Output: 0
```

# SOLUTION

## #1

一開始先直接 for 迴圈開始找，找到就return

```swift
func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        for i in 0..<nums.count {
            if nums[i] > target {
                return i
            }
            if nums[i] == target {
                return i
            }
        }
        return nums.count
    }
```

效能還 ok，但感覺對半開始找效果會更好，因為題目已經 sorted 了

Runtime: **32** ms, faster than **85.19%** of Swift online submissions for Search Insert Position.
Memory Usage: **21 MB**, less than **33.33%** of Swift online submissions for Search Insert Position.

## #2

第2次看網路上的解法，最快的解法是直接對半開始找，找不到就再對半找  
速度應該在量大時會有明顯差異

```swift
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else { return 0 }        
        
        var start = 0
        var end = nums.count - 1
        
        while start + 1 < end {
            let middle = (start + end) / 2
            let value = nums[middle]
            
            if value == target {
                return middle
            } else if value > target {
                end = middle - 1
            } else {
                start = middle + 1
            }
        }
        
        if nums[start] >= target {
            return start
        } else if nums[end] >= target {
            return end
        }
        
        return end + 1
    }
}
```

效果感覺還可以

Runtime: **28 ms**, faster than **99.47%** of Swift online submissions for Search Insert Position.
Memory Usage: **20.6 MB**, less than **33.33%** of Swift online submissions for Search Insert Position.
