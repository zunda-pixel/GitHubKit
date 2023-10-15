//
//  EventsTests.swift
//

import Foundation
import XCTest

@testable import GitHubAPI

final class EventsTests: XCTestCase {
  func testUserEvents() async throws {
    let events = try await api.events(
      userID: "zunda-pixel",
      perPage: 100,
      page: 1
    )
    
    print(events.count)
  }
}
