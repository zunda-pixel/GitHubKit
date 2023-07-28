//
//  NotificationsTests.swift
//

import Foundation

import XCTest
@testable import GitHubAPI

final class NotificationsTests: XCTestCase {
  func testNotifications() async throws {    
    let notifications = try await api.notifications(
      all: true,
      participating: false,
      since: nil,
      before: nil,
      perPage: 100,
      page: 1
    )
    
    print(notifications.map(\.subject.title))
  }
}
