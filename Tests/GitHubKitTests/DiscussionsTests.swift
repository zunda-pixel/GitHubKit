//
//  DiscussionsTests.swift
//

import Foundation
import GitHubAPI
import Testing

@Test(arguments: [("nodejs", "node"), ("zunda-pixel", "GitHubKit")])
func discussions(ownerID: String, repositoryName: String) async throws {
  _ = try await api.discussions(
    ownerID: ownerID,
    repositoryName: repositoryName,
    last: 100
  )
}

@Test(arguments: [("zunda-pixel", "GitHubKit", 25)])
func discussion(ownerID: String, repositoryName: String, discussionNumer: Int) async throws {
  _ = try await api.discussion(
    ownerID: ownerID,
    repositoryName: repositoryName,
    discussionNumber: discussionNumer
  )
}

@Test(arguments: [("nodejs", "node", 37857)])
func discussionComments(ownerID: String, repositoryName: String, discussionNumer: Int) async throws
{
  _ = try await api.discussionComments(
    ownerID: ownerID,
    repositoryName: repositoryName,
    discussionNumber: discussionNumer,
    first: 100,
    after: nil
  )
}
