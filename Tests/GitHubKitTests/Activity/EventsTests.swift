//
//  EventsTests.swift
//

import Foundation
import GitHubAPI
import Testing

@Test(arguments: ["zunda-pixel", "swiftlang"])
func userEvents(userName: String) async throws {
  _ = try await api.events(
    userName: userName,
    perPage: 100,
    page: 1
  )
}

@Test(arguments: ["zunda-pixel", "swiftlang"])
func userPublicEvents(userID: String) async throws {
  _ = try await api.publicEvents(
    userID: userID,
    perPage: 100,
    page: 1
  )
}

@Test(arguments: ["apple"])
func organizationEvents(organizationID: String) async throws {
  _ = try await api.events(
    organizationID: organizationID,
    perPage: 100,
    page: 1
  )
}

@Test
func publicEvents() async throws {
  _ = try await api.publicEvents(
    perPage: 100,
    page: 1
  )
}

@Test(arguments: [
  ("zunda-pixel", "GitHubKit"),
  ("swiftlang", "swift")
])
func networkEvents(owner: String, repositoryName: String) async throws {
  _ = try await api.networkEvents(
    ownerID: "apple",
    repositoryName: "swift",
    perPage: 100,
    page: 1
  )
}

@Test(arguments: ["zunda-pixel", "swiftlang"])
func receivedEvents(userID: String) async throws {
  _ = try await api.receivedEvents(
    userID: userID,
    perPage: 100,
    page: 1
  )
}

@Test(arguments: ["zunda-pixel", "swiftlang"])
func receivedPublicEvents(userID: String) async throws {
  _ = try await api.receivedPublicEvents(
    userID: userID,
    perPage: 100,
    page: 1
  )
}
