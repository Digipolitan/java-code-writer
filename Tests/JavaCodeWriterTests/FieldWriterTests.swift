import XCTest
@testable import JavaCodeWriter
import CodeWriter

class FieldWriterTests: XCTestCase {

    func testPublicStaticConstField() {
        let fieldDescription = FieldDescription(name: "sample", options: .init(visibility: .public, isStatic: true, isFinal: true), type: "String", value: CodeBuilder.from(code: "\"hello\""))
        XCTAssertEqual("public static final String sample = \"hello\";", FieldWriter.default.write(description: fieldDescription))
    }

    func testFieldWithAnnotation() {
        let nonnullAnnotation = AnnotationDescription(name: "NonNull")
        let fieldDescription = FieldDescription(name: "test", options: .init(), type: "Integer", annotations: [nonnullAnnotation])
        XCTAssertEqual("@NonNull\nInteger test;", FieldWriter.default.write(description: fieldDescription))
    }

    func testVolatilePrivateField() {
        let fieldDescription = FieldDescription(name: "sample", options: .init(visibility: .private, isVolatile: true), type: "String")
        XCTAssertEqual("private volatile String sample;", FieldWriter.default.write(description: fieldDescription))
    }

    func testFieldWithSingleLineDocumentationWith1Depth() {
        let fieldDescription = FieldDescription(name: "sample", type: "int", documentation: "MyDoc")
        XCTAssertEqual("    // MyDoc\n    int sample;", FieldWriter.default.write(description: fieldDescription, depth: 1))
    }

    func testFieldWithMultiLineDocumentationWith1Depth() {
        let fieldDescription = FieldDescription(name: "sample", options: .init(visibility: .public), type: "float", documentation: "MyDoc\nMultiLine")
        XCTAssertEqual("    /**\n     * MyDoc\n     * MultiLine\n     */\n    public float sample;", FieldWriter.default.write(description: fieldDescription, depth: 1))

    }

    static var allTests = [
        ("testPublicStaticConstField", testPublicStaticConstField),
        ("testFieldWithAnnotation", testFieldWithAnnotation),
        ("testVolatilePrivateField", testVolatilePrivateField),
        ("testFieldWithSingleLineDocumentationWith1Depth", testFieldWithSingleLineDocumentationWith1Depth),
        ("testFieldWithMultiLineDocumentationWith1Depth", testFieldWithMultiLineDocumentationWith1Depth)
    ]
}
