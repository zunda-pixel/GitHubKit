//
//  DiscussionComments.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  public func discussionComments(
    ownerID: String,
    repositoryName: String,
    discussionNumber: Int,
    first: Int,
    after: String?
  ) async throws -> (pageInfo: PageInfo, comments: [Discussion.Comment]) {
    return try await discussionComments(
      ownerID: ownerID,
      repositoryName: repositoryName,
      discussionNumber: discussionNumber,
      first: first,
      last: nil,
      after: after,
      before: nil
    )
  }

  public func discussionComments(
    ownerID: String,
    repositoryName: String,
    discussionNumber: Int,
    first: Int,
    before: String?
  ) async throws -> (pageInfo: PageInfo, comments: [Discussion.Comment]) {
    return try await discussionComments(
      ownerID: ownerID,
      repositoryName: repositoryName,
      discussionNumber: discussionNumber,
      first: first,
      last: nil,
      after: nil,
      before: before
    )
  }

  public func discussionComments(
    ownerID: String,
    repositoryName: String,
    discussionNumber: Int,
    last: Int,
    after: String?
  ) async throws -> (pageInfo: PageInfo, comments: [Discussion.Comment]) {
    return try await discussionComments(
      ownerID: ownerID,
      repositoryName: repositoryName,
      discussionNumber: discussionNumber,
      first: nil,
      last: last,
      after: after,
      before: nil
    )
  }

  public func discussionComments(
    ownerID: String,
    repositoryName: String,
    discussionNumber: Int,
    last: Int,
    before: String?
  ) async throws -> (pageInfo: PageInfo, comments: [Discussion.Comment]) {
    return try await discussionComments(
      ownerID: ownerID,
      repositoryName: repositoryName,
      discussionNumber: discussionNumber,
      first: nil,
      last: last,
      after: nil,
      before: before
    )
  }

  private func discussionComments(
    ownerID: String,
    repositoryName: String,
    discussionNumber: Int,
    first: Int?,
    last: Int?,
    after: String?,
    before: String?
  ) async throws -> (pageInfo: PageInfo, comments: [Discussion.Comment]) {
    let endpoint = baseURL.appending(path: "/graphql")
    let method: HTTPRequest.Method = .post

    let arguments: [String] = [
      "last": last.map { String($0) },
      "first": first.map { String($0) },
      "after": after.map { "\"\($0)\"" },
      "before": before.map { "\"\($0)\"" },
    ]
    .compactMapValues { $0 }
    .map { "\($0.key): \($0.value)" }

    let query = """
      query {
        repository(owner: "\(ownerID)", name: "\(repositoryName)") {
          discussion(number: \(discussionNumber)) {
            comments(\(arguments.joined(separator: ","))) {
              nodes \(commentFields)
              pageInfo {
                endCursor
                hasNextPage
                hasPreviousPage
                startCursor
              }
            }
          }
        }
      }
      """

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      headerFields: headers
    )

    let body = try JSONEncoder().encode(["query": query])

    let (data, _) = try await httpClient.execute(for: request, from: body)

    let response = try decode(DiscussionCommentResponse.self, from: data)

    return (response.pageInfo, response.comments)
  }
}

struct DiscussionCommentResponse: Sendable, Decodable {
  let comments: [Discussion.Comment]
  let pageInfo: PageInfo

  private enum CodingKeys: String, CodingKey {
    case data
    case repository
    case discussion
    case comments
    case nodes
    case pageInfo
  }

  init(from decoder: Decoder) throws {
    let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
    let repositoryContainer = try rootContainer.nestedContainer(
      keyedBy: CodingKeys.self, forKey: .data)
    let discussionContainer = try repositoryContainer.nestedContainer(
      keyedBy: CodingKeys.self, forKey: .repository)
    let commentsContainer = try discussionContainer.nestedContainer(
      keyedBy: CodingKeys.self, forKey: .discussion)
    let nodesContainer = try commentsContainer.nestedContainer(
      keyedBy: CodingKeys.self, forKey: .comments)
    self.comments = try nodesContainer.decode([Discussion.Comment].self, forKey: .nodes)
    self.pageInfo = try nodesContainer.decode(PageInfo.self, forKey: .pageInfo)
  }
}
