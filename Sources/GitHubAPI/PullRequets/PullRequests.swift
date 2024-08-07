//
//  PullRequests.swift
//

import Foundation
import HTTPTypes

public enum PullRequestSortType: String, Sendable {
  case created
  case updated
  case popularity
  case longRunning = "long-running"
}

public enum PullRequestSearchType: String, Sendable {
  case open
  case closed
  case all
}

extension GitHubAPI {
  /// List pull requests
  /// https://docs.github.com/en/rest/pulls/pulls?apiVersion=2022-11-28#list-pull-requests
  /// - Parameters:
  ///   - ownerID: The account owner of the repository. The name is not case sensitive.
  ///   - repositoryName: The name of the repository without the .git extension. The name is not case sensitive.
  ///   - state: Either open, closed, or all to filter by state.
  ///   - head: Filter pulls by head user or head organization and branch name in the format of user:ref-name or organization:ref-name. For example: github:new-script-format or octocat:test-branch.
  ///   - branchName: Filter pulls by base branch name. Example: gh-pages.
  ///   - sort: What to sort results by. popularity will sort by the number of comments. long-running will sort by date created and will limit the results to pull requests that have been open for more than a month and have had activity within the past month.
  ///   - direction: The direction of the sort. Default: desc when sort is created or sort is not specified, otherwise asc.
  ///   - perPage: The number of results per page (max 100).
  ///   - page: Page number of the results to fetch.
  /// - Returns: [PullRequest]
  public func pullRequests(
    ownerID: String,
    repositoryName: String,
    state: PullRequestSearchType = .open,
    head: String? = nil,
    branchName: String? = nil,
    sort: PullRequestSortType = .created,
    direction: OrderType = .asc,
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> [PullRequest] {
    let path = "/repos/\(ownerID)/\(repositoryName)/pulls"
    let endpoint = baseURL.appending(path: path)
    let method: HTTPRequest.Method = .get

    var queries: [String: String] = [
      "state": state.rawValue,
      "sort": sort.rawValue,
      "direction": direction.rawValue,
      "per_page": String(perPage),
      "page": String(page),
    ]

    head.map { queries["head"] = $0 }
    branchName.map { queries["base"] = $0 }

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      queries: queries,
      headers: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: nil)

    let pulls = try decode([PullRequest].self, from: data)

    return pulls
  }
}
