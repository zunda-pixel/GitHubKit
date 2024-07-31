//
//  Forks.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// List forks
  /// https://docs.github.com/en/rest/repos/forks?apiVersion=2022-11-28#list-forks
  /// - Parameters:
  ///   - ownerID: The account owner of the repository. The name is not case sensitive.
  ///   - repositoryName: The name of the repository without the .git extension. The name is not case sensitive.
  ///   - sort: The sort order. stargazers will sort by star count.
  ///   - perPage: The number of results per page (max 100).
  ///   - page: Page number of the results to fetch.
  /// - Returns: [Repository]
  public func forks(
    ownerID: String,
    repositoryName: String,
    sort: ForksSearchSortType = .newest,
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> [Repository] {
    let path = "/repos/\(ownerID)/\(repositoryName)/forks"
    let endpoint = baseURL.appending(path: path)
    let method: HTTPRequest.Method = .get

    let queries: [String: String] = [
      "sort": sort.rawValue,
      "per_page": String(perPage),
      "page": String(page),
    ]

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      queries: queries,
      headers: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: nil)

    let repositories = try decode([Repository].self, from: data)

    return repositories
  }
}
