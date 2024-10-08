//
//  DeleteProtectionTag.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// Delete a tag protection state for a repository
  /// https://docs.github.com/en/rest/repos/tags?apiVersion=2022-11-28#delete-a-tag-protection-state-for-a-repository
  /// - Parameters:
  ///   - ownerID: The account owner of the repository. The name is not case sensitive.
  ///   - repositoryName: The name of the repository without the .git extension. The name is not case sensitive.
  ///   - tagID: The unique identifier of the tag protection.
  public func deleteProtectionTag(
    ownerID: String,
    repositoryName: String,
    tagID: ProtectionTag.ID
  ) async throws {
    let path = "/repos/\(ownerID)/\(repositoryName)/tags/protection/\(tagID)"
    let method: HTTPRequest.Method = .delete
    let endpoint = baseURL.appending(path: path)

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      headerFields: headers
    )

    let (data, response) = try await httpClient.execute(for: request, from: nil)

    if response.status.code != 204 {
      throw RequestError.deleteProtectionTag(data: data)
    }
  }
}
