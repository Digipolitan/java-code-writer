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
        return ""
    }
}
