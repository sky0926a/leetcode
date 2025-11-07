import XCTest
@testable import Practice

final class LC0026_RemoveDuplicatesFromSortedArrayTests: XCTestCase {
    func testRemoveDuplicates() {
        var input = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4]
        let length = SolutionLC0026().removeDuplicates(&input)
        XCTAssertEqual(length, 5)
        XCTAssertEqual(Array(input.prefix(length)), [0, 1, 2, 3, 4])
    }
}
