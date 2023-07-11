//
//  Issue.swift
//

import Foundation

public struct Issue: Codable, Sendable, Identifiable, Hashable {
  public let id: Int
  public let number: Int
  public let title: String
  public let body: String?
  public let bodyHTML: String?
  public let bodyText: String?
  public let user: User
  public let nodeID: String
  public let url: URL
  public let repositoryURL: URL
  public let labelsURL: URL
  public let commentsURL: URL
  public let eventsURL: URL
  public let htmlURL: URL
  public let labels: [Label]
  public let state: IssueState
  public let locked: Bool
  public let assignee: User?
  public let assignees: [User]
  public let milestone: Milestone?
  public let commentsCount: Int
  public let createdAt: Date
  public let updatedAt: Date
  public let closedAt: Date?
  public let authorAssociation: IssueAuthorAssociation
  public let activeLockReason: ActiveLockReason?
  public let draft: Bool?
  public let pullRequest: PullRequest?
  public let reactions: Reaction?
  public let timelineURL: URL?
  public let performedViaGitHubApp: PerformGitHubApp?
  public let stateReason: IssueStateReason?
  public let closedBy: User?
  public let repository: Repository?
  
  private enum CodingKeys: String, CodingKey {
    case id
    case number
    case title
    case body
    case bodyHTML = "body_html"
    case bodyText = "body_text"
    case user
    case nodeID = "node_id"
    case url
    case repositoryURL = "repository_url"
    case labelsURL = "labels_url"
    case commentsURL = "comments_url"
    case eventsURL = "events_url"
    case htmlURL = "html_url"
    case labels
    case state
    case locked
    case assignee
    case assignees
    case milestone
    case commentsCount = "comments"
    case createdAt = "created_at"
    case updatedAt = "updated_at"
    case closedAt = "closed_at"
    case authorAssociation = "author_association"
    case activeLockReason = "active_lock_reason"
    case draft
    case pullRequest = "pull_requests"
    case reactions
    case timelineURL = "timeline_url"
    case performedViaGitHubApp = "performed_via_github_app"
    case stateReason = "state_reason"
    case closedBy = "closed_by"
    case repository
  }
}
