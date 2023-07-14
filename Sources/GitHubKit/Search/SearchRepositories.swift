//
//  SearchRepositories.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  public func searchRepositories(
    query: String,
    sort: RepositorySearchSortType? = nil,
    order: OrderType = .desc,
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> RepositoriesResponse {
    let path = "/search/repositories"
    let method: HTTPRequest.Method = .get
    let endpoint = baseURL.appending(path: path)
    
    var queries: [String: String] = [
      "q": query,
      "order": order.rawValue,
      "per_page": String(perPage),
      "page": String(page)
    ]
    
    sort.map { queries["sort"] = $0.rawValue }
    
    let request = HTTPRequest(
      method: method,
      url: endpoint,
      queries: queries,
      headers: headers()
    )
    
    let (data, _) = try await session.data(for: request)
    
    let decoder = JSONDecoder.github
    let response = try decoder.decode(RepositoriesResponse.self, from: data)
    
    return response
  }
}
