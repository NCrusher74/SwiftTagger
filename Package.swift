// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftTagger",
    products: [
        .library(
            name: "SwiftTagger",
            targets: ["SwiftTagger"]),
    ],
    dependencies: [
        .package(
            name: "SwiftTaggerMP4",
            url: "https://github.com/NCrusher74/SwiftTaggerMP4",
            .branch("master")),
        .package(
            name: "SwiftTaggerID3",
            url: "https://github.com/NCrusher74/SwiftTaggerID3",
            .branch("master")),
    ],
    targets: [
        .target(
            name: "SwiftTagger",
            dependencies: [
            .product(name: "SwiftTaggerMP4", package: "SwiftTaggerMP4"),
            .product(name: "SwiftTaggerID3", package: "SwiftTaggerID3")],
        path: "Sources"),
        .testTarget(
            name: "SwiftTaggerTests",
            dependencies: ["SwiftTagger"]),
    ]
)
