import XCTest
@testable import JSONCoder

@available(macOS 13.0, *)
final class JSONCoderTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let result = try! NoteTaggerPrediction("Ali bugün evde yemek yaptı.")
        print(result)
    }
}
