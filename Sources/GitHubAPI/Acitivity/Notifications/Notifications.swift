//
//  Notifications.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// List notifications for the authenticated user
  /// https://docs.github.com/en/rest/activity/notifications?apiVersion=2022-11-28#list-notifications-for-the-authenticated-user
  /// - Parameters:
  ///   - all: If true, show notifications marked as read.
  ///   - participating: If true, only shows notifications in which the user is directly participating or mentioned.
  ///   - since: Only show results that were last updated after the given time.
  ///   - before: Only show notifications updated before the given time.
  ///   - perPage: The number of results per page (max 50).
  ///   - page: Page number of the results to fetch.
  /// - Returns: [Notification]
  public func notifications(
    all: Bool = false,
    participating: Bool = false,
    since: Date? = nil,
    before: Date? = nil,
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> [GitHubData.Notification] {
    let path = "/notifications"

    var queries: [URLQueryItem] = [
      .init(name: "all", value: all.description),
      .init(name: "participating", value: participating.description),
      .init(name: "per_page", value: String(perPage)),
      .init(name: "page", value: String(page)),
    ]
    let formatter = ISO8601DateFormatter()
    since.map {
      queries.append(.init(name: "since", value: formatter.string(from: $0)))
    }
    before.map {
      queries.append(.init(name: "before", value: formatter.string(from: $0)))
    }

    let endpoint =
      baseURL
      .appending(path: path)
      .appending(queryItems: queries)
    let method: HTTPRequest.Method = .get

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      headerFields: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: nil)

    let notifications = try decode([GitHubData.Notification].self, from: data)

    return notifications
  }
}
