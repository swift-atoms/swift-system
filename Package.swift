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
        .library(name: "System Primitives", targets: ["System Primitives"]),
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
            name: "System Primitives",
            dependencies: [
                .product(name: "Cardinal", package: "swift-cardinal"),
                .product(name: "Ordinal", package: "swift-ordinal"),
                .product(name: "Memory", package: "swift-memory"),
                .product(name: "Tagged", package: "swift-tagged"),
            ],
            path: "Sources/System Primitives"
        ),
        .target(
            name: "System Standard Library Integration",
            dependencies: [
                .target(name: "System Primitives"),
            ],
            path: "Sources/System Standard Library Integration"
        ),
        .target(
            name: "System Foundation Library Integration",
            dependencies: [
                .target(name: "System Primitives"),
                .target(name: "System Standard Library Integration"),
            ],
            path: "Sources/System Foundation Library Integration"
        ),
        .target(
            name: "System Test Support",
            dependencies: [
                .target(name: "System Primitives"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "System Tests",
            dependencies: [
                .target(name: "System Primitives"),
                .target(name: "System Test Support"),
                .target(name: "System Standard Library Integration"),
                .target(name: "System Foundation Library Integration"),
                .product(name: "Memory", package: "swift-memory"),
            ],
            path: "Tests/System Tests",
            linkerSettings: [.linkedLibrary("System.B", .when(platforms: [.macOS, .iOS, .tvOS, .watchOS, .visionOS]))]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    target.swiftSettings = (target.swiftSettings ?? []) + [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableExperimentalFeature("Lifetimes"),
        .treatAllWarnings(as: .error),
    ]
}
