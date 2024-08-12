//
//  SearchUsers.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// Find users via various criteria. This method returns up to 100 results
  /// https://docs.github.com/en/rest/search/search?apiVersion=2022-11-28#search-users
  /// - Parameter query: The query contains one or more search keywords and qualifiers. Qualifiers allow you to limit your search to specific areas of GitHub. The REST API supports the same qualifiers as the web interface for GitHub. To learn more about the format of the query, see Constructing a search query. See "Searching users" for a detailed list of qualifiers.
  /// - Parameter sort: Sorts the results of your query by number of followers or repositories, or when the person joined GitHub. Default: best match
  /// - Parameter order: Determines whether the first search result returned is the highest number of matches (desc) or lowest number of matches (asc). This parameter is ignored unless you provide sort.
  /// - Parameter perPage: The number of results per page (max 100).
  /// - Parameter page: Page number of the results to fetch.
  /// - Returns: UsersResponse
  public func searchUsers(
    query: String,
    sort: UserSortType? = nil,
    order: OrderType = .desc,
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> UsersResponse {
    let path = "/search/users"
    let method: HTTPRequest.Method = .get

    var queries: [URLQueryItem] = [
      .init(name: "q", value: query),
      .init(name: "order", value: order.rawValue),
      .init(name: "per_page", value: String(perPage)),
      .init(name: "page", value: String(page)),
    ]

    sort.map { queries.append(.init(name: "sort", value: $0.rawValue)) }

    let endpoint = baseURL
      .appending(path: path)
      .appending(queryItems: queries)
    
    let request = HTTPRequest(
      method: method,
      url: endpoint,
      headerFields: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: nil)

    let response = try decode(UsersResponse.self, from: data)

    return response
  }
}
