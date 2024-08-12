//
//  Issue.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// Get an issue
  /// https://docs.github.com/en/rest/issues/issues?apiVersion=2022-11-28#get-an-issue
  /// - Parameters:
  ///   - ownerID: The account owner of the repository. The name is not case sensitive.
  ///   - repositoryName: The name of the repository without the .git extension. The name is not case sensitive.
  ///   - issueNumber: The number that identifies the issue.
  /// - Returns: Issue
  public func issue(
    ownerID: String,
    repositoryName: String,
    issueNumber: Int
  ) async throws -> Issue {
    let path = "/repos/\(ownerID)/\(repositoryName)/issues/\(issueNumber)"
    let endpoint = baseURL.appending(path: path)
    let method: HTTPRequest.Method = .get

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      headerFields: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: nil)

    let issue = try decode(Issue.self, from: data)

    return issue
  }
}
