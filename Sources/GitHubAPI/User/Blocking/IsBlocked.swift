//
//  IsBlocked.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// Check if a user is blocked by the authenticated user
  /// https://docs.github.com/en/rest/users/blocking?apiVersion=2022-11-28#check-if-a-user-is-blocked-by-the-authenticated-user
  /// - Parameter userID: The handle for the GitHub user account.
  func isBlocked(by userID: String) async throws -> Bool {
    let path = "/user/blocks/\(userID)"
    let method: HTTPRequest.Method = .get
    let endpoint = baseURL.appending(path: path)
    
    let request = HTTPRequest(
      method: method,
      url: endpoint,
      queries: [:],
      headers: headers
    )
    
    let (_, response) = try await session.data(for: request)
    
    if response.status.code == 204 {
      return true
    } else if response.status.code == 404 {
      return false
    } else {
      try verifyResopnseStatus(httpResponse: response)
    }
    
    throw RequestError.unknown
  }
}
