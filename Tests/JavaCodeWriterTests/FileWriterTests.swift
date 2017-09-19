import XCTest
@testable import JavaCodeWriter

class FileWriterTests: XCTestCase {

    func testWriteEnumFile() {
        var enumDescription = EnumDescription(name: "Sample");
        enumDescription.cases.append(.init(name: "CASE1"))
        enumDescription.cases.append(.init(name: "CASE2"))
        let fileDescription = FileDescription(enumDescription: enumDescription, package: "com.app")
        XCTAssertEqual("package com.app;\n\nenum Sample {\n    CASE1,\n    CASE2\n}", FileWriter.default.write(description: fileDescription))
    }

    func testWriteInterfaceFile() {
        var interfaceDescription = InterfaceDescription(name: "Custom", options: .init(visibility: .public))
        interfaceDescription.methods.append(.init(name: "toString", returnType: "String", imports: ["java.lang.String"]))
        let fileDescription = FileDescription(interfaceDescription: interfaceDescription, package: "com.app")
        XCTAssertEqual("package com.app;\n\nimport java.lang.String;\n\npublic interface Custom {\n    String toString();\n}", FileWriter.default.write(description: fileDescription))
    }

    func testWriteClassFile() {
        var classDescription = ClassDescription(name: "Sample", options: .init(visibility: .public))
        classDescription.fields.append(.init(name: "hello", type: "String", imports: ["java.lang.String"]))
        classDescription.fields.append(.init(name: "bonjour", type: "String", imports: ["java.lang.String"]))
        let fileDescription = FileDescription(classDescription: classDescription, package: "com.app")
        XCTAssertEqual("package com.app;\n\nimport java.lang.String;\n\npublic class Sample {\n    String hello;\n    String bonjour;\n}", FileWriter.default.write(description: fileDescription))
    }

    static var allTests = [
        ("testWriteEnumFile", testWriteEnumFile),
        ("testWriteInterfaceFile", testWriteInterfaceFile),
        ("testWriteClassFile", testWriteClassFile)
    ]
}
