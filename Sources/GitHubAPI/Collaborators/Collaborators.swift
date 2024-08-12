//
//  Collaborators.swift
//

import Foundation
import HTTPTypes

public enum CollaboratorAffiliationType: String, Sendable {
  case outside
  case direct
  case all
}

extension GitHubAPI {
  /// List repository collaborators
  /// https://docs.github.com/en/rest/collaborators/collaborators?apiVersion=2022-11-28#list-repository-collaborators
  /// - Parameters:
  ///   - ownerID: The account owner of the repository. The name is not case sensitive.
  ///   - repositoryName: The name of the repository without the .git extension. The name is not case sensitive.
  ///   - affiliation: Filter collaborators returned by their affiliation. outside means all outside collaborators of an organization-owned repository. direct means all collaborators with permissions to an organization-owned repository, regardless of organization membership status. all means all collaborators the authenticated user can see.
  ///   - permission: Filter collaborators by the permissions they have on the repository. If not specified, all collaborators will be returned.
  ///   - perPage: The number of results per page (max 100).
  ///   - page: Page number of the results to fetch.
  /// - Returns: [Contributor]
  public func collaborators(
    ownerID: String,
    repositoryName: String,
    affiliation: CollaboratorAffiliationType = .all,
    permission: PermissionType? = nil,
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> [Collaborator] {
    let path = "/repos/\(ownerID)/\(repositoryName)/collaborators"
    let method: HTTPRequest.Method = .get

    var queries: [URLQueryItem] = [
      .init(name: "affiliation", value: affiliation.rawValue),
      .init(name: "per_page", value: String(perPage)),
      .init(name: "page", value: String(page)),
    ]

    permission.map {
      queries.append(.init(name: "permission", value: $0.rawValue))
    }

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

    let collaborators = try decode([Collaborator].self, from: data)

    return collaborators
  }
}
