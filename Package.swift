// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "swift-units",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
        .tvOS(.v16),
        .watchOS(.v9),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "Units",
            targets: ["Units"]
        ),
        .executable(
            name: "UnitsExample",
            targets: ["UnitsExample"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-docc-plugin", from: "1.4.3")
    ],
    targets: [
        .target(name: "Units"),
        .executableTarget(
            name: "UnitsExample",
            dependencies: ["Units"]
        ),
        .testTarget(
            name: "UnitsTests",
            dependencies: ["Units"]
        )
    ]
)
