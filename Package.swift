// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JavaCodeWriter",
    products: [
        .library(
            name: "JavaCodeWriter",
            targets: ["JavaCodeWriter"])
    ],
    dependencies: [
        .package(url: "https://github.com/Digipolitan/code-writer.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "JavaCodeWriter",
            dependencies: ["CodeWriter"]),
        .testTarget(
            name: "JavaCodeWriterTests",
            dependencies: ["JavaCodeWriter"])
    ]
)
