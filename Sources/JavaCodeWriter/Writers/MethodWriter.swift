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
        return ""
    }
}
