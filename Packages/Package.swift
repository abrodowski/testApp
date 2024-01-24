// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Main",
    platforms: [
        .iOS(.v17),
    ],
    products: [
        .singleTargetLibrary("AppFeature")
    ],
    dependencies: [
        .package(url: "https://github.com/krzysztofzablocki/Inject.git", exact: "1.2.3"),
        .package(url: "https://github.com/realm/SwiftLint", exact: "0.52.3"),
        .package(url: "https://github.com/krzysztofzablocki/LifetimeTracker.git", exact: "1.8.2"),
    ],
    targets: [
        .target(
            name: "AppFeature",
            dependencies: [
                "SharedViews",
                "SharedModels",
                "HomeFeature",
                "SettingsFeature",
                .product(name: "LifetimeTracker", package: "LifetimeTracker"),
            ]
        ),
        .testTarget(
            name: "AppFeatureTests",
            dependencies: [
                "AppFeature"
            ]
        ),
        .target(
            name: "HomeFeature",
            dependencies: [
                "SharedViews",
                "SharedModels",
            ]
        ),
        .testTarget(
            name: "HomeFeatureTests",
            dependencies: [
                "HomeFeature"
            ]
        ),
        .target(
            name: "SettingsFeature",
            dependencies: [
                "SharedViews",
                "SharedModels",
            ]
        ),
        .target(
            name: "SharedViews",
            dependencies: [
                .product(name: "Inject", package: "Inject"),
            ]
        ),
        .target(
            name: "SharedModels",
            dependencies: [
                .product(name: "LifetimeTracker", package: "LifetimeTracker"),
            ]
        ),
    ]
)

// Inject base plugins into each target
package.targets = package.targets.map { target in
    var plugins = target.plugins ?? []
    plugins.append(.plugin(name: "SwiftLintPlugin", package: "SwiftLint"))
    target.plugins = plugins
    return target
}

extension Product {
    static func singleTargetLibrary(_ name: String) -> Product {
        .library(name: name, targets: [name])
    }
}
