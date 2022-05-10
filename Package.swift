// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HIExtensions",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(name: "HIExtensions", targets: ["HIExtensions"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "HIExtensions", dependencies: [], resources: [.process("Resources")]),
        .testTarget(name: "HIExtensionsTests", dependencies: ["HIExtensions"]),
    ]
)
