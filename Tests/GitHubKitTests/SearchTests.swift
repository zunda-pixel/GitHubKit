//
//  File.swift
//  
//
//  Created by zunda on 2023/07/04.
//

import Foundation

import XCTest
@testable import GitHubKit

final class SearchTests: XCTestCase {
  let accessToken = "fasdfsadfasdfasdfasdfa"
  
  func testSearchUsers() async throws {
    let response = try await GitHubKit(accessToken: accessToken).searchUsers(query: "zunda-pixel")
    print(response)
  }
}
