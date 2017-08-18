//
//  EnumDescription.swift
//  JavaCodeWriter
//
//  Created by Benoit BRIATTE on 18/08/2017.
//

import Foundation

public struct EnumDescription: ImportDependency {

    public struct Options {
        public let visibility: Visibility

        public init(visibility: Visibility = .default) {
            self.visibility = visibility
        }
    }

    public struct Case {
        public let name: String
        public let annotations: [AnnotationDescription]?
        public let documentation: String?

        public init(name: String, annotations: [AnnotationDescription]? = nil, documentation: String? = nil) {
            self.name = name
            self.annotations = annotations
            self.documentation = documentation
        }
    }

    public let name: String
    public let options: Options
    public var cases: [Case]
    public var implements: [String]
    public var imports: [String]
    public var methods: [MethodDescription]
    public var fields: [FieldDescription]
    public var nestedClasses: [ClassDescription]
    public var nestedEnums: [EnumDescription]
    public var nestedInterfaces: [InterfaceDescription]
    public var annotations: [AnnotationDescription]
    public let documentation: String?

    public init(name: String, options: Options = Options(), imports: [String] = [], documentation: String? = nil) {
        self.name = name
        self.options = options
        self.imports = imports
        self.documentation = documentation
        self.cases = []
        self.implements = []
        self.methods = []
        self.fields = []
        self.nestedClasses = []
        self.nestedEnums = []
        self.nestedInterfaces = []
        self.annotations = []
    }

    public func importDependencies() -> [String] {
        var dependencies: [ImportDependency] = []
        dependencies += self.annotations as [ImportDependency]
        dependencies += self.methods as [ImportDependency]
        dependencies += self.fields as [ImportDependency]
        dependencies += self.nestedClasses as [ImportDependency]
        dependencies += self.nestedEnums as [ImportDependency]
        dependencies += self.nestedInterfaces as [ImportDependency]
        var modules = self.modules
        self.cases.forEach { modules += $0.modules }
        return EnumDescription.union(imports: self.imports, with: dependencies)
    }
}

