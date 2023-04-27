// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "Aline",
    platforms: [
        .iOS(.v11),
        .tvOS(.v11)
    ],
    products: [
        .library(
            name: "Aline",
            targets: ["Aline"])
    ],
    targets: [
        .target(name: "Aline")
    ]
)
