// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// swiftlint:disable all
let package = Package(
    name: "SparkComponentCard",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "SparkComponentCard",
            targets: ["SparkComponentCard"]
        ),
        .library(
            name: "SparkComponentCardTesting",
            targets: ["SparkComponentCardTesting"]
        )
    ],
    dependencies: [
       .package(
           // url: "https://github.com/leboncoin/spark-ios-common.git",
           path: "../spark-ios-common"
           // /*version*/ "0.0.1"..."999.999.999"
       ),
       .package(
           // url: "https://github.com/leboncoin/spark-ios-theming.git",
           path: "../spark-ios-theming"
           // /*version*/ "0.0.1"..."999.999.999"
       )
    ],
    targets: [
        .target(
            name: "SparkComponentCard",
            dependencies: [
                .product(
                    name: "SparkCommon",
                    package: "spark-ios-common"
                ),
                .product(
                    name: "SparkTheming",
                    package: "spark-ios-theming"
                )
            ],
            path: "Sources/Core"
        ),
        .target(
            name: "SparkComponentCardTesting",
            dependencies: [
                "SparkComponentCard",
                .product(
                    name: "SparkCommon",
                    package: "spark-ios-common"
                ),
                .product(
                    name: "SparkCommonTesting",
                    package: "spark-ios-common"
                ),
                .product(
                    name: "SparkThemingTesting",
                    package: "spark-ios-theming"
                ),
                .product(
                    name: "SparkTheme",
                    package: "spark-ios-theming"
                )
            ],
            path: "Sources/Testing"
        ),
        .testTarget(
            name: "SparkComponentCardUnitTests",
            dependencies: [
                "SparkComponentCard",
                "SparkComponentCardTesting",
                .product(
                    name: "SparkCommonTesting",
                    package: "spark-ios-common"
                ),
                .product(
                    name: "SparkThemingTesting",
                    package: "spark-ios-theming"
                )
            ],
            path: "Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentCardSnapshotTests",
            dependencies: [
                "SparkComponentCard",
                "SparkComponentCardTesting",
                .product(
                    name: "SparkCommonSnapshotTesting",
                    package: "spark-ios-common"
                ),
            ],
            path: "Tests/SnapshotTests"
        ),
    ]
)
