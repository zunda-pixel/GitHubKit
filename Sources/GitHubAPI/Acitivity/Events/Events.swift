//
//  Events.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// List events for the authenticated user
  /// If you are authenticated as the given user, you will see your private events. Otherwise, you'll only see public events.
  /// https://docs.github.com/en/rest/activity/events?apiVersion=2022-11-28#list-events-for-the-authenticated-user
  /// - Parameters:
  ///   - userName: The handle for the GitHub user account.
  ///   - perPage: The number of results per page (max 100).
  ///   - page: Page number of the results to fetch.
  /// - Returns: [Event]
  public func events(
    userName: String,
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> [Event] {
    let path = "/users/\(userName)/events"
    let endpoint = baseURL.appending(path: path)
    let method: HTTPRequest.Method = .get

    let queries: [String: String] = [
      "per_page": String(perPage),
      "page": String(page),
    ]

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      queries: queries,
      headers: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: nil)

    let events = try decode([Event].self, from: data)

    return events
  }

  /// List public events for a user
  /// https://docs.github.com/en/rest/activity/events?apiVersion=2022-11-28#list-public-events-for-a-user
  /// - Parameters:
  ///   - userID: The handle for the GitHub user account.
  ///   - perPage: The number of results per page (max 100).
  ///   - page: Page number of the results to fetch.
  /// - Returns: [Event]
  public func publicEvents(
    userID: String,
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> [Event] {
    let path = "/users/\(userID)/events/public"
    let endpoint = baseURL.appending(path: path)
    let method: HTTPRequest.Method = .get

    let queries: [String: String] = [
      "per_page": String(perPage),
      "page": String(page),
    ]

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      queries: queries,
      headers: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: nil)

    let events = try decode([Event].self, from: data)

    return events
  }

  /// List public organization events
  /// https://docs.github.com/en/rest/activity/events?apiVersion=2022-11-28#list-public-organization-events
  /// - Parameters:
  ///   - organizationID: The organization name. The name is not case sensitive.
  ///   - perPage: The number of results per page (max 100).
  ///   - page: Page number of the results to fetch.
  /// - Returns: [Event]
  public func events(
    organizationID: String,
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> [Event] {
    let path = "/orgs/\(organizationID)/events"
    let endpoint = baseURL.appending(path: path)
    let method: HTTPRequest.Method = .get

    let queries: [String: String] = [
      "per_page": String(perPage),
      "page": String(page),
    ]

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      queries: queries,
      headers: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: nil)

    let events = try decode([Event].self, from: data)

    return events
  }
}
