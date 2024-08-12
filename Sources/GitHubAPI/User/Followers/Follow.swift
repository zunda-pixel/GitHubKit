//
//  Follow.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// Follow a user
  /// https://docs.github.com/en/rest/users/followers?apiVersion=2022-11-28#follow-a-user
  /// - Parameter userID: The handle for the GitHub user account.
  public func follow(userID: String) async throws {
    let path = "/user/following/\(userID)"
    let endpoint = baseURL.appending(path: path)
    let method: HTTPRequest.Method = .put

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      headerFields: headers
    )

    let (_, response) = try await httpClient.execute(for: request, from: nil)

    if response.status.code == 204 {
      return
    }

    try verifyResponseStatus(response: response)

    throw RequestError.unknown
  }
}

extension GitHubAPI {
  /// Unfollow a user
  /// https://docs.github.com/en/rest/users/followers?apiVersion=2022-11-28#unfollow-a-user
  /// - Parameter userID: The handle for the GitHub user account.
  public func unFollow(userID: String) async throws {
    let path = "/user/following/\(userID)"
    let endpoint = baseURL.appending(path: path)
    let method: HTTPRequest.Method = .delete

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      headerFields: headers
    )

    let (_, response) = try await httpClient.execute(for: request, from: nil)

    if response.status.code == 204 {
      return
    }

    try verifyResponseStatus(response: response)

    throw RequestError.unknown
  }
}
