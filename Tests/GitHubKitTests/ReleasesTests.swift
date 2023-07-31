//
//  ReleasesTests.swift
//

import Foundation

import XCTest
@testable import GitHubAPI

final class ReleasesTests: XCTestCase {
  func testReleases() async throws {
    let releases = try await api.releases(
      ownerID: "apple",
      repositoryName: "swift",
      perPage: 100,
      page: 1
    )
    
    print(releases.count)
  }
}
