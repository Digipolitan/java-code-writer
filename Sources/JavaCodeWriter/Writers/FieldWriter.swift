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
        return ""
    }
}
