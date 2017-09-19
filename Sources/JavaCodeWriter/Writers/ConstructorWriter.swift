//
//  ConstructorWriter.swift
//  JavaCodeWriter
//
//  Created by Benoit BRIATTE on 16/08/2017.
//

import Foundation
import CodeWriter

struct ConstructorWriter: CodeWriter {

    public typealias Description = ConstructorDescription

    public static let `default` = ConstructorWriter()

    private init() {}

    public func write(description: ConstructorDescription, depth: Int) -> String {
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

        var contructor: String = "\(description.name)("
        if let parameters = description.parameters {
            contructor += parameters.joined(separator: ", ")
        }
        contructor += ")"

        options.append(contructor)

        if let throwables = description.throwables {
            options.append("throws")
            options.append(throwables.joined(separator: ", "))
        }

        options.append("{")
        builder.add(line: options.joined(separator: " "))
        builder.rightTab().add(code: description.code).leftTab()
        builder.add(string: "}", indent: true)

        return builder.build()
    }
}
