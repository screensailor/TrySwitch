// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "TrySwitch",
    products: [
        .library(name: "TrySwitch", targets: ["TrySwitch"]),
    ],
    dependencies: [
        .package(url: "https://github.com/screensailor/Peek.git", .branch("master")),
    ],
    targets: [
        .target(name: "TrySwitch", dependencies: ["Peek"]),
    ]
)
