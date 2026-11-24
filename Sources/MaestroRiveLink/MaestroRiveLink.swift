// Internal link shim — do NOT import this from consumer code.
//
// MaestroCore ships as a prebuilt binary xcframework that imports RiveRuntime,
// and a binary target cannot declare package dependencies. This source target
// carries the RiveRuntime dependency so it resolves and links in the consuming app.
@_exported import RiveRuntime
