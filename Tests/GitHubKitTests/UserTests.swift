//
//  UserTests.swift
//

import Foundation
import GitHubAPI
import Testing

@Test
func me() async throws {
  _ = try await api.me()
}

@Test
func followers() async throws {
  _ = try await api.followers()
}

@Test(arguments: ["zunda-pixel", "swiftlang", "apple"])
func userFollowers(userID: String) async throws {
  _ = try await api.followers(userID: "zunda-pixel")
}

@Test
func following() async throws {
  _ = try await api.following()
}

@Test(arguments: ["zunda-pixel", "swiftlang", "apple"])
func userFollowing(userID: String) async throws {
  _ = try await api.following(userID: userID)
}

@Test(arguments: ["zunda-pixel", "swiftlang", "apple"])
func user(userID: String) async throws {
  _ = try await api.user(userID: userID)
}

@Test(arguments: ["new location1", "new location2"])
func updateMe(location: String) async throws {
  let updateUser = UpdateUser(location: location)

  try await api.update(me: updateUser)
}

@Test(arguments: ["swiftlang", "apple"])
func hovercard(userID: String) async throws {
  _ = try await api.hovercards(userID: userID)
}

@Test
func blockingUsers() async throws {
  _ = try await api.blockingUsers()
}

@Test(arguments: ["swiftlang", "apple"])
func blockUser(userID: String) async throws {
  try await api.block(userID: userID)
  try await api.unBlock(userID: userID)
}

@Test(arguments: ["swiftlang", "apple"])
func unblockUser(userID: String) async throws {
  try await api.unBlock(userID: userID)
}

@Test(arguments: ["swiftlang", "apple"])
func isBlockedByUser(userID: String) async throws {
  _ = try await api.isBlocked(by: userID)
}

@Test
func socialAccounts() async throws {
  _ = try await api.socialAccounts()
}

@Test(arguments: ["swiftlang", "apple"])
func userSocialAccounts(userID: String) async throws {
  _ = try await api.socialAccounts(userID: userID)
}

@Test(arguments: [
  [
    URL(string: "https://facebook.com/GitHub")!,
    URL(string: "https://www.youtube.com/@GitHub")!,
  ]
])
func addSocialAccounts(urls: [URL]) async throws {
  _ = try await api.addSocialAccount(socialURLs: urls)
}

@Test(arguments: [
  [
    URL(string: "https://facebook.com/GitHub")!,
    URL(string: "https://www.youtube.com/@GitHub")!,
  ]
])
func deleteSocialAccounts(urls: [URL]) async throws {
  _ = try await api.addSocialAccount(socialURLs: urls)
  try await api.deleteSocialAccount(socialURLs: urls)
}

@Test(arguments: ["swiftlang", "apple"])
func isFollowing(userID: String) async throws {
  _ = try await api.isFollowing(userID: userID)
}

@Test(arguments: [
  ("zunda-pixel", "swiftlang"),
  ("zunda-pixel", "apple")
])
func isFollowingFromTo(fromUserID: String, toUserID: String) async throws {
  _ = try await api.isFollowing(from: fromUserID, to: toUserID)
}

@Test(arguments: ["swiftlang", "apple"])
func follow(userID: String) async throws {
  try await api.follow(userID: userID)
}

@Test(arguments: ["swiftlang", "apple"])
func unFollow(userID: String) async throws {
  try await api.unFollow(userID: userID)
  try await api.follow(userID: userID)
}
