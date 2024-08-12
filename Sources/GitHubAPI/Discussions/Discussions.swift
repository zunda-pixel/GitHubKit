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
    orderBy: DiscussionOrderField = .updatedAt,
    direction: OrderType = .desc
  ) async throws -> [Discussion] {
    try await self.discussions(
      ownerID: ownerID,
      repositoryName: repositoryName,
      first: first,
      last: nil,
      orderBy: orderBy,
      direction: direction
    )
  }

  public func discussions(
    ownerID: String,
    repositoryName: String,
    last: Int,
    orderBy: DiscussionOrderField = .updatedAt,
    direction: OrderType = .desc
  ) async throws -> [Discussion] {
    try await self.discussions(
      ownerID: ownerID,
      repositoryName: repositoryName,
      first: nil,
      last: last,
      orderBy: orderBy,
      direction: direction
    )
  }

  private func discussions(
    ownerID: String,
    repositoryName: String,
    first: Int? = nil,
    last: Int? = nil,
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
            orderBy: {field: \(orderBy.rawValue), direction: \(direction.rawValue.uppercased())}
          ) {
            nodes \(discussionFields())
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
    let response = try decode(DiscussionsResponse.self, from: data)

    return response.discussions
  }

  func discussionFields() -> String {
    """
    {
      id
      number
      url
      title
      updatedAt
      upvoteCount
      stateReason
      author \(userFields)
      createdAt
      activeLockReason
      authorAssociation
      body
      bodyHTML
      bodyText
      createdViaEmail
      databaseId
      editor \(userFields)
      includesCreatedEdit
      lastEditedAt
      locked
      viewerCanClose
      viewerCanDelete
      viewerCanReact
      viewerCanReopen
      viewerCanSubscribe
      viewerCanUpdate
      viewerCanUpvote
      viewerDidAuthor
      viewerHasUpvoted
      viewerSubscription
      poll \(pollFields)
      category \(categoryFields)
      comments {
        totalCount
      }
      labels(first: 100) {
        nodes \(labelFields)
      }
      reactions(first: 100) {
        nodes \(reactionFields)
      }
    }
    """
  }

  private var reactionFields: String {
    """
    {
      content
      createdAt
      databaseId
      user \(userFields)
    }
    """
  }

  private var labelFields: String {
    """
    {
      name
      color
      createdAt
      description
      isDefault
      resourcePath
      updatedAt
      url
    }
    """
  }
  private var categoryFields: String {
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

  private var pollFields: String {
    """
    {
      totalVoteCount
      question
      viewerCanVote
      viewerHasVoted
      options(first: 100) {
        nodes {
          option
          totalVoteCount
          viewerHasVoted
        }
      }
    }
    """
  }

  private var userFields: String {
    """
    {
      login
      avatarUrl
      resourcePath
      url
    }
    """
  }

  var commentFields: String {
    """
    {
      id
      author \(userFields)
      body
      bodyHTML
      bodyText
      createdAt
      createdViaEmail
      editor \(userFields)
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
