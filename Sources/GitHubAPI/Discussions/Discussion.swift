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
    commentFirst: Int? = nil,
    commentLast: Int? = nil
  ) async throws -> Discussion {
    let endpoint = baseURL.appending(path: "/graphql")
    let method: HTTPRequest.Method = .post
    
    let query = """
  query {
    repository(owner: "\(ownerID)", name: "\(repositoryName)") {
      discussion(number: \(discussionNumber)) \(discussionFields(first: commentFirst, last: commentLast))
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
  
  fileprivate func discussionFields(first: Int?, last: Int?) -> String {
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
  
  fileprivate func userFields() -> String {
    """
  {
    login
    avatarUrl
    resourcePath
    url
  }
  """
  }
  
  fileprivate func commentFields() -> String {
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
