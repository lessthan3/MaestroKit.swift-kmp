// swift-tools-version: 6.2
// GENERATED — do not edit by hand.
//
// Rendered by scripts/render_package_manifest.sh during a tagged release build
// and committed to the public client SDK repo. Core, Kit, and KMP all ship as
// remote binaryTargets: the url points at the matching GitHub Release asset and
// the checksum is computed from that exact zip, so a resolved package can never
// drift from the binary it was built against.

import PackageDescription

let package = Package(
    name: "MaestroKit",
    platforms: [.tvOS(.v18), .iOS(.v18)],
    products: [
        // MaestroSentryLink and MaestroRiveLink are internal link shims:
        // consumers never import them, but their presence pulls the Sentry and
        // RiveRuntime dependencies into the app so the binary targets resolve.
        .library(name: "MaestroKit", targets: ["MaestroKit", "MaestroCore", "coreKit", "MaestroSentryLink", "MaestroRiveLink"])
    ],
    dependencies: [
        // Dynamic Sentry product so MaestroCore's `@rpath/Sentry.framework`
        // reference resolves to a single shared copy (no static bake-in, no
        // duplicate-symbol collision with a host app that also uses Sentry).
        .package(url: "https://github.com/getsentry/sentry-cocoa", .upToNextMajor(from: "9.19.1")),
        // RiveRuntime renders MaestroKit's overlays. The floor is the version the
        // binaries are compiled against; RiveRuntime is built for library evolution,
        // so later 6.x releases link against them.
        .package(url: "https://github.com/rive-app/rive-ios", .upToNextMajor(from: "6.21.0")),
    ],
    targets: [
        .binaryTarget(
            name: "MaestroKit",
            url: "https://github.com/lessthan3/MaestroKit.swift-kmp/releases/download/1.15.1/MaestroKit.xcframework.zip",
            checksum: "d65e94d25822963bcc8b1d6362534e0718205435cb379c6f5844b7912cef4129"
        ),
        .binaryTarget(
            name: "MaestroCore",
            url: "https://github.com/lessthan3/MaestroKit.swift-kmp/releases/download/1.15.1/MaestroCore.xcframework.zip",
            checksum: "f1b4e50eba74d7f85c9e6af01a323063eeb296af5c1547069f009681137ecbb7"
        ),
        .binaryTarget(
            name: "coreKit",
            url: "https://github.com/lessthan3/MaestroKit.android/releases/download/coreKit-4.0.42.617/coreKit-4.0.42.617.zip",
            checksum: "a4a7c7b561ac176fa6be4e3000896893aae1dc3e9adcba3a28702c87eb0b477a"
        ),
        // Internal link shim (source target): pulls the dynamic Sentry framework
        // into the product so MaestroCore's telemetry resolves at runtime. Its
        // source is committed to the public repo at the path below.
        .target(
            name: "MaestroSentryLink",
            dependencies: [
                .product(name: "Sentry-Dynamic", package: "sentry-cocoa"),
            ],
            path: "Sources/MaestroSentryLink"
        ),
        // Internal link shim (source target): pulls RiveRuntime into the product
        // so the kit binary's `import RiveRuntime` resolves and links. Its source
        // is committed to the public repo at the path below.
        .target(
            name: "MaestroRiveLink",
            dependencies: [
                .product(name: "RiveRuntime", package: "rive-ios"),
            ],
            path: "Sources/MaestroRiveLink"
        )
    ]
)
