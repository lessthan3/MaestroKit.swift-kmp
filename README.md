# MaestroKit

The Maestro SDK, delivered as a Swift Package. Supports **iOS 18+** and **tvOS 18+**.

## Install

In Xcode: **File → Add Package Dependencies…**, enter the repository URL, and
choose **Up to Next Major** from the latest version.

```
https://github.com/lessthan3/MaestroKit.swift-kmp
```

Or add it to your own `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/lessthan3/MaestroKit.swift-kmp", from: "1.0.0"),
],
targets: [
    .target(
        name: "YourApp",
        dependencies: [
            .product(name: "MaestroKit", package: "MaestroKit.swift-kmp"),
        ]
    ),
]
```

Xcode resolves the package and downloads the prebuilt frameworks automatically —
there's nothing else to link or embed.

### Preview builds

Prerelease versions (`1.2.0-beta.1` and the like) aren't picked up by `from:` —
Swift Package Manager skips prerelease tags. To try one, point at the branch of
the same name:

```swift
.package(url: "https://github.com/lessthan3/MaestroKit.swift-kmp", branch: "1.2.0-beta.1"),
```

Move back to `from:` once the final version ships.

## Quick start

```swift
import MaestroKit

// Once, early in your app's lifecycle:
await MaestroManager.shared.configure(
    siteID: "YOUR_SITE_ID",
    showHelloWorld: false,
    maestroWorkingEnvironment: .prod
)
```

Replace `YOUR_SITE_ID` with the site ID your Maestro contact provides.

## Designed panels

Some panels read an id from your app, such as the event being played. Pass it with
`setHostInput`; a panel that needs an id you haven't set stays on Loading:

```swift
eventInterface.setHostInput(name: "eventId", value: eventID)
```

Report the moment the player shows as wall-clock time, in UTC epoch seconds (for example an
HLS program date time), never the stream position. Panels that follow the game use it to show
the state at that moment:

```swift
eventInterface.updatePlayerTimeCode(timeCode: programDateTime.timeIntervalSince1970)
```

Every press on a designed panel reaches your `MaestroEventDelegate` as `onPanelAction(action:)`,
passed through as the SDK received it. The SDK has already handled the press and recorded its
analytics.

```swift
func onPanelAction(action: PanelAction) {
    // action.action.kind names the action, such as "link", "navigate" or "emit"
}
```

## Release notes

Each version's changes are on the repo's
[Releases](https://github.com/lessthan3/MaestroKit.swift-kmp/releases) page.
