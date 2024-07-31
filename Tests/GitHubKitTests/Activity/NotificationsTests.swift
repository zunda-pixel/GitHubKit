//
//  NotificationsTests.swift
//

import Foundation
import GitHubAPI
import Testing

func notifications() async throws {
  _ = try await api.notifications(
    all: true,
    participating: false,
    since: nil,
    before: nil,
    perPage: 100,
    page: 1
  )
}
