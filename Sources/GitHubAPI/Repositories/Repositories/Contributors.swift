//
//  Contributors.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// List repository contributors
  /// https://docs.github.com/ja/rest/repos/repos?apiVersion=2022-11-28#list-repository-contributors
  /// - Parameters:
  ///   - ownerID: The account owner of the repository. The name is not case sensitive.
  ///   - repositoryName: The name of the repository without the .git extension. The name is not case sensitive.
  ///   - perPage: The number of results per page (max 100).
  ///   - page: Page number of the results to fetch.
  /// - Returns: [User]
  public func contributors(
    ownerID: String,
    repositoryName: String,
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> [Contributor] {
    let path = "/repos/\(ownerID)/\(repositoryName)/contributors"
    let method: HTTPRequest.Method = .get
    let endpoint =
      baseURL
      .appending(path: path)
      .appending(queryItems: [
        .init(name: "anon", value: false.description),  // Set False to not get anonymous contributors. anonymous contributors has invalid data model
        .init(name: "per_page", value: String(perPage)),
        .init(name: "page", value: String(page)),
      ])

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      headerFields: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: nil)

    let contributors = try decode([Contributor].self, from: data)

    return contributors
  }
}
