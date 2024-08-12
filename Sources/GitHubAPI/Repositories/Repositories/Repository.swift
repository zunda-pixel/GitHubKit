//
//  Repository.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// Get a repository
  /// https://docs.github.com/en/rest/repos/repos?apiVersion=2022-11-28#get-a-repository
  /// - Parameters:
  ///   - ownerID: The account owner of the repository. The name is not case sensitive.
  ///   - repositoryName: The name of the repository without the .git extension. The name is not case sensitive.
  /// - Returns: Repository
  public func repository(
    ownerID: String,
    repositoryName: String
  ) async throws -> Repository {
    let path = "/repos/\(ownerID)/\(repositoryName)"
    let method: HTTPRequest.Method = .get
    let endpoint = baseURL.appending(path: path)

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      headerFields: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: nil)

    let repository = try decode(Repository.self, from: data)

    return repository
  }
}
