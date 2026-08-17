// swift-tools-version: 6.3.3

import PackageDescription

let package = Package(
    name: "swift-epub-standard",
    platforms: [
        .macOS("27"),
        .iOS("27"),
        .tvOS("27"),
        .watchOS("27"),
        .visionOS("27")
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
                "EPUB Standard",
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
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
