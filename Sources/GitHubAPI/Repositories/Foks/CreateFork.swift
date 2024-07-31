//
//  CreateFork.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// Create a fork for the authenticated user.
  /// https://docs.github.com/en/rest/repos/forks?apiVersion=2022-11-28#create-a-fork
  /// - Parameters:
  ///   - ownerID: The account owner of the repository. The name is not case sensitive.
  ///   - repositoryName: The name of the repository without the .git extension. The name is not case sensitive.
  ///   - organizationID: Optional parameter to specify the organization name if forking into an organization.
  ///   - name: When forking from an existing repository, a new name for the fork.
  ///   - defaultBranchOnly: When forking from an existing repository, fork with only the default branch.
  /// - Returns: Repository
  public func createFork(
    ownerID: String,
    repositoryName: String,
    organizationID: String? = nil,
    name: String,
    defaultBranchOnly: Bool
  ) async throws -> Repository {
    let path = "/repos/\(ownerID)/\(repositoryName)/forks"
    let endpoint = baseURL.appending(path: path)
    let method: HTTPRequest.Method = .post

    var body: [String: String] = [
      "name": name,
      "default_branch_only": defaultBranchOnly.description,
    ]

    organizationID.map {
      body["organization"] = $0
    }

    let bodyData = try JSONEncoder().encode(body)

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      queries: [:],
      headers: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: bodyData)

    let repository = try decode(Repository.self, from: data)

    return repository
  }
}
