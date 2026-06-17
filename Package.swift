// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MaestroKit",
    platforms: [
        .iOS(.v18), .tvOS(.v18),
    ],
    products: [
        .library(
            name: "MaestroKitParamount",
            targets: ["MaestroKitParamount", "MaestroCore", "paramountKit"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "MaestroKitParamount",
            path: "Frameworks/MaestroKitParamount.xcframework.zip"),
        .binaryTarget(
            name: "MaestroCore",
            path: "Frameworks/MaestroCore.xcframework.zip"),
        .binaryTarget(
            name: "paramountKit",
            url: "https://github.com/lessthan3/MaestroKit.android/releases/download/paramountKit-4.0.15.212/paramountKit-4.0.15.212.zip",
            checksum: "a8c6b61137b40812bdc2e330d554147c38f158ca28c4ea4777b2d4fbb5689b69"
        )
    ]
)
