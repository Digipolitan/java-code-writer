//
//  EnumWriter.swift
//  JavaCodeWriter
//
//  Created by Benoit BRIATTE on 18/08/2017.
//

import Foundation
import CodeWriter

struct EnumWriter: CodeWriter {

    public typealias Description = EnumDescription

    public static let `default` = EnumWriter()

    private init() {}

    public func write(description: EnumDescription, depth: Int) -> String {
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

        options.append("enum")
        options.append(description.name)
        options.append("{")

        builder.add(string: options.joined(separator: " "), indent: true)

        parts.append(builder.build())

        var body: [String] = []

        let hasFields = description.fields.count > 0
        let hasMethods = description.methods.count > 0

        var cases = description.cases.map { CaseWriter.default.write(description: $0, depth: depth + 1) }.joined(separator: ",\n")
        if hasFields || hasMethods {
            let endCaseBuilder = CodeBuilder(depth: cases.count == 0 ? depth + 1 : 0)
            endCaseBuilder.add(string: ";", indent: true)
            cases += endCaseBuilder.build()
        }
        if cases.count > 0 {
            body.append(cases)
        }

        if hasFields {
            body.append(description.fields.map { FieldWriter.default.write(description: $0, depth: depth + 1) }.joined(separator: "\n"))
        }
        if hasMethods {
            body.append(description.methods.map { MethodWriter.default.write(description: $0, depth: depth + 1) }.joined(separator: "\n\n"))
        }

        if body.count > 0 {
            parts.append(body.joined(separator: "\n\n"))
        }

        let closeBuilder = CodeBuilder(depth: depth)
        closeBuilder.add(string: "}", indent: true, crlf: false)
        parts.append(closeBuilder.build())

        return parts.joined(separator: "\n")
    }

    struct CaseWriter: CodeWriter {

        public typealias Description = EnumDescription.Case

        public static let `default` = CaseWriter()

        private init() {}

        public func write(description: EnumDescription.Case, depth: Int) -> String {
            let builder = CodeBuilder(depth: depth)
            if let documentation = description.documentation {
                builder.add(string: DocumentationWriter.MultiLine.default.write(documentation: documentation, depth: depth), crlf: true)
            }

            description.annotations?.forEach { builder.add(line: AnnotationWriter.default.write(description: $0)) }

            builder.add(string: description.name, indent: true)

            return builder.build()
        }
    }

}
