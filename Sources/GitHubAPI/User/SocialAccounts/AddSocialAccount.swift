//
//  AddSocialAccount.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// Add social accounts for the authenticated user
  /// https://docs.github.com/en/rest/users/social-accounts?apiVersion=2022-11-28#add-social-accounts-for-the-authenticated-user
  /// - Parameter socialURLs: Full URLs for the social media profiles to add.
  /// - Returns: [SocialAccount]
  public func addSocialAccount(socialURLs: [URL]) async throws -> [SocialAccount] {
    let path = "/user/social_accounts"
    let method: HTTPRequest.Method = .post
    let endpoint = baseURL.appending(path: path)

    let body = try JSONEncoder().encode(["account_urls": socialURLs])

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      headerFields: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: body)

    let socialAccounts = try decode([SocialAccount].self, from: data)

    return socialAccounts
  }
}
