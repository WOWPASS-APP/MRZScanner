// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MRZScanner",
    platforms: [.iOS(.v13), .macOS(.v10_15)],
    products: [
        .library(
            name: "MRZScanner",
            targets: ["MRZScanner"]
        ),
    ],
    dependencies: [
        // Patched fork: Gregorian-calendar fix for MRZ date century inference (see MRZFieldFormatter).
        .package(url: "https://github.com/WOWPASS-APP/MRZParser.git", .revision("09791f10122e840fc05d89ed8b5596425c58985f"))
    ],
    targets: [
        .target(
            name: "MRZScanner",
            dependencies: ["MRZParser"]
        ),
        .testTarget(
            name: "MRZScannerTests",
            dependencies: ["MRZScanner"]),
    ]
)
