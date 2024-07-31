//
//  Discussions.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  public func discussion(
    ownerID: String,
    repositoryName: String,
    discussionNumber: Int
  ) async throws -> Discussion {
    let endpoint = baseURL.appending(path: "/graphql")
    let method: HTTPRequest.Method = .post

    let query = """
      query {
        repository(owner: "\(ownerID)", name: "\(repositoryName)") {
          discussion(number: \(discussionNumber)) \(discussionFields())
        }
      }
      """

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      queries: [:],
      headers: headers
    )

    let body = try JSONEncoder().encode(["query": query])

    let (data, _) = try await httpClient.execute(for: request, from: body)
    let response = try decode(DiscussionResponse.self, from: data)

    return response.discussion
  }
}
