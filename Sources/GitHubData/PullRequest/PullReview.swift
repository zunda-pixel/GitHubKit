//
//  PullReview.swift
//

import Foundation

extension PullRequest {
  public struct Review: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeID: String
    public let user: User
    public let body: String?
    public let commitID: String
    public let submittedAt: Date?
    public let state: String
    public let htmlURL: URL
    public let pullRequestURL: URL
    public let authorAssociation: AuthorAssociation

    private enum CodingKeys: String, CodingKey {
      case id
      case nodeID = "node_id"
      case user
      case body
      case commitID = "commit_id"
      case submittedAt = "submitted_at"
      case state
      case htmlURL = "html_url"
      case pullRequestURL = "pull_request_url"
      case authorAssociation = "author_association"
    }

    public init(
      id: Int,
      nodeID: String,
      user: User,
      body: String?,
      commitID: String,
      submittedAt: Date?,
      state: String,
      htmlURL: URL,
      pullRequestURL: URL,
      authorAssociation: AuthorAssociation
    ) {
      self.id = id
      self.nodeID = nodeID
      self.user = user
      self.body = body
      self.commitID = commitID
      self.submittedAt = submittedAt
      self.state = state
      self.htmlURL = htmlURL
      self.pullRequestURL = pullRequestURL
      self.authorAssociation = authorAssociation
    }
  }
}
