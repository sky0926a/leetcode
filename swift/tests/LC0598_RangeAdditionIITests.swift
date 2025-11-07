import XCTest
@testable import Practice

final class LC0598_RangeAdditionIITests: XCTestCase {
    func testMaxCount() {
        XCTAssertEqual(SolutionLC0598().maxCount(3, 3, [[2, 2], [3, 3]]), 4)
    }
}
