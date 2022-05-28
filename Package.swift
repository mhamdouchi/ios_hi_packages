// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HIPackages",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(name: "HIHelpers", targets: ["HIHelpers"]),
        .library(name: "HIExtensions", targets: ["HIExtensions"]),
        .library(name: "HIProtocols", targets: ["HIProtocols"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "HIHelpers", dependencies: ["HIExtensions"]),
        .target(name: "HIExtensions", dependencies: ["HIProtocols"]),
        .target(name: "HIProtocols", dependencies: []),
        .testTarget(name: "HIExtensionsTests", dependencies: ["HIExtensions"]),
    ]
)
