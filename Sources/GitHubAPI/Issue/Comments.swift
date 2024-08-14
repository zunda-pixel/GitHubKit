//
//  Comments.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// List issue comments
  /// https://docs.github.com/en/rest/issues/comments?apiVersion=2022-11-28#list-issue-comments
  /// - Parameters:
  ///   - ownerID: The account owner of the repository. The name is not case sensitive.
  ///   - repositoryName: The name of the repository without the .git extension. The name is not case sensitive.
  ///   - issueNumber: The number that identifies the issue.
  ///   - since: Only show results that were last updated after the given time.
  ///   - perPage: The number of results per page (max 100).
  ///   - page: Page number of the results to fetch.
  /// - Returns: [Issue.Comment]
  public func comments(
    ownerID: String,
    repositoryName: String,
    issueNumber: Int,
    since: Date? = nil,
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> [Issue.Comment] {
    let path = "/repos/\(ownerID)/\(repositoryName)/issues/\(issueNumber)/comments"
    let method: HTTPRequest.Method = .get

    var queries: [URLQueryItem] = [
      .init(name: "per_page", value: String(perPage)),
      .init(name: "page", value: String(page)),
    ]

    since.map {
      let formatter = ISO8601DateFormatter()
      queries.append(.init(name: "since", value: formatter.string(from: $0)))
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

    let comments = try decode([Issue.Comment].self, from: data)

    return comments
  }

  /// List issue comments
  /// https://docs.github.com/en/rest/issues/comments?apiVersion=2022-11-28#list-issue-comments
  /// - Parameters:
  ///   - ownerID: The account owner of the repository. The name is not case sensitive.
  ///   - repositoryName: The name of the repository without the .git extension. The name is not case sensitive.
  ///   - pullNumber: The number that identifies the pull.
  ///   - since: Only show results that were last updated after the given time.
  ///   - perPage: The number of results per page (max 100).
  ///   - page: Page number of the results to fetch.
  /// - Returns: [Issue.Comment]
  public func comments(
    ownerID: String,
    repositoryName: String,
    pullNumber: Int,
    since: Date? = nil,
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> [Issue.Comment] {
    try await comments(
      ownerID: ownerID,
      repositoryName: repositoryName,
      issueNumber: pullNumber,
      since: since,
      perPage: perPage,
      page: page
    )
  }
}
