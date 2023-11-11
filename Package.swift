// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "GitHubKit",
  platforms: [
    .iOS(.v16),
    .macOS(.v13),
  ],
  products: [
    .library(
      name: "GitHubAPI",
      targets: ["GitHubAPI"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-http-types", .upToNextMajor(from: "0.1.1")),
    .package(url: "https://github.com/pointfreeco/swift-tagged", .upToNextMajor(from: "0.10.0")),
  ],
  targets: [
    .target(
      name: "GitHubAPI",
      dependencies: [
        .target(name: "GitHubData"),
        .product(name: "HTTPTypes", package: "swift-http-types"),
        .product(name: "HTTPTypesFoundation", package: "swift-http-types"),
        .product(name: "Tagged", package: "swift-tagged"),
      ]
    ),
    .target(
      name: "GitHubData"
    ),
    .testTarget(
      name: "GitHubKitTests",
      dependencies: [
        .target(name: "GitHubAPI"),
      ]
    ),
  ]
)
