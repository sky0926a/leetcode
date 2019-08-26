# 268. Missing Number

`Easy`

Given an array containing n distinct numbers taken from `0, 1, 2, ..., n`, find the one that is missing from the array.

#### Example 1:

```
Input: [3,0,1]
Output: 2
```

#### Example 2:

```
Input: [9,6,4,2,3,5,7,0,1]
Output: 8
```

#### Note:
Your algorithm should run in linear runtime complexity. Could you implement it using only constant extra space complexity?

# Solution

## #1

一開始先做排序
看index不同則代表缺少哪個

```swift
func missingNumber(_ nums: [Int]) -> Int {
    var nums = nums.sorted()
    for i in 0..<nums.count {
        if nums[i] != i {
            return i
        }
    }
    return nums.count
}
```

效能不佳

Runtime: **292 ms**, faster than **6.58%** of Swift online submissions for Missing Number.
Memory Usage: **21.6 MB**, less than **50.00%** of Swift online submissions for Missing Number.

## #2

嘗試直接做 **sub array** 後合併

```swift
func rotate(_ nums: inout [Int], _ k: Int) {
    guard k > 0 else {
        return
    }
    let index = k % nums.count
    nums = nums.dropFirst(nums.count - index) + nums.dropLast(index)
}
```

效果感覺還可以，但沒有符合 **in-place with O(1) extra space** 條件

Runtime: **40 ms**, faster than **77.14%** of Swift online submissions for Missing Number.
Memory Usage: **22.2 MB**, less than **10.00%** of Swift online submissions for Missing Number.

## #3

後來找到的最佳解:  
做三次reverse
* 先全部reverse
* 再reverse 0-k
* 最後 reverse k-length


```swift
class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let k = k % nums.count
        reverse(&nums, from: 0, to: nums.count)
        reverse(&nums, from: 0, to: k)
        reverse(&nums, from: k, to: nums.count)
    }

    func reverse(_ nums: inout [Int], from startIndex: Int, to endIndex: Int) {
        var start = startIndex
        var end = endIndex - 1
        while start < end {
            let tmp = nums[start]
            nums[start] = nums[end]
            nums[end] = tmp
            start += 1
            end -= 1
        }
    }
}
```

Runtime: **32 ms**, faster than **99.34%** of Swift online submissions for Missing Number.
Memory Usage: **21 MB**, less than **10.00%** of Swift online submissions for Missing Number.
