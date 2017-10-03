//
//  ClassDescription.swift
//  JavaCodeWriter
//
//  Created by Benoit BRIATTE on 18/08/2017.
//

import Foundation

public struct ClassDescription: ImportDependency {

    public struct Options {
        public let visibility: Visibility
        public let isStatic: Bool
        public let isFinal: Bool
        public let isAbstract: Bool
        public let isStrictFloatingPoint: Bool

        public init(visibility: Visibility = .default, isStatic: Bool = false, isFinal: Bool = false, isAbstract: Bool = false, isStrictFloatingPoint: Bool = false) {
            self.visibility = visibility
            self.isStatic = isStatic
            self.isFinal = isFinal
            self.isAbstract = isAbstract
            self.isStrictFloatingPoint = isStrictFloatingPoint
        }
    }

    public let name: String
    public let options: Options
    public let parent: String?
    public var implements: [String]
    public var imports: [String]
    public var constructors: [ConstructorDescription]
    public var methods: [MethodDescription]
    public var fields: [FieldDescription]
    public var nestedClasses: [ClassDescription]
    public var nestedEnums: [EnumDescription]
    public var nestedInterfaces: [InterfaceDescription]
    public var annotations: [AnnotationDescription]
    public let documentation: String?

    public init(name: String, options: Options = Options(), parent: String? = nil, imports: [String] = [], documentation: String? = nil) {
        self.name = name
        self.options = options
        self.parent = parent
        self.imports = imports
        self.documentation = documentation
        self.implements = []
        self.constructors = []
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
        dependencies += self.constructors as [ImportDependency]
        dependencies += self.methods as [ImportDependency]
        dependencies += self.fields as [ImportDependency]
        dependencies += self.nestedClasses as [ImportDependency]
        dependencies += self.nestedEnums as [ImportDependency]
        dependencies += self.nestedInterfaces as [ImportDependency]
        return ClassDescription.union(imports: self.imports, with: dependencies)
    }
}
