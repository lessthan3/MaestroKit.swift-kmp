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
                url: "https://github.com/lessthan3/MaestroKit.android/releases/download/paramountKit-4.0.12.174/paramountKit-4.0.12.174.zip",
                checksum: "d3f3f821f5fa7860107b6537154476691c18e15147558dde6548abafe30e59be"
            )
        ]
)
