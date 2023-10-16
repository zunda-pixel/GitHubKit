//
//  EventsTests.swift
//

import Foundation
import XCTest

@testable import GitHubAPI

final class EventsTests: XCTestCase {
  func testUserEvents() async throws {
    let events = try await api.events(
      userName: "zunda-pixel",
      perPage: 100,
      page: 1
    )
    
    print(events.count)
  }

  func testUserPublicEvents() async throws {
    let events = try await api.publicEvents(
      userID: "zunda",
      perPage: 100,
      page: 1
    )

    print(events.count)
  }
  
  func testOrganizationEvents() async throws {
    let events = try await api.events(
      organizationID: "apple",
      perPage: 100,
      page: 1
    )
    
    print(events.count)
  }
  
  func testPublicEvents() async throws {
    let events = try await api.publicEvents(
      perPage: 100,
      page: 1
    )
    
    print(events.count)
  }
  
  func testNetworkEvents() async throws {
    let events = try await api.networkEvents(
      ownerID: "apple",
      repositoryName: "swift",
      perPage: 100,
      page: 1
    )
    
    print(events.count)
  }
  
  func testReceivedEvents() async throws {
    let events = try await api.receivedEvents(
      userID: "zunda-pixel",
      perPage: 100,
      page: 1
    )
    
    print(events.count)
  }
  
  func testReceivedPublicEvents() async throws {
    let events = try await api.receivedPublicEvents(
      userID: "zunda-pixel",
      perPage: 100,
      page: 1
    )
    
    print(events.count)
  }
}
