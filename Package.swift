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
        .target(name: "HIClasses"), .target(name: "HIExtensions"), .target(name: "HIProtocols"),
        .testTarget(name: "HIExtensionsTests", dependencies: ["HIExtensions"]),
    ]
)
