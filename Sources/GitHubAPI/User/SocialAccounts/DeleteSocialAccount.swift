//
//  DeleteSocialAccount.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// Delete social accounts for the authenticated user
  /// https://docs.github.com/en/rest/users/social-accounts?apiVersion=2022-11-28#delete-social-accounts-for-the-authenticated-user
  /// - Parameter socialURLs: Full URLs for the social media profiles to delete.
  public func deleteSocialAccount(socialURLs: [URL]) async throws {
    let path = "/user/social_accounts"
    let method: HTTPRequest.Method = .delete
    let endpoint = baseURL.appending(path: path)

    let body = try JSONEncoder().encode(["account_urls": socialURLs])

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      headerFields: headers
    )

    let (_, response) = try await httpClient.execute(for: request, from: body)

    if response.status.code == 204 { return }
    try verifyResponseStatus(response: response)
    throw RequestError.unknown
  }
}
