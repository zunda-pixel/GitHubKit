//
//  Teams.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// List repository teams
  /// https://docs.github.com/en/rest/repos/repos?apiVersion=2022-11-28#list-repository-teams
  /// - Parameters:
  ///   - ownerID: The account owner of the repository. The name is not case sensitive.
  ///   - repositoryName: The name of the repository without the .git extension. The name is not case sensitive.
  ///   - perPage: The number of results per page (max 100).
  ///   - page: Page number of the results to fetch.
  /// - Returns: [Team]
  public func teams(
    ownerID: String,
    repositoryName: String,
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> [Team] {
    let path = "/repos/\(ownerID)/\(repositoryName)/teams"
    let method: HTTPRequest.Method = .get
    let endpoint =
      baseURL
      .appending(path: path)
      .appending(queryItems: [
        .init(name: "per_page", value: String(perPage)),
        .init(name: "page", value: String(page)),
      ])

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      headerFields: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: nil)

    let teams = try decode([Team].self, from: data)

    return teams
  }
}
