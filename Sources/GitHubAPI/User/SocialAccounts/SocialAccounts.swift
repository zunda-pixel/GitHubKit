//
//  SocialAccounts.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// List social accounts for the authenticated user
  /// https://docs.github.com/en/rest/users/social-accounts?apiVersion=2022-11-28#list-social-accounts-for-the-authenticated-user
  /// - Parameters:
  ///   - perPage: The number of results per page (max 100).
  ///   - page: Page number of the results to fetch.
  /// - Returns: [SocialAccount]
  public func socialAccounts(
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> [SocialAccount] {
    let path = "/user/social_accounts"
    let method: HTTPRequest.Method = .get
    let endpoint = baseURL
      .appending(path: path)
      .appending(queryItems: [
        .init(name: "per_page", value: String(perPage)),
        .init(name: "page", value: String(page)),
      ])

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      headerFields: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: nil)

    let socialAccounts = try decode([SocialAccount].self, from: data)

    return socialAccounts
  }

  /// List social accounts for a user
  /// https://docs.github.com/en/rest/users/social-accounts?apiVersion=2022-11-28#list-social-accounts-for-a-user
  /// - Parameters:
  ///   - userID: The handle for the GitHub user account.
  ///   - perPage: The number of results per page (max 100).
  ///   - page: Page number of the results to fetch.
  /// - Returns: [SocialAccount]
  public func socialAccounts(
    userID: String,
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> [SocialAccount] {
    let path = "/users/\(userID)/social_accounts"
    let method: HTTPRequest.Method = .get
    let endpoint = baseURL
      .appending(path: path)
      .appending(queryItems: [
        .init(name: "per_page", value: String(perPage)),
        .init(name: "page", value: String(page)),
      ])

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      headerFields: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: nil)

    let socialAccounts = try decode([SocialAccount].self, from: data)

    return socialAccounts
  }
}
