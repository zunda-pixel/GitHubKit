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
      name: "GitHubKit",
      targets: ["GitHubKit"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-http-types", .upToNextMajor(from: "0.1.1")),
  ],
  targets: [
    .target(
      name: "GitHubKit",
      dependencies: [
        .product(name: "HTTPTypes", package: "swift-http-types"),
        .product(name: "HTTPTypesFoundation", package: "swift-http-types"),
      ]
    ),
    .testTarget(
      name: "GitHubKitTests",
      dependencies: [
        "GitHubKit",
      ]
    ),
  ]
)
