// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "liquid",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "Liquid",
            targets: [
                "Liquid"
            ]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/vapor/vapor",
            from: "4.68.0"
        ),
        .package(
            url: "https://github.com/binarybirds/liquid-kit",
            branch: "dev"
        ),
    ],
    targets: [
        .target(
            name: "Liquid",
            dependencies: [
                .product(
                    name: "Vapor",
                    package: "vapor"
                ),
                .product(
                    name: "LiquidKit",
                    package: "liquid-kit"
                ),
            ]
        ),
        .testTarget(
            name: "LiquidTests",
            dependencies: [
                .target(
                    name: "Liquid"
                )
            ]),
    ]
)
