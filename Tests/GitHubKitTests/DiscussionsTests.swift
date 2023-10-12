//
//  DiscussionsTests.swift
//

import Foundation
import XCTest

@testable import GitHubAPI

final class DiscussionsTests: XCTestCase {
  func testDiscussions() async throws {
    let discussions = try await api.discussions(
      ownerID: "nodejs",
      repositoryName: "node",
      last: 100
    )

    print(discussions)
  }

  func testDiscussion() async throws {
    let discussion = try await api.discussion(
      ownerID: "zunda-pixel",
      repositoryName: "GitHubkit",
      discussionNumber: 25
    )

    print(discussion)
  }

  func testDiscussionComments() async throws {
    let commentsResponse = try await api.discussionComments(
      ownerID: "nodejs",
      repositoryName: "node",
      discussionNumber: 37857,
      first: 100,
      after: nil
    )

    print(commentsResponse)
  }
}
