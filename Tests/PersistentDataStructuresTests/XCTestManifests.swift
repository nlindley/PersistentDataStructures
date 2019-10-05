#if !canImport(ObjectiveC)
import XCTest

extension ListTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__ListTests = [
        ("testConsConstructor", testConsConstructor),
        ("testCountOfEmptyList", testCountOfEmptyList),
        ("testCountOfLongList", testCountOfLongList),
        ("testCountOfSingleItemList", testCountOfSingleItemList),
        ("testEmptyListConcatenation", testEmptyListConcatenation),
        ("testHeadReturnsOnlyElement", testHeadReturnsOnlyElement),
        ("testHeadThrowsOnEmptyList", testHeadThrowsOnEmptyList),
        ("testIndexOnNonEmptyList", testIndexOnNonEmptyList),
        ("testListConcatenationLefthandSideEmpty", testListConcatenationLefthandSideEmpty),
        ("testListConcatenationNeitherEmpty", testListConcatenationNeitherEmpty),
        ("testListConcatenationRighthandSideEmpty", testListConcatenationRighthandSideEmpty),
        ("testSuffixesOfEmptyList", testSuffixesOfEmptyList),
        ("testSuffixesOfManyElementList", testSuffixesOfManyElementList),
        ("testSuffixesOfSingleElementList", testSuffixesOfSingleElementList),
        ("testTailOnEmptyThrows", testTailOnEmptyThrows),
        ("testTailReturnsEmptyWithOneElement", testTailReturnsEmptyWithOneElement),
        ("testTailReturnsTheRestOfTheList", testTailReturnsTheRestOfTheList),
        ("testUpdatingAtLastIndex", testUpdatingAtLastIndex),
        ("testUpdatingAtZeroethIndex", testUpdatingAtZeroethIndex),
        ("testUpdatingBySubscript", testUpdatingBySubscript),
    ]
}

extension UnbalancedSetTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__UnbalancedSetTests = [
        ("testDifferentNonemptySetsAreNotEqual", testDifferentNonemptySetsAreNotEqual),
        ("testEmptySetsAndNonemptysetAreNotEqual", testEmptySetsAndNonemptysetAreNotEqual),
        ("testEmptySetsAreEqual", testEmptySetsAreEqual),
        ("testInsertingALargerValue", testInsertingALargerValue),
        ("testInsertingAnEqualValue", testInsertingAnEqualValue),
        ("testInsertingASmallerValue", testInsertingASmallerValue),
        ("testInsertingIntoEmptyTree", testInsertingIntoEmptyTree),
        ("testInsertingLargerValueThenInbetweenValue", testInsertingLargerValueThenInbetweenValue),
        ("testInsertingSmallerValueThenInbetweenValue", testInsertingSmallerValueThenInbetweenValue),
        ("testInsertingTwoLargerValues", testInsertingTwoLargerValues),
        ("testInsertingTwoSmallerValues", testInsertingTwoSmallerValues),
        ("testInsertingTwoValues", testInsertingTwoValues),
        ("testMemberOfEmptySetIsFalse", testMemberOfEmptySetIsFalse),
        ("testNonemptySetsAreEqual", testNonemptySetsAreEqual),
        ("testSingleMemeberSetFindsMember", testSingleMemeberSetFindsMember),
        ("testSingleMemeberSetFindsNoMissingMember", testSingleMemeberSetFindsNoMissingMember),
    ]
}

public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ListTests.__allTests__ListTests),
        testCase(UnbalancedSetTests.__allTests__UnbalancedSetTests),
    ]
}
#endif
