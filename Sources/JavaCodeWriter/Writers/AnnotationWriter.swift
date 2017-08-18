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
        return ""
    }
}
