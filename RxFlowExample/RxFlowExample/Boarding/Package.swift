// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Boarding",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Boarding",
            targets: ["Boarding"]),
    ],
    dependencies: [

        .package(
            url: "https://github.com/ReactiveX/RxSwift.git",
            .exact("6.5.0")
        ),
        .package(
            url: "https://github.com/RxSwiftCommunity/RxDataSources.git",
            .exact("5.0.2")
        ),
        .package(
            url: "https://github.com/RxSwiftCommunity/RxSwiftExt.git",
            .exact("6.1.0")
        ),
        .package(
            url: "https://github.com/RxSwiftCommunity/RxFlow.git",
            .exact("2.12.4")
        ),
        .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1"))


    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Boarding",
            dependencies: []),
        .testTarget(
            name: "BoardingTests",
            dependencies: ["Boarding"]),
    ]
)
