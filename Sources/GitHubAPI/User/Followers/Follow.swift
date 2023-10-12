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
      queries: [:],
      headers: headers
    )

    let (_, response) = try await session.data(for: request)

    if response.status.code == 204 {
      return
    }
    
    try verifyResopnseStatus(response: response)
    
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
      queries: [:],
      headers: headers
    )

    let (_, response) = try await session.data(for: request)

    if response.status.code == 204 {
      return
    }
    
    try verifyResopnseStatus(response: response)
    
    throw RequestError.unknown
  }
}
