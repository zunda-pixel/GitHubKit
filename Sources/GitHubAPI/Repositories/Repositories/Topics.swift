//
//  Topics.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// Get all repository topics
  /// https://docs.github.com/en/rest/repos/repos?apiVersion=2022-11-28#get-all-repository-topics
  /// - Parameters:
  ///   - ownerID: The account owner of the repository. The name is not case sensitive.
  ///   - repositoryName: The name of the repository without the .git extension. The name is not case sensitive.
  ///   - perPage: The number of results per page (max 100).
  ///   - page: Page number of the results to fetch.
  /// - Returns: [String]
  public func topics(
    ownerID: String,
    repositoryName: String,
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> [String] {
    let path = "/repos/\(ownerID)/\(repositoryName)/topics"
    let endpoint = baseURL
      .appending(path: path)
      .appending(queryItems: [
        .init(name: "per_page", value: String(perPage)),
        .init(name: "page", value: String(page)),
      ])
    let method: HTTPRequest.Method = .get

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      headerFields: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: nil)

    let response = try decode(TopicsResponse.self, from: data)

    return response.names
  }
}
