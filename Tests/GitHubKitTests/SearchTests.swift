//
//  SearchTests.swift
//

import Foundation

import XCTest
@testable import GitHubKit

final class SearchTests: XCTestCase {
  func testSearchUsers() async throws {
    let response = try await GitHubKit(type: authorizationType).searchUsers(query: "apple")
    print(response)
  }
  
  func testSearchRepositories() async throws {
    let response = try await GitHubKit(type: authorizationType).searchRepositories(query: "tetris+language:assembly&sort=stars&order=desc")
    print(response)
  }
}
