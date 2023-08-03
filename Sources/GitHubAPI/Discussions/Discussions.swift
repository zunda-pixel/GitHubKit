//
//  Discussions.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  public func discussions(
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
        # type: DiscussionConnection
        totalCount # Int!

        pageInfo {
          # type: PageInfo (from the public schema)
          startCursor
          endCursor
          hasNextPage
          hasPreviousPage
        }

        edges {
          # type: DiscussionEdge
          cursor
          node {
            # type: Discussion
            id
          }
        }

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
    comments(\(last.map { "last: \($0)"} ?? "") \(first.map { "first: \($0)"} ?? "")) {
      nodes \(commentFields())
    }
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
