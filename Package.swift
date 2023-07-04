// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "GitHubKit",
  platforms: [
    .macOS(.v14),
    .iOS(.v17)
  ],
  products: [
    .library(
      name: "GitHubKit",
      targets: ["GitHubKit"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/thii/HTTPMethod", .upToNextMajor(from: "0.1.0")),
    .package(url: "https://github.com/kishikawakatsumi/swift-power-assert", .upToNextMajor(from: "0.10.0")),
  ],
  targets: [
    .target(
      name: "GitHubKit",
      dependencies: [
        .product(name: "HTTPMethod", package: "HTTPMethod")
      ]
    ),
    .testTarget(
      name: "GitHubKitTests",
      dependencies: [
        "GitHubKit",
        .product(name: "PowerAssert", package: "swift-power-assert"),
      ]
    ),
  ]
)
