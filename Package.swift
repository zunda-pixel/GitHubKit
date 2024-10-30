// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "GitHubKit",
  platforms: [
    .iOS(.v17),
    .macOS(.v14),
  ],
  products: [
    .library(
      name: "GitHubAPI",
      targets: ["GitHubAPI"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-http-types", from: "1.3.0"),
    .package(url: "https://github.com/pointfreeco/swift-tagged", from: "0.10.0"),
    .package(url: "https://github.com/zunda-pixel/http-client", from: "0.3.0"),
  ],
  targets: [
    .target(
      name: "GitHubAPI",
      dependencies: [
        .target(name: "GitHubData"),
        .product(name: "HTTPTypes", package: "swift-http-types"),
        .product(name: "HTTPClient", package: "http-client"),
      ]
    ),
    .target(
      name: "GitHubData",
      dependencies: [
        .product(name: "Tagged", package: "swift-tagged")
      ]
    ),
    .testTarget(
      name: "GitHubKitTests",
      dependencies: [
        .target(name: "GitHubAPI")
      ]
    ),
  ]
)
