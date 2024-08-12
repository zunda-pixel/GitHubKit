//
//  PullRequest.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// Get a pull request
  /// https://docs.github.com/en/rest/pulls/pulls?apiVersion=2022-11-28#get-a-pull-request
  /// - Parameters:
  ///   - ownerID: The account owner of the repository. The name is not case sensitive.
  ///   - repositoryName: The name of the repository without the .git extension. The name is not case sensitive.
  ///   - pullNumber: The number that identifies the pull request.
  /// - Returns: Pull
  public func pullRequest(
    ownerID: String,
    repositoryName: String,
    pullNumber: Int
  ) async throws -> PullRequest {
    let path = "/repos/\(ownerID)/\(repositoryName)/pulls/\(pullNumber)"
    let endpoint = baseURL.appending(path: path)
    let method: HTTPRequest.Method = .get

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      headerFields: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: nil)

    let pullRequest = try decode(PullRequest.self, from: data)

    return pullRequest
  }
}
