//
//  InterfaceDescription.swift
//  JavaCodeWriter
//
//  Created by Benoit BRIATTE on 18/08/2017.
//

import Foundation

public struct InterfaceDescription: ImportDependency {

    public struct Options {
        public let visibility: Visibility
        public let isStrictFloatingPoint: Bool

        public init(visibility: Visibility = .default, isStrictFloatingPoint: Bool = false) {
            self.visibility = visibility
            self.isStrictFloatingPoint = isStrictFloatingPoint
        }
    }

    public let name: String
    public let options: Options
    public let parents: [String]?
    public var imports: [String]
    public var methods: [MethodDescription]
    public var fields: [FieldDescription]
    public var nestedClasses: [ClassDescription]
    public var nestedEnums: [EnumDescription]
    public var nestedInterfaces: [InterfaceDescription]
    public var annotations: [AnnotationDescription]
    public let documentation: String?

    public init(name: String, options: Options = Options(), parents: [String]? = nil, imports: [String] = [], documentation: String? = nil) {
        self.name = name
        self.options = options
        self.parents = parents
        self.imports = imports
        self.documentation = documentation
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
        return InterfaceDescription.union(imports: self.imports, with: dependencies)
    }
}

