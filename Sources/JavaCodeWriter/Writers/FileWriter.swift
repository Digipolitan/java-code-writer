//
//  FileWriter.swift
//  JavaCodeWriter
//
//  Created by Benoit BRIATTE on 18/08/2017.
//

import Foundation
import CodeWriter

public struct FileWriter: CodeWriter {

    public typealias Description = FileDescription

    public static let `default` = FileWriter()

    private init() {}

    public func write(description: FileDescription, depth: Int) -> String {
        let builder = CodeBuilder(depth: depth)

        builder.add(line: "package \(description.package);")

        builder.add(line: "")

        let imports = description.importDependencies()
        if imports.count > 0 {
            description.importDependencies().forEach { builder.add(line: "import \($0);") }
            builder.add(line: "")
        }

        if let classDescription = description.classDescription {
            builder.add(string: ClassWriter.default.write(description: classDescription))
        } else if let enumDescription = description.enumDescription {
            builder.add(string: EnumWriter.default.write(description: enumDescription))
        } else if let interfaceDescription = description.interfaceDescription {
            builder.add(string: InterfaceWriter.default.write(description: interfaceDescription))
        }

        return builder.build()
    }
}
