//
//  ConstructorDescription.swift
//  JavaCodeWriter
//
//  Created by Benoit BRIATTE on 18/08/2017.
//

import Foundation
import CodeWriter

public struct ConstructorDescription: ImportDependency {

    public struct Options {
        public let visibility: Visibility

        public init(visibility: Visibility = .default) {
            self.visibility = visibility
        }
    }

    public let name: String
    public let code: CodeBuilder
    public let options: Options
    public let imports: [String]
    public let parameters: [String]?
    public let annotations: [AnnotationDescription]?
    public let throwables: [String]?
    public let documentation: String?

    public init(name: String,
                code: CodeBuilder = CodeBuilder.from(code: ""),
                options: Options = Options(),
                imports: [String] = [],
                parameters: [String]? = nil,
                annotations: [AnnotationDescription]? = nil,
                throwables: [String]? = nil,
                documentation: String? = nil) {
        self.name = name
        self.code = code
        self.options = options
        self.imports = imports
        self.parameters = parameters
        self.annotations = annotations
        self.throwables = throwables
        self.documentation = documentation
    }

    public func importDependencies() -> [String] {
        if let annotations = self.annotations {
            return ConstructorDescription.union(imports: self.imports, with: annotations as [ImportDependency])
        }
        return self.imports
    }
}
