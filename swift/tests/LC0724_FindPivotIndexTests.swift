import XCTest
@testable import Practice

final class LC0724_FindPivotIndexTests: XCTestCase {
    func testPivotIndex() {
        XCTAssertEqual(SolutionLC0724().pivotIndex([1, 7, 3, 6, 5, 6]), 3)
        XCTAssertEqual(SolutionLC0724().pivotIndex([-1, -1, -1, -1, -1, 0]), 2)
    }
}
