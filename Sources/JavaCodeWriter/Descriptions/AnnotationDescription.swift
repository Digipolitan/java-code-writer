//
//  AnnotationDescription.swift
//  JavaCodeWriter
//
//  Created by Benoit BRIATTE on 18/08/2017.
//

import Foundation

public struct AnnotationDescription: ImportDependency {

    public let name: String
    public var parameter: String?
    public var imports: [String]

    public init(name: String, parameter: String? = nil, imports: [String] = []) {
        self.name = name
        self.parameter = parameter
        self.imports = imports
    }

    public func importDependencies() -> [String] {
        return self.imports
    }
}
