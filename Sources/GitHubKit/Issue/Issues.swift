//
//  Issues.swift
//

import Foundation
import HTTPMethod

public enum IssueSearchState: String {
  case open
  case closed
  case all
}

public enum IssueSearchSortType: String {
  case created
  case updated
  case comments
}

extension GitHubKit {
  /// List issues in a repository. Only open issues will be listed.
  /// - Parameters:
  ///   - ownerID: The account owner of the repository. The name is not case sensitive.
  ///   - repositoryName: The name of the repository without the .git extension. The name is not case sensitive.
  ///   - milestone: If an integer is passed, it should refer to a milestone by its number field. If the string * is passed, issues with any milestone are accepted. If the string none is passed, issues without milestones are returned.
  ///   - state: Indicates the state of the issues to return.
  ///   - assignee: Can be the name of a user. Pass in none for issues with no assigned user, and * for issues assigned to any user.
  ///   - creator: The user that created the issue.
  ///   - mentioned: A user that's mentioned in the issue.
  ///   - labels: A list of comma separated label names. Example: bug,ui,@high
  ///   - sort: What to sort results by.
  ///   - direction: The direction to sort the results by.
  ///   - since: Only show notifications updated after the given time.
  ///   - perPage: The number of results per page (max 100).
  ///   - page: Page number of the results to fetch.
  /// - Returns: [Issue]
  public func issues(
    ownerID: String,
    repositoryName: String,
    milestone: Int? = nil,
    state: IssueSearchState = .open,
    assignee: String? = nil,
    creator: String? = nil,
    mentioned: String? = nil,
    labels: [String] = [],
    sort: IssueSearchSortType = .created,
    direction: OrderType = .desc,
    since: Date? = nil,
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> [Issue] {
    let path = "/repos/\(ownerID)/\(repositoryName)/issues"
    let method: HTTPMethod = .get
    let endpoint = baseURL.appending(path: path)
    
    var queries: [String: String] = [
      "state": state.rawValue,
      "sort": sort.rawValue,
      "direction": direction.rawValue,
      "per_page": String(perPage),
      "page": String(page),
    ]
    
    milestone.map { queries["milestone"] = String($0) }
    assignee.map { queries["assignee"] = String($0) }
    creator.map { queries["creator"] = String($0) }
    mentioned.map { queries["mentioned"] = String($0) }
    if !labels.isEmpty { queries["labels"] = labels.joined(separator: ",") }
    since.map { queries["since"] = "\($0)" }
    
    let request = URLRequest(url: endpoint, method: method, queries: queries, headers: headers())
    
    let (data, _) = try await session.data(for: request)
    
    let decoder = JSONDecoder.github
    let response = try decoder.decode([Issue].self, from: data)
    
    return response
  }
}
