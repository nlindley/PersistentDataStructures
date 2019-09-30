import XCTest
@testable import PersistentDataStructures

final class PersistentDataStructuresTests: XCTestCase {
    func testConsOnEmptyThrows() {
        let emptyList: List<Any> = List()
        XCTAssertThrowsError(try emptyList.tail())
    }
    
    func testConsReturnsEmptyWithOneElement() {
        let singleItemList = List(42)
        let cons = try! singleItemList.tail()
        XCTAssertEqual(cons, .empty)
    }
    
    func testHeadThrowsOnEmptyList() {
        let emptyList: List<Any> = List()
        XCTAssertThrowsError(try emptyList.head())
    }
    
    func testConsReturnsTheRestOfTheList() {
        let list: List = [1, 2, 3]
        let cons = try! list.tail()
        let expected: List = [2, 3]
        XCTAssertEqual(cons, expected)
    }
    
    func testHeadReturnsOnlyElement() {
        let singleItemList: List<Int> = List(42)
        let head = try! singleItemList.head()
        XCTAssertEqual(head, 42)
    }
    
    func testEmptyListConcatenation() {
        let left = List<Int>.empty
        let right = List<Int>.empty
        let combined = left ++ right
        XCTAssertEqual(combined, .empty)
    }
    
    func testListConcatenationLefthandSideEmpty() {
        let right: List = [1, 2, 3]
        let combined = .empty ++ right
        XCTAssertEqual(combined, [1, 2, 3])
    }

    func testListConcatenationRighthandSideEmpty() {
        let left: List = [1, 2, 3]
        let combined = left ++ .empty
        XCTAssertEqual(combined, [1, 2, 3])
    }
    
    func testListConcatenationNeitherEmpty() {
        let left: List = [1, 2, 3]
        let right: List = [4, 5, 6]
        let expected: List = [1, 2, 3, 4, 5, 6]
        let combined = left ++ right
        XCTAssertEqual(combined, expected)
    }
    
    func testIndexOnNonEmptyList() {
        let list: List = ["first", "second", "third"]
        XCTAssertEqual(list[0], "first")
        XCTAssertEqual(list[1], "second")
        XCTAssertEqual(list[2], "third")
    }
    
    func testUpdatingAtZeroethIndex() {
        let list: List = ["one", "two", "three"]
        let updated = list.update("zero", at: 0);
        let expected: List = ["zero", "two", "three"]
        XCTAssertEqual(updated, expected)
    }
    
    func testUpdatingAtLastIndex() {
        let list: List = ["one", "two", "three"]
        let updated = list.update("zero", at: 2);
        let expected: List = ["one", "two", "zero"]
        XCTAssertEqual(updated, expected)
    }
    
    func testUpdatingBySubscript() {
        var list: List = ["one", "two", "three"]
        list[0] = "zero"
        let expected: List = ["zero", "two", "three"]
        XCTAssertEqual(list, expected)
    }
    
    static var allTests = [
        ("testConsOnEmptyThrows", testConsOnEmptyThrows),
        ("testConsReturnsEmptyWithOneElement", testConsReturnsEmptyWithOneElement),
    ]
}
