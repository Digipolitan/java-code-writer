//
//  AnnotationDescription.swift
//  JavaCodeWriter
//
//  Created by Benoit BRIATTE on 18/08/2017.
//

import Foundation

public struct AnnotationDescription: ImportDependency {

    public let name: String
    public var argument: String?
    public var imports: [String]

    public init(name: String, argument: String, imports: [String] = []) {
        self.name = name
        self.argument = argument
        self.imports = imports
    }

    public func importDependencies() -> [String] {
        return self.imports
    }
}
