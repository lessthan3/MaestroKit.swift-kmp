// Internal link shim — do NOT import this from consumer code.
//
// MaestroKit / MaestroCore ship as prebuilt binary xcframeworks, and a binary
// target cannot declare package dependencies. This source target carries the
// `Sentry-Dynamic` dependency so MaestroCore's `@rpath/Sentry.framework`
// resolves in the consuming app.
@_exported import Sentry
