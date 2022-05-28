// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HIPackages",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(name: "HIClasses", targets: ["HIClasses"]),
        .library(name: "HIExtensions", targets: ["HIExtensions"]),
        .library(name: "HIProtocols", targets: ["HIProtocols"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "HIClasses", dependencies: ["HIExtensions", "HIProtocols"]),
        .target(name: "HIExtensions", dependencies: []),
        .target(name: "HIProtocols", dependencies: []),
        .testTarget(name: "HIExtensionsTests", dependencies: ["HIExtensions"]),
    ]
)
