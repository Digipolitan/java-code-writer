//
//  FileWriter.swift
//  JavaCodeWriter
//
//  Created by Benoit BRIATTE on 18/08/2017.
//

import Foundation
import CodeWriter

public struct FileWriter: CodeWriter {

    public typealias Description = FileDescription

    public static let `default` = FileWriter()

    private init() {}

    public func write(description: FileDescription, depth: Int) -> String {
        return ""
    }
}
