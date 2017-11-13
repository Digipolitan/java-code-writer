//
//  MethodDescription.swift
//  JavaCodeWriter
//
//  Created by Benoit BRIATTE on 18/08/2017.
//

import Foundation
import CodeWriter

public struct MethodDescription: ImportDependency {

    public struct Options {
        public let visibility: Visibility
        public let isStatic: Bool
        public let isFinal: Bool
        public let isAbstract: Bool
        public let isSynchronized: Bool
        public let isStrictFloatingPoint: Bool

        public init(visibility: Visibility = .default, isStatic: Bool = false, isFinal: Bool = false, isAbstract: Bool = false, isSynchronized: Bool = false, isStrictFloatingPoint: Bool = false) {
            self.visibility = visibility
            self.isStatic = isStatic
            self.isFinal = isFinal
            self.isAbstract = isAbstract
            self.isSynchronized = isSynchronized
            self.isStrictFloatingPoint = isStrictFloatingPoint
        }
    }

    public let name: String
    public let code: CodeBuilder?
    public let options: Options
    public let imports: [String]
    public let parameters: [String]?
    public let returnType: String
    public let annotations: [AnnotationDescription]?
    public let throwables: [String]?
    public let documentation: String?

    public init(name: String,
                code: CodeBuilder? = nil,
                options: Options = Options(),
                returnType: String,
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
        self.returnType = returnType
        self.annotations = annotations
        self.throwables = throwables
        self.documentation = documentation
    }

    public func importDependencies() -> [String] {
        if let annotations = self.annotations {
            return MethodDescription.union(imports: self.imports, with: annotations as [ImportDependency])
        }
        return self.imports
    }
}
