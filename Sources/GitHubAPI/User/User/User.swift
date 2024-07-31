//
//  User.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// Get a user
  /// https://docs.github.com/en/rest/users/users?apiVersion=2022-11-28#get-a-user
  /// - Returns: User
  public func user(userID: String) async throws -> User {
    let path = "/users/\(userID)"
    let method: HTTPRequest.Method = .get
    let endpoint = baseURL.appending(path: path)

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      queries: [:],
      headers: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: nil)

    let user = try decode(User.self, from: data)
    return user
  }
}
