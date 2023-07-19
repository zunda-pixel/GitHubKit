//
//  UserTests.swift
//

import Foundation

import XCTest
@testable import GitHubKit

final class UserTests: XCTestCase {
  func testMe() async throws {
    let user = try await GitHubAPI(type: authorizationType).me()
    print(user)
  }
  
  func testFollowers() async throws {
    let users = try await GitHubAPI(type: authorizationType).followers(userID: "zunda-pixel")
    print(users.count)
  }
  
  func testFollowing() async throws {
    let users = try await GitHubAPI(type: authorizationType).following(userID: "zunda-pixel")
    print(users.count)
  }
}
