// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "Outlay",
    platforms: [
        .iOS(.v11),
        .tvOS(.v11)
    ],
    products: [
        .library(
            name: "Outlay",
            targets: ["Outlay"])
    ],
    targets: [
        .target(name: "Outlay")
    ]
)
