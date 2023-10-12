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
    let users = try await api.followers()
    print(users.count)
  }

  func testUserFollowers() async throws {
    let users = try await api.followers(userID: "zunda-pixel")
    print(users.count)
  }

  func testFollowing() async throws {
    let users = try await api.following()
    print(users.count)
  }
  
  func testUserFollowing() async throws {
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
  
  func testBlockingUsers() async throws {
    let blockingUsers = try await api.blockingUsers()
    print(blockingUsers)
  }
  
  func testBlockUser() async throws {
    try await api.block(userID: "zunda")
  }
  
  func testUnblockUser() async throws {
    try await api.unBlock(userID: "zunda")
  }
  
  func testIsBlockedByUser() async throws {
    let isBlocked = try await api.isBlocked(by: "zunda")
    print(isBlocked)
  }
  
  func testSocialAccounts() async throws {
    let socialAccounts = try await api.socialAccounts()
    print(socialAccounts)
  }
  
  func testUserSocialAccounts() async throws {
    let socialAccounts = try await api.socialAccounts(userID: "zunda")
    print(socialAccounts)
  }

  func testAddSocialAccounts() async throws {
    let urls: [URL] = [
      URL(string: "https://facebook.com/GitHub")!,
      URL(string: "https://www.youtube.com/@GitHub")!,
    ]
    
    let socialAccounts = try await api.addSocialAccount(socialURLs: urls)
    
    print(socialAccounts)
  }
  
  func testDeleteSocialAccounts() async throws {
    let urls: [URL] = [
      URL(string: "https://facebook.com/GitHub")!,
      URL(string: "https://www.youtube.com/@GitHub")!,
    ]
    
    try await api.deleteSocialAccount(socialURLs: urls)
  }
  
  func testIsFollowing() async throws {
    let isFollowing = try await api.isFollowing(userID: "swiftwasm")
    print(isFollowing)
  }
  
  func testIsFollowingFromTo() async throws {
    let isFollowing = try await api.isFollowing(from: "zunda-pixel", to: "swiftwasm")
    print(isFollowing)
  }
  
  func testFollow() async throws {
    try await api.follow(userID: "swiftwasm")
  }
  
  func testUnFollow() async throws {
    try await api.unFollow(userID: "swiftwasm")
  }
}
