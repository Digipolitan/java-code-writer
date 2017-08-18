import XCTest
@testable import JavaCodeWriter
import CodeWriter

class MethodWriterTests: XCTestCase {

    func testWriteEmptyMethod() {
    }

    func testWriteEmptyPublicMethodWithEmptyImpl() {
    }

    func testWriteStaticOverrideMethodWithParametersAndReturnNoImpl() {
    }

    func testWriteMutatingAttributesDocumentationAndReturnWithImpl() {
    }

    func testMultiLineImpl() {
    }

    static var allTests = [
        ("testWriteEmptyMethod", testWriteEmptyMethod),
        ("testWriteEmptyPublicMethodWithEmptyImpl", testWriteEmptyPublicMethodWithEmptyImpl),
        ("testWriteStaticOverrideMethodWithParametersAndReturnNoImpl", testWriteStaticOverrideMethodWithParametersAndReturnNoImpl),
        ("testWriteMutatingAttributesDocumentationAndReturnWithImpl", testWriteMutatingAttributesDocumentationAndReturnWithImpl),
        ("testMultiLineImpl", testMultiLineImpl)
    ]
}

