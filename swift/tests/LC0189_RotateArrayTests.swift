import XCTest
@testable import Practice

final class LC0189_RotateArrayTests: XCTestCase {
    func testRotate() {
        var nums = [1, 2, 3, 4, 5, 6, 7]
        SolutionLC0189().rotate(&nums, 3)
        XCTAssertEqual(nums, [5, 6, 7, 1, 2, 3, 4])
    }
}
