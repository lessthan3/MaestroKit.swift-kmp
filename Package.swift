// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MaestroKit",
    platforms: [.tvOS(.v18), .iOS(.v18)],
        products: [
            .library(name: "MaestroKitParamount", targets: ["MaestroKitParamount", "MaestroCore", "paramountKit"])
        ],
        targets: [
            .binaryTarget(name: "MaestroKitParamount", path: "Frameworks/MaestroKitParamount.xcframework.zip"),
            .binaryTarget(name: "MaestroCore", path: "Frameworks/MaestroCore.xcframework.zip"),
            .binaryTarget(
                name: "paramountKit",
                url: "https://github.com/lessthan3/MaestroKit.android/releases/download/paramountKit-4.0.14.196/paramountKit-4.0.14.196.zip",
                checksum: "f4f6d048040094115d79c5ab766b29aed1232f7c5fc1e6e6f2f1b395b1d91275"
            )
        ]
)
