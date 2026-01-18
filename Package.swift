// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "swift-epub-standard",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26),
    ],
    products: [
        .library(
            name: "EPUB Standard",
            targets: ["EPUB Standard"]
        )
    ],
    dependencies: [
        .package(path: "../swift-w3c-epub"),
    ],
    targets: [
        .target(
            name: "EPUB Standard",
            dependencies: [
                .product(name: "W3C EPUB", package: "swift-w3c-epub"),
            ]
        ),
        .testTarget(
            name: "EPUB Standard Tests",
            dependencies: ["EPUB Standard"]
        )
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin].contains(target.type) {
    let existing = target.swiftSettings ?? []
    target.swiftSettings = existing + [
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility")
    ]
}
