//
//  PullsTests.swift
//

import Foundation
import XCTest

@testable import GitHubAPI

final class PullsTests: XCTestCase {
  func testPull() async throws {
    let pullRequest = try await api.pullRequest(
      ownerID: "zunda-pixel",
      repositoryName: "GitHubKit",
      pullNumber: 1
    )

    print(pullRequest)
  }

  func testPulls() async throws {
    let pullRequests = try await api.pullRequests(
      ownerID: "github",
      repositoryName: "explore",
      state: .all,
      sort: .created,
      direction: .asc,
      perPage: 100,
      page: 1
    )

    print(pullRequests)
  }
}
