import XCTest
@testable import JavaCodeWriter
import CodeWriter

class InterfaceWriterTests: XCTestCase {

    func testWriteEmptyInterfaceWithDocumentation() {
        let interfaceDescription = InterfaceDescription(name: "Sample", documentation: "MySampleInterface")
        XCTAssertEqual("/**\n * MySampleInterface\n */\ninterface Sample {\n}", InterfaceWriter.default.write(description: interfaceDescription))
    }

    func testWriteEmptyPublicInterfaceWith2Implements() {
        let interfaceDescription = InterfaceDescription(name: "Sample", options: .init(visibility: .public), parents: ["ITest", "ITest2"])
        XCTAssertEqual("public interface Sample extends ITest, ITest2 {\n}", InterfaceWriter.default.write(description: interfaceDescription))
    }

    func testWriteEmptyInterfaceWithImplementsOnly() {
        let interfaceDescription = InterfaceDescription(name: "Sample", parents: ["ITest"])
        XCTAssertEqual("interface Sample extends ITest {\n}", InterfaceWriter.default.write(description: interfaceDescription))
    }

    func testWriteInterfaceWith2Properties() {
        var interfaceDescription = InterfaceDescription(name: "Sample")
        interfaceDescription.fields.append(FieldDescription(name: "hello", options: .init(isStatic: true, isFinal: true), type: "String", value: CodeBuilder.from(code: "\"world\"")))
        interfaceDescription.fields.append(FieldDescription(name: "other", options: .init(isStatic: true, isFinal: true), type: "int", value: CodeBuilder.from(code: "0"), documentation: "required field !"))
        XCTAssertEqual("interface Sample {\n\tstatic final String hello = \"world\";\n\t// required field !\n\tstatic final int other = 0;\n}", InterfaceWriter.default.write(description: interfaceDescription))
    }

    func testWriteInterfaceWithAnnotations() {
        var interfaceDescription = InterfaceDescription(name: "Sample")
        interfaceDescription.annotations.append(.init(name: "Inject"))
        XCTAssertEqual("@Inject\ninterface Sample {\n}", InterfaceWriter.default.write(description: interfaceDescription))
    }

    func testWriteInterfaceWithPropertyAndMethods() {
    }

    static var allTests = [
        ("testWriteEmptyInterfaceWithDocumentation", testWriteEmptyInterfaceWithDocumentation),
        ("testWriteEmptyPublicInterfaceWith2Implements", testWriteEmptyPublicInterfaceWith2Implements),
        ("testWriteEmptyInterfaceWithImplementsOnly", testWriteEmptyInterfaceWithImplementsOnly),
        ("testWriteInterfaceWith2Properties", testWriteInterfaceWith2Properties),
        ("testWriteInterfaceWithAnnotations", testWriteInterfaceWithAnnotations),
        ("testWriteInterfaceWithPropertyAndMethods", testWriteInterfaceWithPropertyAndMethods)
    ]
}

