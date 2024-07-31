//
//  IssuesTests.swift
//

import Foundation
import GitHubAPI
import Testing

@Test(arguments: [("zunda-pixel", "GitHubKit"), ("zunda-pixel", "GitBoard")])
func issue(ownerID: String, repositoryName: String) async throws {
  _ = try await api.issue(
    ownerID: ownerID,
    repositoryName: repositoryName,
    issueNumber: 1
  )
}

@Test(arguments: [("swiftlang", "swift"), ("zunda-pixel", "GitHubKit")])
func issues(ownerID: String, repositoryName: String) async throws {
  _ = try await api.issues(
    ownerID: ownerID,
    repositoryName: repositoryName,
    milestone: nil,
    state: .all,
    assignee: nil,
    creator: nil,
    mentioned: nil,
    labels: [],
    sort: .comments,
    direction: .asc,
    since: nil,
    perPage: 100,
    page: 1
  )
}

@Test(arguments: [("swiftlang", "swift", 67351), ("zunda-pixel", "GitHubKit", 1)])
func issueComments(ownerID: String, repositoryName: String, issueNumber: Int) async throws {
  _ = try await api.comments(
    ownerID: ownerID,
    repositoryName: repositoryName,
    issueNumber: issueNumber,
    perPage: 100,
    page: 1
  )
}

@Test(arguments: [("swiftlang", "swift", 69144), ("zunda-pixel", "GitHubKit", 1)])
func pullComments(ownerID: String, repositoryName: String, pullNumber: Int) async throws {
  _ = try await api.comments(
    ownerID: ownerID,
    repositoryName: repositoryName,
    pullNumber: pullNumber,
    perPage: 100,
    page: 1
  )
}
