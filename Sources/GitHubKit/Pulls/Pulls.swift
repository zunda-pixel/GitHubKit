//
//  Pulls.swift
//

import Foundation
import HTTPTypes

public enum PullSortType: String {
  case created
  case updated
  case popularity
  case longRunning = "long-running"
}

public enum PullSearchType: String {
  case open
  case closed
  case all
}

extension GitHubAPI {
  func pulls(
    ownerID: String,
    repositoryName: String,
    state: PullSearchType = .open,
    head: String? = nil,
    branchName: String? = nil,
    sort: PullSortType = .created,
    direction: OrderType = .asc,
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> [Pull] {
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
    
    let request = HTTPRequest(method: method, url: endpoint, queries: queries, headers: headers())
    
    let (data, _) =  try await session.data(for: request)

    let decoder = JSONDecoder.github
    let pulls = try decoder.decode([Pull].self, from: data)
    
    return pulls
  }
}
