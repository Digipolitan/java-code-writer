//
//  AnnotationWriter.swift
//  JavaCodeWriter
//
//  Created by Benoit BRIATTE on 18/08/2017.
//

import Foundation
import CodeWriter

struct AnnotationWriter: CodeWriter {

    public typealias Description = AnnotationDescription

    public static let `default` = AnnotationWriter()

    private init() {}

    public func write(description: AnnotationDescription, depth: Int) -> String {
        let builder = CodeBuilder(depth: depth)

        var line = "@"
        line += description.name

        if let parameter = description.parameter {
            line += "(\(parameter))"
        }

        builder.add(string: line, indent: true, crlf: false)
        
        return builder.build()
    }
}
