import XCTest
@testable import Practice

final class LC0268_MissingNumberTests: XCTestCase {
    func testMissingNumber() {
        XCTAssertEqual(SolutionLC0268().missingNumber([3, 0, 1]), 2)
    }
}
