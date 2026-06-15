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
            url:
                "https://github.com/lessthan3/MaestroKit.android/releases/download/paramountKit-4.0.15.203/paramountKit-4.0.15.203.zip",
            checksum: "1038247bd46a6bfb403293d94381e225c981b74941b7fdff847b4c818ae152f1"
        ),
    ]
)
