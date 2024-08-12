//
//  ReleasesTests.swift
//

import Foundation
import GitHubAPI
import Testing

@Test(arguments: [
  ("swiftlang", "swift", "swift-5.8.1-RELEASE")
])
func releaseWithTag(ownerID: String, repositoryName: String, releaseTag: String) async throws {
  _ = try await api.release(
    ownerID: ownerID,
    repositoryName: repositoryName,
    tag: releaseTag
  )
}

@Test(arguments: [
  ("swiftlang", "swift", 26_735_313)
])
func release(ownerID: String, repositoryName: String, releaseID: Int) async throws {
  _ = try await api.release(
    ownerID: ownerID,
    repositoryName: repositoryName,
    releaseID: releaseID
  )
}

@Test(arguments: [
  ("swiftlang", "swift"),
  ("swiftlang", "swift-format")
])
func releases(ownerID: String, repositoryName: String) async throws {
  _ = try await api.releases(
    ownerID: ownerID,
    repositoryName: repositoryName,
    perPage: 100,
    page: 1
  )
}
