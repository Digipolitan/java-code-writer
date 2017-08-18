//
//  DocumentationWriter.swift
//  JavaCodeWriter
//
//  Created by Benoit BRIATTE on 18/08/2017.
//

import Foundation
import CodeWriter

enum DocumentationWriter {

    public enum Mode {
        case stars
        case slashes
    }

    struct SingleLine {

        public static let `default` = SingleLine()

        private init() { }

        public func write(documentation: String, mode: Mode = .slashes) -> String {
            if mode == .stars {
                return "/** \(documentation) */"
            }
            return "// \(documentation)"
        }
    }

    public struct MultiLine {

        public static let `default` = MultiLine()

        private init() { }

        public func write(documentation: String, depth: Int = 0, mode: Mode = .stars) -> String {
            let builder = CodeBuilder(depth: depth)
            if mode == .stars {
                self.writeStars(documentation: documentation, to: builder)
            } else {
                self.writeSlashes(documentation: documentation, to: builder)
            }
            return builder.build()
        }

        private func writeSlashes(documentation: String, to builder: CodeBuilder) {
            builder.add(line: "//")
            documentation.components(separatedBy: "\n").forEach {
                if $0.count > 0 {
                    builder.add(line: "//  \($0)")
                } else {
                    builder.add(line: "//")
                }
            }
            builder.add(string: "//", indent: true)
        }

        private func writeStars(documentation: String, to builder: CodeBuilder) {
            builder.add(line: "/**")
            documentation.components(separatedBy: "\n").forEach {
                if $0.count > 0 {
                    builder.add(line: " * \($0)")
                } else {
                    builder.add(line: " *")
                }
            }
            builder.add(string: " */", indent: true)
        }
    }
}
