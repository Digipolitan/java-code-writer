//
//  FileDescription.swift
//  JavaCodeWriter
//
//  Created by Benoit BRIATTE on 18/08/2017.
//

import Foundation

public struct FileDescription: ImportDependency {

    public let classDescription: ClassDescription?
    public let enumDescription: EnumDescription?
    public let interfaceDescription: InterfaceDescription?
    public let package: String

    public init(classDescription: ClassDescription, package: String) {
        self.classDescription = classDescription
        self.enumDescription = nil
        self.interfaceDescription = nil
        self.package = package
    }

    public init(enumDescription: EnumDescription, package: String) {
        self.enumDescription = enumDescription
        self.classDescription = nil
        self.interfaceDescription = nil
        self.package = package
    }

    public init(interfaceDescription: InterfaceDescription, package: String) {
        self.interfaceDescription = interfaceDescription
        self.classDescription = nil
        self.enumDescription = nil
        self.package = package
    }

    public func importDependencies() -> [String] {
        if let classDescription = self.classDescription {
            return classDescription.imports
        }
        if let enumDescription = self.enumDescription {
            return enumDescription.imports
        }
        if let interfaceDescription = self.interfaceDescription {
            return interfaceDescription.imports
        }
        return []
    }
}
