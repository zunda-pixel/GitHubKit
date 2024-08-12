//
//  NetworkEvents.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// List public events for a network of repositories
  /// https://docs.github.com/en/rest/activity/events?apiVersion=2022-11-28#list-public-events-for-a-network-of-repositories
  /// - Parameters:
  ///   - perPage: The number of results per page (max 100).
  ///   - page: Page number of the results to fetch.
  /// - Returns: [Event]
  public func networkEvents(
    ownerID: String,
    repositoryName: String,
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> [Event] {
    let path = "/networks/\(ownerID)/\(repositoryName)/events"
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
