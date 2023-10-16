//
//  BlockUser.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// Block a user
  /// https://docs.github.com/en/rest/users/blocking?apiVersion=2022-11-28#block-a-user
  /// - Parameter userID: The handle for the GitHub user account.
  public func block(userID: String) async throws {
    let path = "/user/blocks/\(userID)"
    let method: HTTPRequest.Method = .put
    let endpoint = baseURL.appending(path: path)

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      queries: [:],
      headers: headers
    )

    let (_, response) = try await session.data(for: request)

    if response.status.code == 204 { return }
    try verifyResopnseStatus(response: response)
    throw RequestError.unknown
  }
}
