//
//  ReceivedEvents.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// List events received by the authenticated user
  /// These are events that you've received by watching repos and following users. If you are authenticated as the given user, you will see private events. Otherwise, you'll only see public events.
  /// https://docs.github.com/en/rest/activity/events?apiVersion=2022-11-28#list-events-received-by-the-authenticated-user
  /// - Parameters:
  ///   - userID: The handle for the GitHub user account.
  ///   - perPage: The number of results per page (max 100).
  ///   - page: Page number of the results to fetch.
  /// - Returns: [Event]
  public func receivedEvents(
    userID: String,
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> [Event] {
    let path = "/users/\(userID)/received_events"
    let endpoint = baseURL
      .appending(path: path)
      .appending(queryItems: [
        .init(name: "per_page", value: String(perPage)),
        .init(name: "page", value: String(page)),
      ])
    let method: HTTPRequest.Method = .get

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      headerFields: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: nil)

    let events = try decode([Event].self, from: data)

    return events
  }

  /// List public events received by a user
  /// - Parameters:
  ///   - userID: The handle for the GitHub user account.
  ///   - perPage: The number of results per page (max 100).
  ///   - page: Page number of the results to fetch.
  /// - Returns: [Event]
  public func receivedPublicEvents(
    userID: String,
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> [Event] {
    let path = "/users/\(userID)/received_events/public"
    let endpoint = baseURL
      .appending(path: path)
      .appending(queryItems: [
        .init(name: "per_page", value: String(perPage)),
        .init(name: "page", value: String(page)),
      ])
    let method: HTTPRequest.Method = .get

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      headerFields: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: nil)

    let events = try decode([Event].self, from: data)

    return events
  }
}
