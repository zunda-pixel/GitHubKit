//
//  PullRequestsTests.swift
//

import Foundation
import GitHubAPI
import Testing

@Test(arguments: [
  ("swiftlang", "swift", 1),
  ("zunda-pixel", "GitHubKit", 1)
])
func pullRequest(ownerID: String, repositoryName: String, pullNumber: Int) async throws {
  _ = try await api.pullRequest(
    ownerID: ownerID,
    repositoryName: repositoryName,
    pullNumber: pullNumber
  )
}

@Test(arguments: [
  ("github", "explore"),
  ("swiftlang", "swift"),
  ("zunda-pixel", "GitHubKit")
])
func pullRequests(ownerID: String, repositoryName: String) async throws {
  _ = try await api.pullRequests(
    ownerID: ownerID,
    repositoryName: repositoryName,
    state: .all,
    sort: .created,
    direction: .asc,
    perPage: 100,
    page: 1
  )
}
