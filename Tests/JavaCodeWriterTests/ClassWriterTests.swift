import XCTest
@testable import JavaCodeWriter
import CodeWriter

class ClassWriterTests: XCTestCase {

    func testWriteEmptyClassWithDocumentation() {
        let classDescription = ClassDescription(name: "Sample", documentation: "MySampleInterface")
        XCTAssertEqual("/**\n * MySampleInterface\n */\nclass Sample {\n}", ClassWriter.default.write(description: classDescription))
    }

    func testWriteEmptyPublicClassWithExtends() {
        let classDescription = ClassDescription(name: "Sample", options: .init(visibility: .public), parent: "Fragment")
        XCTAssertEqual("public class Sample extends Fragment {\n}", ClassWriter.default.write(description: classDescription))
    }

    func testWriteEmptyClassWithExtendsAnd2Implements() {
        var classDescription = ClassDescription(name: "Sample", parent: "Fragment")
        classDescription.implements.append("I1")
        classDescription.implements.append("I2")
        XCTAssertEqual("class Sample extends Fragment implements I1, I2 {\n}", ClassWriter.default.write(description: classDescription))
    }

    func testWriteEmptyClassWithImplementsOnly() {
        var classDescription = ClassDescription(name: "Sample")
        classDescription.implements.append("I1")
        XCTAssertEqual("class Sample implements I1 {\n}", ClassWriter.default.write(description: classDescription))
    }

    func testWriteClassWith2Fields() {
        var classDescription = ClassDescription(name: "Sample")
        classDescription.fields.append(.init(name: "toto", type: "Toto"))
        classDescription.fields.append(.init(name: "sample", type: "Sample"))
        XCTAssertEqual("class Sample {\n    Toto toto;\n    Sample sample;\n}", ClassWriter.default.write(description: classDescription))
    }

    func testWriteClassWithFieldAndMethods() {
        var classDescription = ClassDescription(name: "Sample")
        classDescription.fields.append(.init(name: "toto", type: "Toto"))
        classDescription.constructors.append(.init(name: "Sample"))
        classDescription.methods.append(.init(name: "toString", code: CodeBuilder.from(code: "return \"\";"), returnType: "String"))
        XCTAssertEqual("class Sample {\n    Toto toto;\n\n    Sample() {\n    }\n\n    String toString() {\n        return \"\";\n    }\n}", ClassWriter.default.write(description: classDescription))
    }
    
    static var allTests = [
        ("testWriteEmptyClassWithDocumentation", testWriteEmptyClassWithDocumentation),
        ("testWriteEmptyPublicClassWithExtends", testWriteEmptyPublicClassWithExtends),
        ("testWriteEmptyClassWithExtendsAnd2Implements", testWriteEmptyClassWithExtendsAnd2Implements),
        ("testWriteEmptyClassWithImplementsOnly", testWriteEmptyClassWithImplementsOnly),
        ("testWriteClassWith2Fields", testWriteClassWith2Fields),
        ("testWriteClassWithFieldAndMethods", testWriteClassWithFieldAndMethods),
    ]
}
