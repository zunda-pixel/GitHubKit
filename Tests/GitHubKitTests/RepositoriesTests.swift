//
//  RepositoriesTests.swift
//

import Foundation

import XCTest
@testable import GitHubKit

final class RepositoriesTests: XCTestCase {  
  func testRepositories() async throws {
    let api = GitHubAPI(type: authorizationType)
    let repositories = try await api.repositories(
      userID: "zunda-pixel",
      type: .all,
      sort: .updated,
      direction: .desc
    )
    print(repositories)
  }
}
