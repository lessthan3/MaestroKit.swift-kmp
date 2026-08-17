// swift-tools-version: 6.2
// GENERATED — do not edit by hand.
//
// Rendered by scripts/render_package_manifest.sh from this template during a
// tagged release build. The KMP target's url + checksum are pulled straight
// from the client's <kit>/Package.swift — the same coordinates the framework
// was compiled against — so the shipped manifest can never drift from the
// binary. Bump the KMP version in one place (<kit>/Package.swift) and it flows
// through here automatically.

import PackageDescription

let package = Package(
    name: "MaestroKit",
    platforms: [.tvOS(.v18), .iOS(.v18)],
    products: [
        // MaestroSentryLink and MaestroRiveLink are internal link shims:
        // consumers never import them, but their presence pulls the Sentry and
        // RiveRuntime dependencies into the app so the binary targets resolve.
        .library(name: "MaestroKit", targets: ["MaestroKitParamount", "MaestroCore", "paramountKit", "MaestroSentryLink", "MaestroRiveLink"])
    ],
    dependencies: [
        // Dynamic Sentry product so MaestroCore's `@rpath/Sentry.framework`
        // reference resolves to a single shared copy (no static bake-in, no
        // duplicate-symbol collision with a host app that also uses Sentry).
        .package(url: "https://github.com/getsentry/sentry-cocoa", .upToNextMajor(from: "9.19.1")),
        // RiveRuntime renders MaestroKit's overlays. Pinned to the exact version
        // the shipped binaries were compiled against.
        .package(url: "https://github.com/rive-app/rive-ios", exact: "6.21.0"),
    ],
    targets: [
        .binaryTarget(name: "MaestroKitParamount", path: "Frameworks/MaestroKitParamount.xcframework.zip"),
        .binaryTarget(name: "MaestroCore", path: "Frameworks/MaestroCore.xcframework.zip"),
        .binaryTarget(
            name: "paramountKit",
            url: "https://github.com/lessthan3/MaestroKit.android/releases/download/paramountKit-4.0.29.296/paramountKit-4.0.29.296.zip",
            checksum: "9d2c42818f518aba7f40002a47fb92404aef13ae5ff100a860a634ba189572bc"
        ),
        // Internal link shim (source target): pulls the dynamic Sentry framework
        // into the product so MaestroCore's telemetry resolves at runtime. Its
        // source ships inside the release zip at the path below.
        .target(
            name: "MaestroSentryLink",
            dependencies: [
                .product(name: "Sentry-Dynamic", package: "sentry-cocoa"),
            ],
            path: "MaestroKitParamountPackage/Sources/MaestroSentryLink"
        ),
        // Internal link shim (source target): pulls RiveRuntime into the product
        // so the kit binary's `import RiveRuntime` resolves and links. Its source
        // ships inside the release zip at the path below.
        .target(
            name: "MaestroRiveLink",
            dependencies: [
                .product(name: "RiveRuntime", package: "rive-ios"),
            ],
            path: "MaestroKitParamountPackage/Sources/MaestroRiveLink"
        )
    ]
)
