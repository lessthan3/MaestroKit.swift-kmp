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
            url: "https://github.com/lessthan3/MaestroKit.android/releases/download/paramountKit-4.0.20.238/paramountKit-4.0.20.238.zip",
            checksum: "e7f32ed5b9001ffcd784a4eca8a65cf67bbbc59ec3387708a53a4b670379abff"
        )
    ]
)
