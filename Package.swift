// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-system",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(name: "System", targets: ["System"]),
        .library(name: "System Standard Library Integration", targets: ["System Standard Library Integration"]),
        .library(name: "System Foundation Library Integration", targets: ["System Foundation Library Integration"]),
        .library(name: "System Test Support", targets: ["System Test Support"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-cardinal.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-ordinal.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-memory.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-tagged.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "System",
            dependencies: [
                .product(name: "Cardinal", package: "swift-cardinal"),
                .product(name: "Ordinal", package: "swift-ordinal"),
                .product(name: "Memory", package: "swift-memory"),
                .product(name: "Tagged", package: "swift-tagged"),
            ],
            path: "Sources/System"
        ),
        .target(
            name: "System Standard Library Integration",
            dependencies: [
                .target(name: "System"),
            ],
            path: "Sources/System Standard Library Integration"
        ),
        .target(
            name: "System Foundation Library Integration",
            dependencies: [
                .target(name: "System"),
                .target(name: "System Standard Library Integration"),
            ],
            path: "Sources/System Foundation Library Integration"
        ),
        .target(
            name: "System Test Support",
            dependencies: [
                .target(name: "System"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "System Tests",
            dependencies: [
                .target(name: "System"),
                .target(name: "System Test Support"),
                .target(name: "System Standard Library Integration"),
                .target(name: "System Foundation Library Integration"),
                .product(name: "Memory", package: "swift-memory"),
            ],
            path: "Tests/System Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets {
    target.swiftSettings = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
}
