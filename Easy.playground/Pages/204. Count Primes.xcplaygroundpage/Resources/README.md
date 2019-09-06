# 204. Count Primes

`Easy`

Count the number of prime numbers less than a non-negative number, **n**.

#### Example:
```
Input: 10
Output: 4
Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.
```
# SOLUTION

## #1

一開始最簡單的想法跑一個 for 迴圈  
但想當然就直接給我一個 **Time Limit Exceeded**

```swift
func countPrimes(_ n: Int) -> Int {
    guard n > 1 else {
        return 0
    }
    var result: Int = 0
    
    for i in 2..<n {
        result += isPrimes(number: i) ? 1 : 0
    }
    
    return result
}

func isPrimes(number: Int) -> Bool {
    for i in 2...(max(number / 2, 2)) {
        if number % i == 0 && number != i {
            return false
        }
    }
    return true
}
```

## #2

先初始化一個陣列，裡面的值是 2 to n  
然後在開始做移除的動作
但光在初始化的時候就必須花費大量的時間  
還是 **Time Limit Exceeded**

```swift
func countPrimes(_ n: Int) -> Int {
    guard n > 2 else {
        return 0
    }
    var result: [Int] = []
    for i in 2..<n {
        result.append(i)
    }
    var index = 0
    while result[index] <= (n / 2) {
        let prime = result[index]
        var removeIndex = index
        while removeIndex < result.count {
            let value = result[removeIndex]
            if value % prime == 0 && value != prime {
                result.remove(at: removeIndex)
            }
            removeIndex += 1
        }
        index += 1
    }
    return result.count
}
```

## #3

參考網路上的做法：  
1. 先初始化一個大小為 n 的布林陣列
2. 判斷第 i 個是否為被設為 ture 不然就跳過
3. 再以 i 為基底去將 i 的倍數都屏蔽

```swift
func countPrimes(_ n: Int) -> Int {
    guard n > 2 else {
        return 0
    }
    
    var isPrime = Array(repeating: true, count: n)
    isPrime[0] = false
    isPrime[1] = false
    
    var count = 0
    for i in 2..<n {
        guard isPrime[i] else {
            continue
        }
        count += 1
        var nextNum = i * i
        while nextNum < n {
            isPrime[nextNum] = false
            nextNum += i
        }
    }
    
    return count
}
```

跟 #2 最大的差別應該是直接用 i 把其倍數直接遮蔽  
這樣就不用跑這麼多次重複驗證

Runtime: **80 ms**, faster than **98.54%** of Swift online submissions for Count Primes.
Memory Usage: **20.7 MB**, less than **100.00%** of Swift online submissions for Count Primes.