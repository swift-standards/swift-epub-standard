// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-epub-standard",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "EPUB Standard",
            targets: ["EPUB Standard"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/swift-w3c/swift-w3c-epub.git", branch: "main")
    ],
    targets: [
        .target(
            name: "EPUB Standard",
            dependencies: [
                .product(name: "W3C EPUB", package: "swift-w3c-epub")
            ]
        ),
        .testTarget(
            name: "EPUB Standard Tests",
            dependencies: [
                "EPUB Standard"
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
