//
//  License.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// Get the license for a repository
  /// https://docs.github.com/en/rest/licenses/licenses?apiVersion=2022-11-28#get-the-license-for-a-repository
  /// - Parameters:
  ///   - ownerID: The account owner of the repository. The name is not case sensitive.
  ///   - repositoryName: The name of the repository without the .git extension. The name is not case sensitive.
  /// - Returns: License
  public func license(
    ownerID: String,
    repositoryName: String
  ) async throws -> License {
    let path = "/repos/\(ownerID)/\(repositoryName)/license"
    let endpoint = baseURL.appending(path: path)
    let method: HTTPRequest.Method = .get

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      queries: [:],
      headers: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: nil)

    let license = try decode(License.self, from: data)

    return license
  }
}
