//
//  FieldDescription.swift
//  JavaCodeWriter
//
//  Created by Benoit BRIATTE on 18/08/2017.
//

import Foundation
import CodeWriter

public struct FieldDescription: ImportDependency {

    public struct Options {
        public let visibility: Visibility
        public let isStatic: Bool
        public let isFinal: Bool
        public let isTransient: Bool
        public let isVolatile: Bool

        public init(visibility: Visibility = .default, isStatic: Bool = false, isFinal: Bool = false, isTransient: Bool = false, isVolatile: Bool = false) {
            self.visibility = visibility
            self.isStatic = isStatic
            self.isFinal = isFinal
            self.isTransient = isTransient
            self.isVolatile = isVolatile
        }
    }

    public let name: String
    public let type: String
    public let options: Options
    public let imports: [String]
    public let value: CodeBuilder?
    public let annotations: [AnnotationDescription]?
    public let documentation: String?

    public init(name: String,
                options: Options = Options(),
                type: String,
                imports: [String] = [],
                value: CodeBuilder? = nil,
                annotations: [AnnotationDescription]? = nil,
                documentation: String? = nil) {
        self.name = name
        self.options = options
        self.type = type
        self.value = value
        self.annotations = annotations
        self.documentation = documentation
        self.imports = imports
    }

    public func importDependencies() -> [String] {
        if let annotations = self.annotations {
            return FieldDescription.union(imports: self.imports, with: annotations as [ImportDependency])
        }
        return self.imports
    }
}
