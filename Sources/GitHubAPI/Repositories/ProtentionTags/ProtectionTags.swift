//
//  ProtectionTag.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// List tag protection states for a repository
  /// https://docs.github.com/en/rest/repos/tags?apiVersion=2022-11-28#list-tag-protection-states-for-a-repository
  /// - Parameters:
  ///   - ownerID: The account owner of the repository. The name is not case sensitive.
  ///   - repositoryName: The name of the repository without the .git extension. The name is not case sensitive.
  /// - Returns: [Tag]
  public func protectionTags(
    ownerID: String,
    repositoryName: String
  ) async throws -> [ProtectionTag] {
    let path = "/repos/\(ownerID)/\(repositoryName)/tags/protection"
    let endpoint = baseURL.appending(path: path)
    let method: HTTPRequest.Method = .get

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      queries: [:],
      headers: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: nil)

    let tags = try decode([ProtectionTag].self, from: data)

    return tags
  }
}
