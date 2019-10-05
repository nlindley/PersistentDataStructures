import XCTest
@testable import PersistentDataStructures

final class UnbalancedSetTests: XCTestCase {
    func testMemberOfEmptySetIsFalse() {
        let a: UnbalancedSet<Int> = .empty
        XCTAssertFalse(a.member(3))
    }
    
    func testSingleMemeberSetFindsMember() {
        let a = UnbalancedSet(3)
        XCTAssertTrue(a.member(3))
    }
    
    func testSingleMemeberSetFindsNoMissingMember() {
        let a = UnbalancedSet(3)
        XCTAssertFalse(a.member(2))
    }
    
    func testEmptySetsAreEqual() {
        let a: UnbalancedSet<Int> = .empty
        let b: UnbalancedSet<Int> = .empty
        XCTAssertEqual(a, b)
    }
    
    func testEmptySetsAndNonemptysetAreNotEqual() {
        let a: UnbalancedSet<Int> = .empty
        let b = UnbalancedSet(3)
        XCTAssertNotEqual(a, b)
    }
    
    func testNonemptySetsAreEqual() {
        let a = UnbalancedSet(3)
        let b = UnbalancedSet(3)
        XCTAssertEqual(a, b)
    }
    
    func testDifferentNonemptySetsAreNotEqual() {
        let a = UnbalancedSet(3)
        let b = UnbalancedSet(2)
        XCTAssertNotEqual(a, b)
    }
    
    func testInsertingIntoEmptyTree() {
        let a: UnbalancedSet<Int> = .empty
        let b = a.insert(5)
        let c = UnbalancedSet(5)
        XCTAssertEqual(b, c)
    }
    
    func testInsertingASmallerValue() {
        let a = UnbalancedSet(3)
        let b = a.insert(2)
        let c: UnbalancedSet = .tree(.tree(.empty, 2, .empty), 3, .empty)
        XCTAssertEqual(b, c)
    }
    
    func testInsertingALargerValue() {
        let a = UnbalancedSet(3)
        let b = a.insert(4)
        let c: UnbalancedSet = .tree(.empty, 3, .tree(.empty, 4, .empty))
        XCTAssertEqual(b, c)
    }
    
    func testInsertingAnEqualValue() {
        let a = UnbalancedSet(3)
        let b = a.insert(3)
        XCTAssertEqual(a, b)
    }
    
    func testInsertingTwoValues() {
        let a = UnbalancedSet(3)
        let b = a.insert(2)
        let c = b.insert(4)
        let d: UnbalancedSet = .tree(
            .tree(.empty, 2, .empty),
            3,
            .tree(.empty, 4, .empty)
        )
        XCTAssertEqual(c, d)
    }
    
    func testInsertingTwoSmallerValues() {
        let a = UnbalancedSet(3)
        let b = a.insert(2)
        let c = b.insert(1)
        let d: UnbalancedSet = .tree(
            .tree(
                .tree(.empty, 1, .empty),
                2,
                .empty
            ),
            3,
            .empty
        )
        XCTAssertEqual(c, d)
    }
    
    func testInsertingTwoLargerValues() {
        let a = UnbalancedSet(3)
        let b = a.insert(4)
        let c = b.insert(5)
        let d: UnbalancedSet = .tree(
            .empty,
            3,
            .tree(
                .empty,
                4,
                .tree(.empty, 5, .empty)
            )
        )
        XCTAssertEqual(c, d)
    }

    func testInsertingSmallerValueThenInbetweenValue() {
        let a = UnbalancedSet(3)
        let b = a.insert(1)
        let c = b.insert(2)
        let d: UnbalancedSet = .tree(
            .tree(
                .empty,
                1,
                .tree(.empty, 2, .empty)
            ),
            3,
            .empty
        )
        XCTAssertEqual(c, d)
    }
    
    func testInsertingLargerValueThenInbetweenValue() {
        let a = UnbalancedSet(3)
        let b = a.insert(5)
        let c = b.insert(4)
        let d: UnbalancedSet = .tree(
            .empty,
            3,
            .tree(
                .tree(.empty, 4, .empty),
                5,
                .empty
            )
        )
        XCTAssertEqual(c, d)
    }
}
