//
//  DeleteRepository.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// Delete a repository
  /// https://docs.github.com/en/rest/repos/repos?apiVersion=2022-11-28#delete-a-repository
  /// - Parameters:
  ///   - ownerID: The account owner of the repository. The name is not case sensitive.
  ///   - repositoryName: The name of the repository without the .git extension. The name is not case sensitive.
  public func deleteRepository(
    ownerID: String,
    repositoryName: String
  ) async throws {
    let path = "/repos/\(ownerID)/\(repositoryName)"
    let endpoint = baseURL.appending(path: path)
    let method: HTTPRequest.Method = .delete

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      queries: [:],
      headers: headers
    )

    let (data, httpResponse) = try await httpClient.execute(for: request, from: nil)

    if httpResponse.status.code != 204 {
      throw RequestError.deleteRepository(data: data)
    }
  }
}
