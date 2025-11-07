import XCTest
@testable import Practice

final class LC0001_TwoSumTests: XCTestCase {
    func testTwoSumExamples() {
        let solver = SolutionLC0001()
        XCTAssertEqual(solver.twoSum([2, 7, 11, 15], 9), [0, 1])
        XCTAssertEqual(solver.twoSum([3, 2, 4], 6), [1, 2])
        XCTAssertEqual(solver.twoSum([3, 3], 6), [0, 1])
    }
}
