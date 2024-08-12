//
//  Followers.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// List followers of the authenticated user
  /// https://docs.github.com/en/rest/users/followers?apiVersion=2022-11-28#list-followers-of-the-authenticated-user
  /// - Parameters:
  ///   - perPage: The number of results per page (max 100).
  ///   - page: Page number of the results to fetch.
  /// - Returns: [User]
  public func followers(
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> [User] {
    let path = "/user/followers"
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

    let users = try decode([User].self, from: data)

    return users
  }

  /// Lists the people following the specified user.
  /// https://docs.github.com/en/rest/users/followers?apiVersion=2022-11-28#list-followers-of-a-user
  /// - Parameters:
  ///   - userID: The handle for the GitHub user account.
  ///   - perPage: The number of results per page (max 100).
  ///   - page: Page number of the results to fetch.
  public func followers(
    userID: String,
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> [User] {
    let path = "/users/\(userID)/followers"
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

    let users = try decode([User].self, from: data)

    return users
  }
}
