//
//  Repositories.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// List repositories for a user
  /// Lists public repositories for the specified user. Note: For GitHub AE, this endpoint will list internal repositories for the specified user.
  /// https://docs.github.com/en/rest/repos/repos?apiVersion=2022-11-28#list-repositories-for-a-user
  /// - Parameters:
  ///   - ownerID: The handle for the GitHub user account.
  ///   - type: Limit results to repositories of the specified type.
  ///   - sort: The property to sort the results by.
  ///   - direction: The order to sort by. Default: asc when using full_name, otherwise desc.
  ///   - perPage: The number of results per page (max 100).
  ///   - page: Page number of the results to fetch.
  /// - Returns: [Repository]
  public func repositories(
    ownerID: String,
    type: RepositorySearchType = .owner,
    sort: RepositorySortType = .fullName,
    direction: OrderType = .asc,
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> [Repository] {
    let path = "/users/\(ownerID)/repos"
    let method: HTTPRequest.Method = .get

    let queries: [URLQueryItem] = [
      .init(name: "type", value: type.rawValue),
      .init(name: "sort", value: sort.rawValue),
      .init(name: "direction", value: direction.rawValue),
      .init(name: "per_page", value: String(perPage)),
      .init(name: "page", value: String(page)),
    ]

    let endpoint =
      baseURL
      .appending(path: path)
      .appending(queryItems: queries)

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      headerFields: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: nil)

    let response = try decode([Repository].self, from: data)
    return response
  }
}
