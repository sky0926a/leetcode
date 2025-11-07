import XCTest
@testable import Practice

final class LC0053_MaximumSubarrayTests: XCTestCase {
    func testMaxSubArray() {
        XCTAssertEqual(SolutionLC0053().maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4]), 6)
    }
}
