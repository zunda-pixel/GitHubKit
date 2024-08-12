//
//  me.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// Get the authenticated user
  /// https://docs.github.com/en/rest/users/users?apiVersion=2022-11-28#get-the-authenticated-user
  /// - Returns: User
  public func me() async throws -> User {
    let path = "/user"
    let method: HTTPRequest.Method = .get
    let endpoint = baseURL.appending(path: path)

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      headerFields: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: nil)

    let user = try decode(User.self, from: data)
    return user
  }
}
