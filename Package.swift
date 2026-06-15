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
            name: "MaestroKit",
            targets: ["MaestroKitParamount", "MaestroCore", "paramountKit"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "MaestroKitParamount",
            url: "https://cloudStorageService/MaestroKitParamount.xcframework.zip",
            checksum: "eabd01a2eeede758ed785c0a98ce03d29935ce0a59603eb200e6fe9f65477b19"),
        .binaryTarget(
            name: "MaestroCore",
            url: "https://cloudStorageService/MaestroCore.xcframework.zip",
            checksum: "e4eadae8eb2f4f2477c428b49ece0d3ab47f991a266314dd53312c0cc12d00c5"),
        .binaryTarget(
            name: "paramountKit",
            url:
                "https://github.com/lessthan3/MaestroKit.android/releases/download/4.0.1.108/paramountKit-4.0.1.108.zip",
            checksum: "b1580724914f89b1e366134743389ac1427886b725a40610f5034b568b12aca2"
        ),

    ]
)
