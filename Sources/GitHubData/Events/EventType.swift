//
//  EventType.swift
//

import Foundation

public enum EventType: String, Codable, Sendable, Hashable {
  case pullRequestReviewComment = "PullRequestReviewCommentEvent"
  case pullRequestReview = "PullRequestReviewEvent"
  case issueComment = "IssueCommentEvent"
  case issue = "IssuesEvent"
  case push = "PushEvent"
  case create = "CreateEvent"
  case pullRequest = "PullRequestEvent"
  case delete = "DeleteEvent"
  case release = "ReleaseEvent"
  case watch = "WatchEvent"
  case fork = "ForkEvent"
  case commitComment = "CommitCommentEvent"
  case gollum = "GollumEvent"
  case publicEvent = "PublicEvent"
  case member = "MemberEvent"
}
