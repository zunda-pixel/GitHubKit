//
//  OwnedRepositories.swift
//

import Foundation
import HTTPTypes

public enum RepositoryAffiliationType: String, Sendable {
  case owner
  case collaborator
  case organizationMember = "organization_member"
}

public enum RepositorySearchVisibility: String, Sendable {
  case all
  case `public`
  case `private`
}

extension GitHubAPI {
  /// List repositories for the authenticated user
  /// https://docs.github.com/en/rest/repos/repos?apiVersion=2022-11-28#list-repositories-for-the-authenticated-user
  /// - Parameters:
  ///   - visibility: Limit results to repositories with the specified visibility.
  ///   - affiliation: Repository affiliation
  ///   - type: Limit results to repositories of the specified type. Will cause a 422 error if used in the same request as visibility or affiliation.
  ///   - sort: The property to sort the results by.
  ///   - direction: The order to sort by. Default: asc when using full_name, otherwise desc.
  ///   - since: Only show repositories updated after the given time.
  ///   - before: Only show repositories updated before the given time.
  ///   - perPage: The number of results per page (max 100).
  ///   - page: Page number of the results to fetch.
  /// - Returns: [Repository]
  public func ownedRepositories(
    visibility: RepositorySearchVisibility? = .all,
    affiliation: Set<RepositoryAffiliationType>? = [.collaborator, .organizationMember, .owner],
    type: RepositorySearchType? = .all,
    sort: RepositorySortType = .fullName,
    direction: OrderType = .asc,
    since: Date? = nil,
    before: Date? = nil,
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> [Repository] {
    let path = "/user/repos"
    let method: HTTPRequest.Method = .get

    var queries: [URLQueryItem] = [
      .init(name: "sort", value: sort.rawValue),
      .init(name: "direction", value: direction.rawValue),
      .init(name: "per_page", value: String(perPage)),
      .init(name: "page", value: String(page)),
    ]

    visibility.map { queries.append(.init(name: "visibility", value: $0.rawValue)) }
    affiliation.map {
      queries.append(.init(name: "affiliation", value: $0.map(\.rawValue).joined(separator: ",")))
    }
    type.map { queries.append(.init(name: "type", value: $0.rawValue)) }

    let formatter = ISO8601DateFormatter()
    since.map { queries.append(.init(name: "since", value: formatter.string(from: $0))) }
    before.map { queries.append(.init(name: "before", value: formatter.string(from: $0))) }

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
