//
//  DiscussionsTests.swift
//

import Foundation

import XCTest
@testable import GitHubAPI

final class DiscussionsTests: XCTestCase {
  func testDiscussions() async throws {
    let discussions = try await api.discussions(
      ownerID: "zunda-pixel",
      repositoryName: "GitHubKit",
      last: 100,
      commentLast: 100
    )
    
    print(discussions)
  }
  
  func testDiscussion() async throws {
    let discussion = try await api.discussion(
      ownerID: "zunda-pixel",
      repositoryName: "GitHubKit",
      discussionNumber: 21,
      commentLast: 100
    )
    
    print(discussion)
  }
}
