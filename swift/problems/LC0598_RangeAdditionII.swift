struct SolutionLC0598 {
    func maxCount(_ m: Int, _ n: Int, _ ops: [[Int]]) -> Int {
        guard !ops.isEmpty else {
            return m * n
        }
        var minM = m
        var minN = n
        for op in ops {
            minM = min(minM, op[0])
            minN = min(minN, op[1])
        }
        return minM * minN
    }
}
