//
//  IsFollowing.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// Check if a person is followed by the authenticated user
  /// https://docs.github.com/en/rest/users/followers?apiVersion=2022-11-28#check-if-a-person-is-followed-by-the-authenticated-user
  /// - Parameter userID: The handle for the GitHub user account.
  /// - Returns: Bool
  public func isFollowing(userID: String) async throws -> Bool {
    let path = "/user/following/\(userID)"
    let endpoint = baseURL.appending(path: path)
    let method: HTTPRequest.Method = .get

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      headerFields: headers
    )

    let (_, response) = try await httpClient.execute(for: request, from: nil)

    if response.status.code == 204 {
      return true
    } else if response.status.code == 404 {
      return false
    } else {
      try verifyResponseStatus(response: response)
    }

    throw RequestError.unknown
  }
}

extension GitHubAPI {
  /// Check if a user follows another user
  /// https://docs.github.com/en/rest/users/followers?apiVersion=2022-11-28#check-if-a-user-follows-another-user
  /// - Parameter userID: The handle for the GitHub user account.
  /// - Returns: Bool
  public func isFollowing(from fromUserID: String, to toUserID: String) async throws -> Bool {
    let path = "/users/\(fromUserID)/following/\(toUserID)"
    let endpoint = baseURL.appending(path: path)
    let method: HTTPRequest.Method = .get

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      headerFields: headers
    )

    let (_, response) = try await httpClient.execute(for: request, from: nil)

    if response.status.code == 204 {
      return true
    } else if response.status.code == 404 {
      return false
    } else {
      try verifyResponseStatus(response: response)
    }

    throw RequestError.unknown
  }
}
