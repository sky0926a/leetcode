import XCTest
@testable import Practice

final class LC0970_PowerfulIntegersTests: XCTestCase {
    func testPowerfulIntegers() {
        let result = SolutionLC0970().powerfulIntegers(2, 3, 10).sorted()
        XCTAssertEqual(result, [2, 3, 4, 5, 7, 9, 10])
    }
}
