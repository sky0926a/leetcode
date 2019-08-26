# 26. Remove Duplicates from Sorted Array

`Easy`

Given a sorted array nums, remove the duplicates in-place such that each element appear only once and return the new length.

Do not allocate extra space for another array, you must do this by **modifying the input array in-place** with O(1) extra memory.

#### Example 1:

```
Given nums = [1,1,2],

Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively.

It doesn't matter what you leave beyond the returned length.
```

#### Example 2:

```
Given nums = [0,0,1,1,1,2,2,3,3,4],

Your function should return length = 5, with the first five elements of nums being modified to 0, 1, 2, 3, and 4 respectively.

It doesn't matter what values are set beyond the returned length.
```

#### Clarification:

Confused why the returned value is an integer but your answer is an array?

Note that the input array is passed in by reference, which means modification to the input array will be known to the caller as well.


Internally you can think of this:
```
// nums is passed in by reference. (i.e., without making a copy)
int len = removeDuplicates(nums);

// any modification to nums in your function would be known by the caller.
// using the length returned by your function, it prints the first len elements.
for (int i = 0; i < len; i++) {
    print(nums[i]);
}
```

# SOLUTION

## #1

一開始想說用 **Set** 去除重複，再轉成 **Array**

```swift
func removeDuplicates(_ nums: inout [Int]) -> Int {
    nums = Array(Set(nums))
    return nums.count
}
```

但 set 出來結果會是亂的，所以加了排序

```swift
nums = Array(Set(nums)).sorted()
```

但效能表現很差

Runtime: **92 ms**, faster than **21.37%** of Swift online submissions for Remove Duplicates from Sorted Array.  
Memory Usage: **23.1 MB**, less than **5.55%** of Swift online submissions for Remove Duplicates from Sorted Array.

## #2

後來改用 **Ｗhile loop** + 刪除存在值的寫法

```swift
func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard nums.count > 1 else {
        return nums.count
    }
    var index: Int = 1
    while index < nums.count {
        if nums[index - 1] == nums[index] {
            nums.remove(at: index)
        }
        else {
            index += 1;
        }
    }
    return nums.count
}
```

效果也不好

Runtime: **84 ms**, faster than **44.40%** of Swift online submissions for Remove Duplicates from Sorted Array.  
Memory Usage: **21.1 MB**, less than **5.55%** of Swift online submissions for Remove Duplicates from Sorted Array.

## #3

後來參考一些解答的最終版本，該題無須自己刪除值，只需確保原始陣列內容正確，並將前 **n** 位 return 回去即可

```swift
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        var index = 0;
        for i in 1..<nums.count{
            if (nums[i] != nums[index]) {
                index += 1
                nums[index] = nums[i]
            }
        }
        return index + 1
    }
}
```

最快到 Runtime **60 ms** , faster than **100%**

平均:  
Runtime: **72 ms**, faster than **87.66%** of Swift online submissions for Remove Duplicates from Sorted Array.  
Memory Usage: **21.1 MB**, less than **5.55%** of Swift online submissions for Remove Duplicates from Sorted Array.