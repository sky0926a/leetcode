import XCTest
@testable import Practice

final class LC0204_CountPrimesTests: XCTestCase {
    func testCountPrimes() {
        XCTAssertEqual(SolutionLC0204().countPrimes(10), 4)
    }
}
