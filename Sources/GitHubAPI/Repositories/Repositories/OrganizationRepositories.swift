//
//  OrganizationRepositories.swift
//
//
//  Created by zunda on 2023/07/26.
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// List organization repositories
  /// https://docs.github.com/en/rest/repos/repos?apiVersion=2022-11-28#list-organization-repositories
  /// - Parameters:
  ///   - organizationID: The organization name. The name is not case sensitive.
  ///   - type: Specifies the types of repositories you want returned.
  ///   - sort: The property to sort the results by
  ///   - direction: The order to sort by. Default: asc when using full_name, otherwise desc.
  ///   - perPage: The number of results per page (max 100).
  ///   - page: Page number of the results to fetch.
  /// - Returns: [Repository]
  public func repositories(
    organizationID: String,
    type: OrganizationRepositorySearchType = .all,
    sort: RepositorySortType = .created,
    direction: OrderType = .asc,
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> [Repository] {
    let path = "/orgs/\(organizationID)/repos"
    let endpoint = baseURL.appending(path: path)
    let method: HTTPRequest.Method = .get

    let queries: [String: String] = [
      "type": type.rawValue,
      "sort": sort.rawValue,
      "order": direction.rawValue,
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
