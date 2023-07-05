//
//  SearchRepositories.swift
//

import Foundation
import HTTPMethod

extension GitHubKit {
  public func searchRepositories(
    query: String,
    sort: RepositorySortType? = nil,
    order: OrderType = .desc,
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> RepositoriesResponse {
    let path = "/search/repositories"
    let method: HTTPMethod = .get
    let endpoint = baseURL.appending(path: path)
    
    var queries: [String: String] = [
      "q": query.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!,
      "order": order.rawValue,
      "per_page": String(perPage),
      "page": String(page)
    ]
    
    sort.map { queries["sort"] = $0.rawValue }
    
    let request = URLRequest(
      url: endpoint,
      method: method,
      queries: queries,
      headers: headers()
    )
    
    let (data, _) = try await session.data(for: request)
    
    let decoder = JSONDecoder.github
    let response = try decoder.decode(RepositoriesResponse.self, from: data)
    
    return response
  }
}
