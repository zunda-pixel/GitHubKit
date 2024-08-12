//
//  Following.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// List the people the authenticated user follows
  /// https://docs.github.com/en/rest/users/followers?apiVersion=2022-11-28#list-the-people-the-authenticated-user-follows
  /// - Parameters:
  ///   - perPage: The number of results per page (max 100).
  ///   - page: Page number of the results to fetch.
  /// - Returns: [User]
  public func following(
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> [User] {
    let path = "/user/following"
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

    let users = try decode([User].self, from: data)

    return users
  }

  /// Lists the people who the specified user follows.
  /// https://docs.github.com/en/rest/users/followers?apiVersion=2022-11-28#list-the-people-a-user-follows
  /// - Parameters:
  ///   - userID: The handle for the GitHub user account.
  ///   - perPage: The number of results per page (max 100).
  ///   - page: Page number of the results to fetch.
  public func following(
    userID: String,
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> [User] {
    let path = "/users/\(userID)/following"
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

    let users = try decode([User].self, from: data)

    return users
  }
}
