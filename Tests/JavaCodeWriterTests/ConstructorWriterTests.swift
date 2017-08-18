import XCTest
@testable import JavaCodeWriter
import CodeWriter

class ConstructorWriterTests: XCTestCase {

    func testWriteEmptyConstructor() {
    }

    func testWriteEmptyPublicConstructorWithEmptyImpl() {
    }

    func testWriteConvenienceOverrideMethodWithParametersNoImpl() {
    }

    func testWriteRequiredAttributesDocumentationAndReturnWithImpl() {
    }

    func testMultiLineImpl() {
    }

    static var allTests = [
        ("testWriteEmptyConstructor", testWriteEmptyConstructor),
        ("testWriteEmptyPublicConstructorWithEmptyImpl", testWriteEmptyPublicConstructorWithEmptyImpl),
        ("testWriteConvenienceOverrideMethodWithParametersNoImpl", testWriteConvenienceOverrideMethodWithParametersNoImpl),
        ("testWriteRequiredAttributesDocumentationAndReturnWithImpl", testWriteRequiredAttributesDocumentationAndReturnWithImpl),
        ("testMultiLineImpl", testMultiLineImpl)
    ]
}


