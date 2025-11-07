import XCTest
@testable import Practice

final class LC0118_PascalsTriangleTests: XCTestCase {
    func testGenerate() {
        let solution = SolutionLC0118()
        let result = solution.generate(5)
        XCTAssertEqual(result, [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]])
    }
}
