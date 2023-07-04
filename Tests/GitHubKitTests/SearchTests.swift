//
//  SearchTests.swift
//

import Foundation

import XCTest
@testable import GitHubKit

final class SearchTests: XCTestCase {
  func testSearchUsers() async throws {
    let response = try await GitHubKit(type: .withoutToken).searchUsers(query: "zunda-pixel")
    print(response)
  }
}
