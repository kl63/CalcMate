import XCTest
@testable import CalcMate

final class CalcMateTests: XCTestCase {
    func testAddition() {
        XCTAssertEqual(calculate("2 + 3"), 5)
    }
    
    func testMultiplication() {
        XCTAssertEqual(calculate("4 * 2"), 8)
    }
    
    func testDivision() {
        XCTAssertEqual(calculate("10 / 2"), 5)
    }
    
    func testInvalidExpression() {
        XCTAssertNil(calculate("5 + "))  // ✅ Now correctly handled
        XCTAssertNil(calculate("abc"))   // ✅ Edge case for invalid characters
        XCTAssertNil(calculate(""))      // ✅ Empty string check
        XCTAssertNil(calculate("3 * "))  // ✅ Another incomplete expression case
    }
}
