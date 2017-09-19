import XCTest
@testable import JavaCodeWriter
import CodeWriter

class ConstructorWriterTests: XCTestCase {

    func testWriteEmptyConstructor() {
        let constructorDescription = ConstructorDescription(name: "Sample")
        XCTAssertEqual("Sample() {\n}", ConstructorWriter.default.write(description: constructorDescription))
    }

    func testWriteEmptyPublicConstructorWithEmptyImpl() {
        let constructorDescription = ConstructorDescription(name: "Sample", options: .init(visibility: .public))
        XCTAssertEqual("public Sample() {\n}", ConstructorWriter.default.write(description: constructorDescription))
    }

    func testWriteConstructorWithParametersNoImpl() {
        let constructorDescription = ConstructorDescription(name: "Sample", parameters: ["int w", "int h"])
        XCTAssertEqual("Sample(int w, int h) {\n}", ConstructorWriter.default.write(description: constructorDescription))
    }

    func testMultiLineImplWIthParameters() {
        let builder = CodeBuilder()
        builder.add(line: "this.w = w;")
        builder.add(line: "this.h = h;")
        let constructorDescription = ConstructorDescription(name: "Sample", code: builder, parameters: ["int w", "int h"])
        XCTAssertEqual("Sample(int w, int h) {\n    this.w = w;\n    this.h = h;\n}", ConstructorWriter.default.write(description: constructorDescription))
    }

    static var allTests = [
        ("testWriteEmptyConstructor", testWriteEmptyConstructor),
        ("testWriteEmptyPublicConstructorWithEmptyImpl", testWriteEmptyPublicConstructorWithEmptyImpl),
        ("testWriteConstructorWithParametersNoImpl", testWriteConstructorWithParametersNoImpl),
        ("testMultiLineImplWIthParameters", testMultiLineImplWIthParameters)
    ]
}


