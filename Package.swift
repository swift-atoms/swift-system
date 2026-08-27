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
            name: "System Standard Library Integration",
            targets: ["System Standard Library Integration"]
        ),
        .library(
            name: "System Apple Foundation Integration",
            targets: ["System Apple Foundation Integration"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "System",
            dependencies: []
        ),
        .target(
            name: "System Standard Library Integration",
            dependencies: ["System"]
        ),
        .target(
            name: "System Apple Foundation Integration",
            dependencies: [
                "System",
                "System Standard Library Integration",
            ]
        ),
        .testTarget(
            name: "System Tests",
            dependencies: ["System"]
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
