//
//  FieldWriter.swift
//  JavaCodeWriter
//
//  Created by Benoit BRIATTE on 16/08/2017.
//

import Foundation
import CodeWriter

struct FieldWriter: CodeWriter {

    public typealias Description = FieldDescription

    public static let `default` = FieldWriter()

    private init() {}

    public func write(description: FieldDescription, depth: Int) -> String {

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
        if description.options.isStatic {
            options.append("static")
        }
        if description.options.isVolatile {
            options.append("volatile")
        }
        if description.options.isTransient {
            options.append("transient")
        }
        if description.options.isFinal {
            options.append("final")
        }

        options.append(description.type)
        options.append(description.name)

        builder.add(string: options.joined(separator: " "), indent: true)

        if let value = description.value {
            builder.add(string: " = ")
            builder.add(code: value, indent: false, crlf: false)
        }

        builder.add(string: ";")

        return builder.build()
    }
}
