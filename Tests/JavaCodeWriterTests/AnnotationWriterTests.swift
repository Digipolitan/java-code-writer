import XCTest
@testable import JavaCodeWriter
import CodeWriter

class AnnotationWriterTests: XCTestCase {

    func testWriteEmptyAnnotation() {
        let annotationDescription = AnnotationDescription(name: "Override")
        XCTAssertEqual("@Override", AnnotationWriter.default.write(description: annotationDescription))
    }

    func testWriteAnnotationWithParameter() {
        let annotationDescription = AnnotationDescription(name: "SuppressWarnings", parameter: "\"unchecked\"")
        XCTAssertEqual("@SuppressWarnings(\"unchecked\")", AnnotationWriter.default.write(description: annotationDescription))
    }

    static var allTests = [
        ("testWriteEmptyAnnotation", testWriteEmptyAnnotation),
        ("testWriteAnnotationWithParameter", testWriteAnnotationWithParameter)
    ]
}

