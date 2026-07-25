# EPUB Standard

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Umbrella access to the W3C EPUB 3.3 specification in Swift — re-exports the EPUB standard types under a single import so consumers depend on one module rather than the underlying spec package directly.

## Installation

Add to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/swift-standards/swift-epub-standard.git", branch: "main")
]
```

Add the product to your target:

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "EPUB Standard", package: "swift-epub-standard")
    ]
)
```

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
