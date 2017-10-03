//
//  InterfaceWriter.swift
//  JavaCodeWriter
//
//  Created by Benoit BRIATTE on 16/08/2017.
//

import Foundation
import CodeWriter

struct InterfaceWriter: CodeWriter {

    public typealias Description = InterfaceDescription

    public static let `default` = InterfaceWriter()

    private init() {}

    public func write(description: InterfaceDescription, depth: Int) -> String {
        var parts: [String] = []

        if let documentation = description.documentation {
            parts.append(DocumentationWriter.MultiLine.default.write(documentation: documentation, depth: depth))
        }

        let builder = CodeBuilder(depth: depth)

        description.annotations.forEach { builder.add(line: AnnotationWriter.default.write(description: $0)) }

        var options: [String] = []
        if description.options.visibility != .default {
            options.append(description.options.visibility.rawValue)
        }

        if description.options.isStrictFloatingPoint {
            options.append("strictfp")
        }

        options.append("interface")

        var interface: String = description.name
        if let parents = description.parents {
            interface += " extends "
            interface += parents.joined(separator: ", ")
        }
        interface += " {"

        options.append(interface)

        builder.add(string: options.joined(separator: " "), indent: true)

        parts.append(builder.build())

        var body: [String] = []
        if description.fields.count > 0 {
            body.append(description.fields.map { FieldWriter.default.write(description: $0, depth: depth + 1) }.joined(separator: "\n"))
        }
        if description.methods.count > 0 {
            body.append(description.methods.map { MethodWriter.default.write(description: $0, depth: depth + 1) }.joined(separator: "\n\n"))
        }
        if description.nestedInterfaces.count > 0 {
            body.append(description.nestedInterfaces.map { InterfaceWriter.default.write(description: $0, depth: depth + 1) }.joined(separator: "\n\n"))
        }
        if description.nestedEnums.count > 0 {
            body.append(description.nestedEnums.map { EnumWriter.default.write(description: $0, depth: depth + 1) }.joined(separator: "\n\n"))
        }
        if description.nestedClasses.count > 0 {
            body.append(description.nestedClasses.map { ClassWriter.default.write(description: $0, depth: depth + 1) }.joined(separator: "\n\n"))
        }
        if body.count > 0 {
            parts.append(body.joined(separator: "\n\n"))
        }

        let closeBuilder = CodeBuilder(depth: depth)
        closeBuilder.add(string: "}", indent: true, crlf: false)
        parts.append(closeBuilder.build())

        return parts.joined(separator: "\n")
    }
}
