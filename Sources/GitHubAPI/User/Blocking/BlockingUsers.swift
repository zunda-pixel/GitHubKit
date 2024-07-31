//
//  BlockingUsers.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// List users blocked by the authenticated user
  /// https://docs.github.com/en/rest/users/blocking?apiVersion=2022-11-28#list-users-blocked-by-the-authenticated-user
  /// - Parameters:
  ///   - perPage: The number of results per page (max 100).
  ///   - page: Page number of the results to fetch.
  /// - Returns: [User]
  public func blockingUsers(
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> [User] {
    let path = "/user/blocks"
    let method: HTTPRequest.Method = .get
    let endpoint = baseURL.appending(path: path)

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

    let users = try decode([User].self, from: data)

    return users
  }
}
