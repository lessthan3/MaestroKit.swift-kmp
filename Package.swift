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
        // MaestroSentryLink is an internal link shim that carries the Sentry
        // runtime; consumers never import it, but its presence embeds
        // Sentry.framework into the app so MaestroCore's telemetry resolves.
        .library(name: "MaestroKit", targets: ["MaestroKitParamount", "MaestroCore", "paramountKit", "MaestroSentryLink"])
    ],
    dependencies: [
        // Dynamic Sentry product so MaestroCore's `@rpath/Sentry.framework`
        // reference resolves to a single shared copy (no static bake-in, no
        // duplicate-symbol collision with a host app that also uses Sentry).
        .package(url: "https://github.com/getsentry/sentry-cocoa", .upToNextMajor(from: "9.19.1")),
    ],
    targets: [
        .binaryTarget(name: "MaestroKitParamount", path: "Frameworks/MaestroKitParamount.xcframework.zip"),
        .binaryTarget(name: "MaestroCore", path: "Frameworks/MaestroCore.xcframework.zip"),
        .binaryTarget(
            name: "paramountKit",
            url: "https://github.com/lessthan3/MaestroKit.android/releases/download/paramountKit-4.0.25.273/paramountKit-4.0.25.273.zip",
            checksum: "bd39b1897f62353d7814a4a801937b5a76a61e2f2142317c8a5c110e678879bc"
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
        )
    ]
)
