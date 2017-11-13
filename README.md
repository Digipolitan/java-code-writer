JavaCodeWriter
=================================

[![Swift Version](https://img.shields.io/badge/swift-4.0-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![Swift Package Manager](https://rawgit.com/jlyonsmith/artwork/master/SwiftPackageManager/swiftpackagemanager-compatible.svg)](https://swift.org/package-manager/)
[![Twitter](https://img.shields.io/badge/twitter-@Digipolitan-blue.svg?style=flat)](http://twitter.com/Digipolitan)

Library to write java source code

## Installation

### SPM

To install JavaCodeWriter with SwiftPackageManager, add the following lines to your `Package.swift`.

```swift
let package = Package(
    name: "XXX",
    products: [
        .library(
            name: "XXX",
            targets: ["XXX"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Digipolitan/ode-writer.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "XXX",
            dependencies: ["JavaCodeWriter"])
    ]
)
```

## The Basics

You must create a file description that represent the java output file with the given following type
- class `ClassDescription`
- enum `EnumDescription`
- protocol `InterfaceDescription`

```swift
// Create a User class with 2 fields
var cd = ClassDescription(name: "User", options: .init(visibility: .public))
cd.fields.append(.init(name: "lastName", type: "String"))
cd.fields.append(.init(name: "firstName", type: "String"))
let fileDescription = FileDescription(classDescription: cd, package: "com.digipolitan.user")
```

After that use the FileWriter to transform the given FileDescription to string as follow

```swift
let res = FileWriter.default.write(description: fileDescription)
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for more details!

This project adheres to the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md).
By participating, you are expected to uphold this code. Please report
unacceptable behavior to [contact@digipolitan.com](mailto:contact@digipolitan.com).

## License

JavaCodeWriter is licensed under the [BSD 3-Clause license](LICENSE).
