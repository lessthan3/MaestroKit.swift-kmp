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
                url: "https://github.com/lessthan3/MaestroKit.android/releases/download/paramountKit-4.0.14.185/paramountKit-4.0.14.185.zip",
                checksum: "848d0d5c85b45d272499777d03fd916bf42c02ca5f205d761584c5dfaf3121ae"
            )
        ]
)
