//
//  ReleasesTests.swift
//

import Foundation

import XCTest
@testable import GitHubAPI

final class ReleasesTests: XCTestCase {
  func testReleaseWithTag() async throws {
    let release = try await api.release(
      ownerID: "apple",
      repositoryName: "swift",
      tag: "swift-5.8.1-RELEASE"
    )
    
    print(release)
  }
  
  func testRelease() async throws {
    let release = try await api.release(
      ownerID: "apple",
      repositoryName: "swift",
      releaseID: 26735313
    )
    
    print(release)
  }
  
  func testReleases() async throws {
    let releases = try await api.releases(
      ownerID: "apple",
      repositoryName: "swift",
      perPage: 100,
      page: 1
    )
    
    print(releases)
  }
}
