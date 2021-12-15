// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "liquid",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(name: "Liquid", targets: ["Liquid"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.50.0"),
        .package(url: "https://github.com/binarybirds/liquid-kit.git", from: "1.3.2"),
    ],
    targets: [
        .target(name: "Liquid", dependencies: [
             .product(name: "Vapor", package: "vapor"),
             .product(name: "LiquidKit", package: "liquid-kit"),
        ]),
        .testTarget(name: "LiquidTests", dependencies: ["Liquid"]),
    ]
)
