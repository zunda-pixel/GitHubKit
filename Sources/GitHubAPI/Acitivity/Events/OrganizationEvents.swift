//
//  OrganizationEvents.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// List organization events for the authenticated user
  /// This is the user's organization dashboard. You must be authenticated as the user to view this.
  /// https://docs.github.com/en/rest/activity/events?apiVersion=2022-11-28#list-organization-events-for-the-authenticated-user
  /// - Parameters:
  ///   - userID: The handle for the GitHub user account.
  ///   - organizationID: The organization name. The name is not case sensitive.
  ///   - perPage: The number of results per page (max 100).
  ///   - page: Page number of the results to fetch.
  /// - Returns: [Event]
  public func organizationEvents(
    userID: String,
    organizationID: String,
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> [Event] {
    let path = "/users/\(userID)/events/orgs/\(organizationID)"
    let endpoint =
      baseURL
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
