// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FileUrlExtensions",
    platforms: [
        .macOS(.v12),
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "FileUrlExtensions",
            targets: ["FileUrlExtensions"]),
    ],
    targets: [
        .target(
            name: "FileUrlExtensions"
        )
    ]
)
