//
//  InterfaceWriter.swift
//  JavaCodeWriter
//
//  Created by Benoit BRIATTE on 16/08/2017.
//

import Foundation
import CodeWriter

struct InterfaceWriter: CodeWriter {

    public typealias Description = InterfaceDescription

    public static let `default` = InterfaceWriter()

    private init() {}

    public func write(description: InterfaceDescription, depth: Int) -> String {
        return ""
    }
}
