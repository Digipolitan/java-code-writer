//
//  FileDescription.swift
//  JavaCodeWriter
//
//  Created by Benoit BRIATTE on 18/08/2017.
//

import Foundation

public struct FileDescription: ImportDependency {

    public var classes: [ClassDescription]
    public var enums: [EnumDescription]
    public var protocols: [ProtocolDescription]
    public var extensions: [ExtensionDescription]
    public var methods: [MethodDescription]
    public var properties: [FieldDescription]
    public let documentation: String?

    public init(documentation: String? = nil) {
        self.documentation = documentation
        self.classes = []
        self.enums = []
        self.protocols = []
        self.extensions = []
        self.methods = []
        self.properties = []
    }

    public func importDependencies() -> [String] {
        var dependencies: [ImportDependency] = []
        dependencies += self.classes as [ImportDependency]
        dependencies += self.enums as [ImportDependency]
        dependencies += self.protocols as [ImportDependency]
        dependencies += self.extensions as [ImportDependency]
        dependencies += self.methods as [ImportDependency]
        dependencies += self.properties as [ImportDependency]
        return FileDescription.union(modules: [], with: dependencies)
    }
}
