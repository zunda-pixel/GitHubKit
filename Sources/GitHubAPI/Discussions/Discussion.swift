//
//  Discussions.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  public func discussion(
    ownerID: String,
    repositoryName: String,
    discussionNumber: Int,
    itemFirst: Int
  ) async throws -> Discussion {
    try await self.discussion(
      ownerID: ownerID,
      repositoryName: repositoryName,
      discussionNumber: discussionNumber,
      itemFirst: itemFirst,
      itemLast: nil
    )
  }
  
  public func discussion(
    ownerID: String,
    repositoryName: String,
    discussionNumber: Int,
    itemLast: Int
  ) async throws -> Discussion {
    try await self.discussion(
      ownerID: ownerID,
      repositoryName: repositoryName,
      discussionNumber: discussionNumber,
      itemFirst: nil,
      itemLast: itemLast
    )
  }
  
  private func discussion(
    ownerID: String,
    repositoryName: String,
    discussionNumber: Int,
    itemFirst: Int? = nil,
    itemLast: Int? = nil
  ) async throws -> Discussion {
    let endpoint = baseURL.appending(path: "/graphql")
    let method: HTTPRequest.Method = .post
    
    let query = """
  query {
    repository(owner: "\(ownerID)", name: "\(repositoryName)") {
      discussion(number: \(discussionNumber)) \(discussionFields(first: itemFirst, last: itemLast))
    }
  }
  """
    
    let httpRequest = HTTPRequest(method: method, url: endpoint, queries: [:], headers: headers)
    var urlRequest = URLRequest(httpRequest: httpRequest)!
    urlRequest.httpBody = try JSONEncoder().encode(["query": query])
    
    let (data, _) = try await session.data(for: urlRequest)
    let response = try JSONDecoder.github.decode(DiscussionResponse.self, from: data)
    
    return response.discussion
  }
}
