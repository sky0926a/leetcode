import XCTest
@testable import Practice

final class LC0088_MergeSortedArrayTests: XCTestCase {
    func testMerge() {
        var nums1 = [1, 2, 3, 0, 0, 0]
        let nums2 = [2, 5, 6]
        SolutionLC0088().merge(&nums1, 3, nums2, 3)
        XCTAssertEqual(nums1, [1, 2, 2, 3, 5, 6])
    }
}
