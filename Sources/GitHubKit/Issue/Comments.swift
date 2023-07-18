//
//  File.swift
//  
//
//  Created by zunda on 2023/07/19.
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  public func comments(
    ownerID: String,
    repositoryName: String,
    issueNumber: Int,
    since: Date? = nil,
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> [Comment] {
    let path = "/repos/\(ownerID)/\(repositoryName)/issues/\(issueNumber)/comments"
    let endpoint = baseURL.appending(path: path)
    let method: HTTPRequest.Method = .get
    
    var queries: [String: String] = [
      "per_page": String(perPage),
      "page": String(page),
    ]
    
    since.map {
      let formatter = ISO8601DateFormatter()
      queries["since"] = formatter.string(from: $0)
    }
    
    let request = HTTPRequest(method: method, url: endpoint, queries: queries, headers: headers())
    
    let (data, _) = try await session.data(for: request)
    
    let decoder = JSONDecoder.github
    let comments = try decoder.decode([Comment].self, from: data)
    
    return comments
  }
  
  public func comments(
    ownerID: String,
    repositoryName: String,
    pullNumber: Int,
    since: Date? = nil,
    perPage: Int = 30,
    page: Int = 1
  ) async throws -> [Comment] {
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
