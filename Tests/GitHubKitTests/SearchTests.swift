//
//  SearchTests.swift
//

import Foundation
import XCTest

@testable import GitHubAPI

final class SearchTests: XCTestCase {
  func testSearchUsers() async throws {
    let response = try await api.searchUsers(query: "apple")
    print(response)
  }

  func testSearchRepositories() async throws {
    let response = try await api.searchRepositories(
      query: "tetris+language:assembly&sort=stars&order=desc")
    print(response)
  }
}
