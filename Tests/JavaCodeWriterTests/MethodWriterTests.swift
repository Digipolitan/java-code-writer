import XCTest
@testable import JavaCodeWriter
import CodeWriter

class MethodWriterTests: XCTestCase {

    func testWriteEmptyMethod() {
        let methodDescription = MethodDescription(name: "sample", returnType: "void")
        XCTAssertEqual("void sample();", MethodWriter.default.write(description: methodDescription))
    }

    func testWriteEmptyPublicMethodWithEmptyImpl() {
        let methodDescription = MethodDescription(name: "sample", code: CodeBuilder(), options: .init(visibility: .public), returnType: "String")
        XCTAssertEqual("public String sample() {\n}", MethodWriter.default.write(description: methodDescription))
    }

    func testWriteStaticOverrideMethodWithParametersAndReturnNoImpl() {
        let methodDescription = MethodDescription(name: "sample",
                                                  options: .init(isStatic: true),
                                                  returnType: "String",
                                                  parameters: ["Integer p1", "Float p2"],
                                                  annotations: [AnnotationDescription(name: "Override")])
        XCTAssertEqual("@Override\nstatic String sample(Integer p1, Float p2);", MethodWriter.default.write(description: methodDescription))
    }

    func testWriteMethodWithThrowables() {
        let methodDescription = MethodDescription(name: "sample",
                                                  code: CodeBuilder(),
                                                  options: .init(visibility: .protected),
                                                  returnType: "void",
                                                  throwables: ["NullPointerException", "FileNotFoundException"])
        XCTAssertEqual("protected void sample() throws NullPointerException, FileNotFoundException {\n}", MethodWriter.default.write(description: methodDescription))
    }

    func testMultiLineImpl() {
        let builder = CodeBuilder()
        builder.add(line: "first")
        builder.add(line: "second")
        let methodDescription = MethodDescription(name: "sample", code: builder, returnType: "void")
        XCTAssertEqual("void sample() {\n    first\n    second\n}", MethodWriter.default.write(description: methodDescription))

    }

    static var allTests = [
        ("testWriteEmptyMethod", testWriteEmptyMethod),
        ("testWriteEmptyPublicMethodWithEmptyImpl", testWriteEmptyPublicMethodWithEmptyImpl),
        ("testWriteStaticOverrideMethodWithParametersAndReturnNoImpl", testWriteStaticOverrideMethodWithParametersAndReturnNoImpl),
        ("testWriteMethodWithThrowables", testWriteMethodWithThrowables),
        ("testMultiLineImpl", testMultiLineImpl)
    ]
}
