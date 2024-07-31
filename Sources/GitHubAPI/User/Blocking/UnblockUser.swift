//
//  UnblockUser.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// Unblock a user
  /// https://docs.github.com/en/rest/users/blocking?apiVersion=2022-11-28#unblock-a-user
  /// - Parameter userID: The handle for the GitHub user account.
  public func unBlock(userID: String) async throws {
    let path = "/user/blocks/\(userID)"
    let method: HTTPRequest.Method = .delete
    let endpoint = baseURL.appending(path: path)

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      queries: [:],
      headers: headers
    )

    let (_, response) = try await httpClient.execute(for: request, from: nil)

    if response.status.code == 204 { return }
    try verifyResponseStatus(response: response)
    throw RequestError.unknown
  }
}
