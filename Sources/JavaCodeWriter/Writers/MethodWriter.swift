//
//  MethodWriter.swift
//  JavaCodeWriter
//
//  Created by Benoit BRIATTE on 16/08/2017.
//

import Foundation
import CodeWriter

struct MethodWriter: CodeWriter {

    public typealias Description = MethodDescription

    public static let `default` = MethodWriter()

    private init() {}

    public func write(description: MethodDescription, depth: Int) -> String {

        let builder = CodeBuilder(depth: depth)
        if let documentation = description.documentation {
            if documentation.index(of: "\n") != nil {
                builder.add(string: DocumentationWriter.MultiLine.default.write(documentation: documentation, depth: depth), crlf: true)
            } else {
                builder.add(line: DocumentationWriter.SingleLine.default.write(documentation: documentation))
            }
        }
        description.annotations?.forEach { builder.add(line: AnnotationWriter.default.write(description: $0)) }

        var options: [String] = []
        if description.options.visibility != .default {
            options.append(description.options.visibility.rawValue)
        }

        if description.options.isAbstract {
            options.append("abstract")
        }
        if description.options.isStatic {
            options.append("static")
        }
        if description.options.isFinal {
            options.append("final")
        }
        if description.options.isStrictFloatingPoint {
            options.append("strictfp")
        }
        if description.options.isSynchronized {
            options.append("synchronized")
        }

        options.append(description.returnType)

        var method: String = "\(description.name)("
        if let parameters = description.parameters {
            method += parameters.joined(separator: ", ")
        }
        method += ")"

        options.append(method)

        if let throwables = description.throwables {
            options.append("throws")
            options.append(throwables.joined(separator: ", "))
        }

        if let impl = description.code {
            options.append("{")
            builder.add(line: options.joined(separator: " "))
            builder.rightTab().add(code: impl).leftTab()
            builder.add(string: "}", indent: true)
        } else {
            builder.add(string: options.joined(separator: " "), indent: true)
            builder.add(string: ";")
        }

        return builder.build()
    }
}
