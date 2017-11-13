import XCTest
@testable import JavaCodeWriter
import CodeWriter

class EnumWriterTests: XCTestCase {

    func testWriteEmptyEnumWithDocumentation() {
        let enumDescription = EnumDescription(name: "Sample", documentation: "My super sample")
        XCTAssertEqual("/**\n * My super sample\n */\nenum Sample {\n}", EnumWriter.default.write(description: enumDescription))
    }

    func testWriteEnumWith2Cases() {
        var enumDescription = EnumDescription(name: "Sample")
        enumDescription.cases.append(.init(name: "CASE1"))
        enumDescription.cases.append(.init(name: "CASE2"))
        XCTAssertEqual("enum Sample {\n    CASE1,\n    CASE2\n}", EnumWriter.default.write(description: enumDescription))
    }

    func testWriteEnumWith2CasesAndAField() {
        var enumDescription = EnumDescription(name: "Sample")
        enumDescription.cases.append(.init(name: "CASE1"))
        enumDescription.cases.append(.init(name: "CASE2"))
        enumDescription.fields.append(.init(name: "field1", type: "int"))
        XCTAssertEqual("enum Sample {\n    CASE1,\n    CASE2;\n\n    int field1;\n}", EnumWriter.default.write(description: enumDescription))
    }

    func testWritePublicEnumWithField() {
        var enumDescription = EnumDescription(name: "Sample", options: .init(visibility: .public))
        enumDescription.fields.append(.init(name: "field1", type: "int"))
        XCTAssertEqual("public enum Sample {\n    ;\n\n    int field1;\n}", EnumWriter.default.write(description: enumDescription))
    }

    static var allTests = [
        ("testWriteEmptyEnumWithDocumentation", testWriteEmptyEnumWithDocumentation),
        ("testWriteEnumWith2Cases", testWriteEnumWith2Cases),
        ("testWriteEnumWith2CasesAndAField", testWriteEnumWith2CasesAndAField),
        ("testWritePublicEnumWithField", testWritePublicEnumWithField)
    ]
}
