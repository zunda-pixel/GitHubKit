//
//  PullsTests.swift
//

import Foundation

import XCTest
@testable import GitHubAPI

final class PullsTests: XCTestCase {
  func testPulls() async throws {
    let api = GitHubAPI(type: authorizationType)
    
    let pulls = try await api.pulls(
      ownerID: "github",
      repositoryName: "explore",
      state: .all,
      sort: .created,
      direction: .asc,
      perPage: 100,
      page: 1
    )
    
    print(pulls)
  }
}
