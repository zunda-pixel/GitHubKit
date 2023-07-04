// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "GitHubKit",
  products: [
    .library(
      name: "GitHubKit",
      targets: ["GitHubKit"]
    ),
  ],
  targets: [
    .target(
      name: "GitHubKit"
    ),
    .testTarget(
      name: "GitHubKitTests",
      dependencies: ["GitHubKit"]
    ),
  ]
)
