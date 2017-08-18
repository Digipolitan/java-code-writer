//
//  ClassWriter.swift
//  JavaCodeWriter
//
//  Created by Benoit BRIATTE on 18/08/2017.
//

import Foundation
import CodeWriter

struct ClassWriter: CodeWriter {

    public typealias Description = ClassDescription

    public static let `default` = ClassWriter()

    private init() {}

    public func write(description: ClassDescription, depth: Int) -> String {
        return ""
    }
}

