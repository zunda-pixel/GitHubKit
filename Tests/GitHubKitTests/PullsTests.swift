//
//  PullsTests.swift
//

import Foundation

import XCTest
@testable import GitHubAPI

final class PullsTests: XCTestCase {
  func testPull() async throws {
    let pull = try await api.pull(
      ownerID: "zunda-pixel",
      repositoryName: "GitHubKit",
      pullNumber: 1
    )
    
    print(pull)
  }
  
  func testPulls() async throws {
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
