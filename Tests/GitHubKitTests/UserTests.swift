//
//  UserTests.swift
//

import Foundation
import XCTest

@testable import GitHubAPI

final class UserTests: XCTestCase {
  func testMe() async throws {
    let user = try await api.me()
    print(user)
  }

  func testFollowers() async throws {
    let users = try await api.followers(userID: "zunda-pixel")
    print(users.count)
  }

  func testFollowing() async throws {
    let users = try await api.following(userID: "zunda-pixel")
    print(users.count)
  }

  func testUser() async throws {
    let user = try await api.user(userID: "zunda-pixel")
    print(user)
  }
  
  func testUpdateMe() async throws {
    let updateUser = UpdateUser(location: "new location")
    
    try await api.update(me: updateUser)
  }
  
  func testHovercard() async throws {
    let hovercards = try await api.hovercards(userID: "zunda")
    print(hovercards)
  }
}
