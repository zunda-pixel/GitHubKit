//
//  PullComment.swift
//

import Foundation
import Tagged

extension PullRequest {
  public struct Comment: Codable, Sendable, Hashable, Identifiable {
    public typealias ID = Tagged<Self, Int>
    public let id: ID
    public let nodeID: String
    public let pullRequestReviewID: Int
    public let url: URL
    public let body: String
    public let htmlURL: URL
    public let user: User
    public let createdAt: Date
    public let updatedAt: Date
    public let authorAssociation: AuthorAssociation
    public let reactions: Reaction
    public let path: String
    public let diffHunk: String
    public let commitID: String
    public let originalCommitID: String
    public let pullRequestURL: URL
    public let startLine: Int?
    public let originalStartLine: Int?
    public let startSide: String?
    public let line: Int?
    public let originalLine: Int
    public let side: String
    public let inReplyToID: Int?
    public let originalPosition: Int
    public let position: Int?
    public let subjectType: String

    public init(
      id: ID,
      nodeID: String,
      pullRequestReviewID: Int,
      url: URL,
      body: String,
      htmlURL: URL,
      user: User,
      createdAt: Date,
      updatedAt: Date,
      authorAssociation: AuthorAssociation,
      reactions: Reaction,
      path: String,
      diffHunk: String,
      commitID: String,
      originalCommitID: String,
      pullRequestURL: URL,
      startLine: Int?,
      originalStartLine: Int?,
      startSide: String?,
      line: Int?,
      originalLine: Int,
      side: String,
      inReplyToID: Int?,
      originalPosition: Int,
      position: Int?,
      subjectType: String
    ) {
      self.id = id
      self.nodeID = nodeID
      self.pullRequestReviewID = pullRequestReviewID
      self.url = url
      self.body = body
      self.htmlURL = htmlURL
      self.user = user
      self.createdAt = createdAt
      self.updatedAt = updatedAt
      self.authorAssociation = authorAssociation
      self.reactions = reactions
      self.path = path
      self.diffHunk = diffHunk
      self.commitID = commitID
      self.originalCommitID = originalCommitID
      self.pullRequestURL = pullRequestURL
      self.startLine = startLine
      self.originalStartLine = originalStartLine
      self.startSide = startSide
      self.line = line
      self.originalLine = originalLine
      self.side = side
      self.inReplyToID = inReplyToID
      self.originalPosition = originalPosition
      self.position = position
      self.subjectType = subjectType
    }

    enum CodingKeys: String, CodingKey {
      case id
      case nodeID = "node_id"
      case pullRequestReviewID = "pull_request_review_id"
      case url
      case body
      case htmlURL = "html_url"
      case user
      case createdAt = "created_at"
      case updatedAt = "updated_at"
      case authorAssociation = "author_association"
      case reactions
      case path
      case diffHunk = "diff_hunk"
      case commitID = "commit_id"
      case originalCommitID = "original_commit_id"
      case pullRequestURL = "pull_request_url"
      case startLine = "start_line"
      case originalStartLine = "original_start_line"
      case startSide = "start_side"
      case line
      case originalLine = "original_line"
      case side
      case inReplyToID = "in_reply_to_id"
      case originalPosition = "original_position"
      case position
      case subjectType = "subject_type"
    }
  }
}
