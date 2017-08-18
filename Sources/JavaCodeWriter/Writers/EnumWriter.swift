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
        return ""
    }
}
