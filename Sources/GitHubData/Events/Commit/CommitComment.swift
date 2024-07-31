//
//  CommitComment.swift
//

import Foundation
import Tagged

extension Commit {
  public struct Comment: Codable, Sendable, Hashable, Identifiable {
    public typealias ID = Tagged<Self, Int>
    public let id: ID
    public let nodeID: String
    public let url: URL
    public let body: String
    public let htmlURL: URL
    public let user: GitHubData.User
    public let createdAt: Date
    public let updatedAt: Date
    public let authorAssociation: AuthorAssociation
    public let reactions: Reaction
    public let position: Int?
    public let line: Int?
    public let path: String?
    public let commitID: String

    public init(
      id: ID,
      nodeID: String,
      url: URL,
      body: String,
      htmlURL: URL,
      user: GitHubData.User,
      createdAt: Date,
      updatedAt: Date,
      authorAssociation: AuthorAssociation,
      reactions: Reaction,
      position: Int?,
      line: Int?,
      path: String?,
      commitID: String
    ) {
      self.id = id
      self.nodeID = nodeID
      self.url = url
      self.body = body
      self.htmlURL = htmlURL
      self.user = user
      self.createdAt = createdAt
      self.updatedAt = updatedAt
      self.authorAssociation = authorAssociation
      self.reactions = reactions
      self.position = position
      self.line = line
      self.path = path
      self.commitID = commitID
    }

    private enum CodingKeys: String, CodingKey {
      case id
      case nodeID = "node_id"
      case url
      case body
      case htmlURL = "html_url"
      case user
      case createdAt = "created_at"
      case updatedAt = "updated_at"
      case authorAssociation = "author_association"
      case reactions
      case position
      case line
      case path
      case commitID = "commit_id"
    }
  }
}
