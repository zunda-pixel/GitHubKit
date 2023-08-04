//
//  Discussions.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  public func discussions(
    ownerID: String,
    repositoryName: String,
    first: Int,
    commentFirst: Int? = nil,
    orderBy: DiscussionOrderField = .updatedAt,
    direction: OrderType = .desc
  ) async throws -> [Discussion] {
    try await self.discussions(
      ownerID: ownerID,
      repositoryName: repositoryName,
      first: first,
      last: nil,
      commentFirst: commentFirst,
      commentLast: nil,
      orderBy: orderBy,
      direction: direction
    )
  }
  
  public func discussions(
    ownerID: String,
    repositoryName: String,
    first: Int,
    commentLast: Int? = nil,
    orderBy: DiscussionOrderField = .updatedAt,
    direction: OrderType = .desc
  ) async throws -> [Discussion] {
    try await self.discussions(
      ownerID: ownerID,
      repositoryName: repositoryName,
      first: first,
      last: nil,
      commentFirst: nil,
      commentLast: commentLast,
      orderBy: orderBy,
      direction: direction
    )
  }
  
  public func discussions(
    ownerID: String,
    repositoryName: String,
    last: Int,
    commentFirst: Int? = nil,
    orderBy: DiscussionOrderField = .updatedAt,
    direction: OrderType = .desc
  ) async throws -> [Discussion] {
    try await self.discussions(
      ownerID: ownerID,
      repositoryName: repositoryName,
      first: nil,
      last: last,
      commentFirst: commentFirst,
      commentLast: nil,
      orderBy: orderBy,
      direction: direction
    )
  }
  
  public func discussions(
    ownerID: String,
    repositoryName: String,
    last: Int,
    commentLast: Int? = nil,
    orderBy: DiscussionOrderField = .updatedAt,
    direction: OrderType = .desc
  ) async throws -> [Discussion] {
    try await self.discussions(
      ownerID: ownerID,
      repositoryName: repositoryName,
      first: nil,
      last: last,
      commentFirst: nil,
      commentLast: commentLast,
      orderBy: orderBy,
      direction: direction
    )
  }
  
  private func discussions(
    ownerID: String,
    repositoryName: String,
    first: Int? = nil,
    last: Int? = nil,
    commentFirst: Int? = nil,
    commentLast: Int? = nil,
    orderBy: DiscussionOrderField = .updatedAt,
    direction: OrderType = .desc
  ) async throws -> [Discussion] {
    let endpoint = baseURL.appending(path: "/graphql")
    let method: HTTPRequest.Method = .post
    
    let query = """
  query {
    repository(owner: "\(ownerID)", name: "\(repositoryName)") {
      discussions(
        \(first.map { "first: \($0),"} ?? "")
        \(last.map { "last: \($0),"} ?? "")
        orderBy: {field: \(orderBy.rawValue), direction: \(direction.rawValue.uppercased())}) {
        nodes \(discussionFields(first: commentFirst, last: commentLast))
      }
    }
  }
  """
    
    let httpRequest = HTTPRequest(method: method, url: endpoint, queries: [:], headers: headers)
    var urlRequest = URLRequest(httpRequest: httpRequest)!
    urlRequest.httpBody = try JSONEncoder().encode(["query": query])
    
    let (data, _) = try await session.data(for: urlRequest)
    let response = try JSONDecoder.github.decode(DiscussionsResponse.self, from: data)
    
    return response.discussions
  }
  
  func discussionFields(first: Int?, last: Int?) -> String {
    """
  {
    id
    number
    url
    title
    updatedAt
    upvoteCount
    stateReason
    author \(userFields())
    createdAt
    activeLockReason
    authorAssociation
    body
    bodyHTML
    bodyText
    createdViaEmail
    databaseId
    editor \(userFields())
    includesCreatedEdit
    lastEditedAt
    locked
    category \(categoryFields())
    comments(\(last.map { "last: \($0)"} ?? "") \(first.map { "first: \($0)"} ?? "")) {
      nodes \(commentFields())
    }
  }
  """
  }
  
  private func categoryFields() -> String {
    """
  {
    createdAt
    description
    emoji
    emojiHTML
    isAnswerable
    name
    slug
    updatedAt
  }
  """
  }
  private func userFields() -> String {
    """
  {
    login
    avatarUrl
    resourcePath
    url
  }
  """
  }
  
  private func commentFields() -> String {
    """
  {
    id
    author \(userFields())
    body
    bodyHTML
    bodyText
    createdAt
    createdViaEmail
    editor \(userFields())
    authorAssociation
    includesCreatedEdit
    lastEditedAt
    publishedAt
    updatedAt
    viewerDidAuthor
  }
  """
  }
}
