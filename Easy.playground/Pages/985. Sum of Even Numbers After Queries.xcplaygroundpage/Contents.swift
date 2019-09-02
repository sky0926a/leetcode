//func sumEvenAfterQueries(_ A: [Int], _ queries: [[Int]]) -> [Int] {
//    var result = A
//    var sum = A.reduce(0) { (sum, value) -> Int in
//        return sum + (value % 2 == 0 ? value : 0)
//    }
//
//    var answer = [Int](repeating: 0, count: queries.count)
//
//    for i in 0..<queries.count {
//        let arg: (index: Int, value: Int) = (queries[i][1], queries[i][0])
//        if result[arg.index] % 2 == 0 { sum -= result[arg.index] }
//        result[arg.index] += arg.value
//        if result[arg.index] % 2 == 0 { sum += result[arg.index] }
//        answer[i] = sum
//    }
//
//    return answer
//}

//func de(_ num: Int) -> ((Int) -> Int) {
//    return { val in
//        return num + val
//    }
//}
//
//let ss = de(2)
//
//ss(4)

func add(_ num: Int) -> ((Int) -> Int) {
    print("num:\(num)")
    return { val in
        return num + val
    }
}

let addTwo = add(2)

addTwo(4)

//class Solution {
//    func sumEvenAfterQueries(_ A: [Int], _ queries: [[Int]]) -> [Int] {
//        var state = A
//        var sum = state.reduce(0) { (sum, value) -> Int in
//            return sum + (value.isEven ? value : 0)
//        }
//        var result = [Int]()
//
//        for q in queries {
//            let prevVal = state[q[1]]
//            state[q[1]] += q[0]
//            if prevVal.isEven {
//                sum -= prevVal
//            }
//            if state[q[1]].isEven {
//                sum += state[q[1]]
//            }
//            result.append(sum)
//        }
//
//        return result
//    }
//}
//
//extension Int {
//    var isEven: Bool {
//        return self % 2 == 0
//    }
//}

//class Solution {
//    func sumEvenAfterQueries(_ A: [Int], _ queries: [[Int]]) -> [Int] {
//        var result: [Int] = []
//        var target: [Int] = A
//        for arg in queries {
//            target[arg[1]] += arg[0]
//            let value = target.filter { (num) -> Bool in
//                num % 2 == 0
//            }.reduce(0, +)
//            result.append(value)
//        }
//        return result
//    }
//}

//class Solution {
//    func sumEvenAfterQueries(_ A: [Int], _ queries: [[Int]]) -> [Int] {
//        var result: [Int] = []
//        var target: [Int] = A
//        for arg in queries {
//            target[arg[1]] += arg[0]
//            let value = target.reduce(0) { (sum, value) -> Int in
//                return value % 2 == 0 ? sum + value : sum
//            }
//            result.append(value)
//        }
//        return result
//    }
//}

//Input: A = [1,2,3,4], queries = [[1,0],[-3,1],[-4,0],[2,3]]
//Output: [8,6,2,4]
//Explanation:
//At the beginning, the array is [1,2,3,4].
//After adding 1 to A[0], the array is [2,2,3,4], and the sum of even values is 2 + 2 + 4 = 8.
//After adding -3 to A[1], the array is [2,-1,3,4], and the sum of even values is 2 + 4 = 6.
//After adding -4 to A[0], the array is [-2,-1,3,4], and the sum of even values is -2 + 4 = 2.
//After adding 2 to A[3], the array is [-2,-1,3,6], and the sum of even values is -2 + 6 = 4.

