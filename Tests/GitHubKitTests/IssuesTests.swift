//
//  IssuesTests.swift
//

import Foundation

import XCTest
@testable import GitHubKit

final class IssuesTests: XCTestCase {
  func testIssues() async throws {
    let api = GitHubAPI(type: authorizationType)
    let response = try await api.issues(
      ownerID: "apple",
      repositoryName: "swift",
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
    print(response)
  }
}
