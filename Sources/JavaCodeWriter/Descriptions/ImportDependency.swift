//
//  ImportDependency.swift
//  JavaCodeWriter
//
//  Created by Benoit BRIATTE on 17/08/2017.
//

import Foundation

public protocol ImportDependency {

    func importDependencies() -> [String]
}

public extension ImportDependency {

    public static func union(imports: [String], with dependencies: [ImportDependency]) -> [String] {
        var res = Set<String>(imports)
        dependencies.forEach { res.formUnion($0.importDependencies()) }
        return Array(res)
    }
}
