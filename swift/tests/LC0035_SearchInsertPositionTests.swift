import XCTest
@testable import Practice

final class LC0035_SearchInsertPositionTests: XCTestCase {
    func testSearchInsert() {
        let solution = SolutionLC0035()
        XCTAssertEqual(solution.searchInsert([1, 3, 5, 6], 5), 2)
        XCTAssertEqual(solution.searchInsert([1, 3, 5, 6], 2), 1)
        XCTAssertEqual(solution.searchInsert([1, 3, 5, 6], 7), 4)
    }
}
