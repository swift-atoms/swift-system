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
        .library(
            name: "System",
            targets: ["System"]
        ),
        .library(
            name: "System Test Support",
            targets: ["System Test Support"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-molecules/swift-cardinal.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-ordinal.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-memory.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "System",
            dependencies: [
                .product(name: "Cardinal", package: "swift-cardinal"),
                .product(name: "Ordinal", package: "swift-ordinal"),
                .product(name: "Memory Alignment", package: "swift-memory"),
            ]
        ),
        .target(
            name: "System Test Support",
            dependencies: [
                "System",
                .product(
                    name: "Cardinal Test Support",
                    package: "swift-cardinal"
                ),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "System Tests",
            dependencies: [
                "System",
                "System Test Support",
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
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
