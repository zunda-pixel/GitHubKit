//
//  Payload.swift
//

import Foundation

extension Event {
  public enum Payload: Codable, Sendable, Hashable {
    case push(
      repositoryID: Int,
      pushID: Int,
      size: Int,
      distinctSize: Int,
      ref: String,
      head: String,
      before: String,
      commits: [Commit]
    )
    case pullRequest(action: RepositoryAction, number: Int, pullRequest: PullRequest)
    case create(
      ref: String?,
      refType: String,
      masterBranch: String,
      description: String?,
      pusherType: String
    )
    case issueComment(action: CommentAction, issue: Issue, comment: Issue.Comment)
    case issue(action: RepositoryAction, issue: Issue)
    case watch(action: WatchAction)
    case fork(repository: GitHubData.Repository)
    case delete(ref: String, refType: String, pusherType: String)
    case gollum(pages: [Page])
    case pullRequestReview(
      action: CommentAction,
      review: PullRequest.Review,
      pullRequest: PullRequest
    )
    case pullRequestReviewComment(
      action: CommentAction,
      comment: PullRequest.Comment,
      pullRequest: PullRequest
    )
    case release(action: ReleaseAction, release: Release)
    case commitComment(comment: Commit.Comment)
    case publicEvent
    case member(action: MemeberAction, member: GitHubData.User)

    enum CodingKeys: String, CodingKey {
      case repositoryID = "repository_id"
      case pushID = "push_id"
      case size
      case distinctSize = "distinct_size"
      case ref
      case head
      case before
      case commits
      case action
      case number
      case pullRequest = "pull_request"
      case refType = "ref_type"
      case masterBranch = "master_branch"
      case description
      case pusherType = "pusher_type"
      case issue
      case comment
      case forkee
      case pages
      case review
      case release
      case member
      case type
    }

    public func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: Event.Payload.CodingKeys.self)
      switch self {
      case .commitComment(let comment):
        try container.encode(comment, forKey: .comment)
      case .create(let ref, let refType, let masterBranch, let description, let pusherType):
        try container.encode(ref, forKey: .ref)
        try container.encode(refType, forKey: .refType)
        try container.encode(masterBranch, forKey: .masterBranch)
        try container.encode(description, forKey: .description)
        try container.encode(pusherType, forKey: .pusherType)
      case .delete(let ref, let refType, let pusherType):
        try container.encode(ref, forKey: .ref)
        try container.encode(refType, forKey: .refType)
        try container.encode(pusherType, forKey: .pusherType)
      case .fork(let repository):
        try container.encode(repository, forKey: .forkee)
      case .gollum(let pages):
        try container.encode(pages, forKey: .pages)
      case .issue(let action, let issue):
        try container.encode(action, forKey: .action)
        try container.encode(issue, forKey: .issue)
      case .issueComment(let action, let issue, let comment):
        try container.encode(action, forKey: .action)
        try container.encode(issue, forKey: .issue)
        try container.encode(comment, forKey: .comment)
      case .member(let action, let member):
        try container.encode(action, forKey: .action)
        try container.encode(member, forKey: .member)
      case .push(
        let repositoryID, let pushID, let size, let distinctSize, let ref, let head, let before,
        let commits):
        try container.encode(repositoryID, forKey: .repositoryID)
        try container.encode(pushID, forKey: .pushID)
        try container.encode(size, forKey: .size)
        try container.encode(distinctSize, forKey: .distinctSize)
        try container.encode(ref, forKey: .ref)
        try container.encode(head, forKey: .head)
        try container.encode(before, forKey: .before)
        try container.encode(commits, forKey: .commits)
      case .pullRequest(let action, let number, let pullRequest):
        try container.encode(action, forKey: .action)
        try container.encode(number, forKey: .number)
        try container.encode(pullRequest, forKey: .pullRequest)
      case .watch(let action):
        try container.encode(action, forKey: .action)
      case .pullRequestReview(let action, let review, let pull):
        try container.encode(action, forKey: .action)
        try container.encode(review, forKey: .review)
        try container.encode(pull, forKey: .pullRequest)
      case .pullRequestReviewComment(let action, let comment, let pull):
        try container.encode(action, forKey: .action)
        try container.encode(comment, forKey: .comment)
        try container.encode(pull, forKey: .pullRequest)
      case .release(let action, let release):
        try container.encode(action, forKey: .action)
        try container.encode(release, forKey: .release)
      case .publicEvent:
        break
      }
    }

    public init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: Event.Payload.CodingKeys.self)
      let type = try container.decode(EventType.self, forKey: .type)
      try self.init(container: container, type: type)
    }

    init(container: KeyedDecodingContainer<Event.Payload.CodingKeys>, type: EventType) throws {
      switch type {
      case .push:
        let repositoryID = try container.decode(Int.self, forKey: .repositoryID)
        let pushID = try container.decode(Int.self, forKey: .pushID)
        let size = try container.decode(Int.self, forKey: .size)
        let distinctSize = try container.decode(Int.self, forKey: .distinctSize)
        let ref = try container.decode(String.self, forKey: .ref)
        let head = try container.decode(String.self, forKey: .head)
        let before = try container.decode(String.self, forKey: .before)
        let commits = try container.decode([Commit].self, forKey: .commits)
        self = .push(
          repositoryID: repositoryID,
          pushID: pushID,
          size: size,
          distinctSize: distinctSize,
          ref: ref,
          head: head,
          before: before,
          commits: commits
        )
      case .issueComment:
        let issue = try container.decode(Issue.self, forKey: .issue)
        let action = try container.decode(CommentAction.self, forKey: .action)
        let comment = try container.decode(Issue.Comment.self, forKey: .comment)
        self = .issueComment(
          action: action,
          issue: issue,
          comment: comment
        )
      case .issue:
        let issue = try container.decode(Issue.self, forKey: .issue)
        let action = try container.decode(RepositoryAction.self, forKey: .action)
        self = .issue(
          action: action,
          issue: issue
        )
      case .create:
        let masterBranch = try container.decode(String.self, forKey: .masterBranch)
        let ref = try container.decodeIfPresent(String.self, forKey: .ref)
        let refType = try container.decode(String.self, forKey: .refType)
        let pusherType = try container.decode(String.self, forKey: .pusherType)
        let description = try container.decodeIfPresent(String.self, forKey: .description)
        self = .create(
          ref: ref,
          refType: refType,
          masterBranch: masterBranch,
          description: description,
          pusherType: pusherType
        )
      case .delete:
        let pusherType = try container.decode(String.self, forKey: .pusherType)
        let ref = try container.decode(String.self, forKey: .ref)
        let refType = try container.decode(String.self, forKey: .refType)
        self = .delete(ref: ref, refType: refType, pusherType: pusherType)
      case .pullRequest:
        let pullRequest = try container.decode(PullRequest.self, forKey: .pullRequest)
        let action = try container.decode(RepositoryAction.self, forKey: .action)
        let number = try container.decode(Int.self, forKey: .number)
        self = .pullRequest(
          action: action,
          number: number,
          pullRequest: pullRequest
        )
      case .pullRequestReview:
        let action = try container.decode(CommentAction.self, forKey: .action)
        let review = try container.decode(PullRequest.Review.self, forKey: .review)
        let pullRequest = try container.decode(PullRequest.self, forKey: .pullRequest)
        self = .pullRequestReview(
          action: action,
          review: review,
          pullRequest: pullRequest
        )
      case .pullRequestReviewComment:
        let action = try container.decode(CommentAction.self, forKey: .action)
        let comment = try container.decode(PullRequest.Comment.self, forKey: .comment)
        let pullRequest = try container.decode(PullRequest.self, forKey: .pullRequest)
        self = .pullRequestReviewComment(
          action: action,
          comment: comment,
          pullRequest: pullRequest
        )
      case .release:
        let action = try container.decode(ReleaseAction.self, forKey: .action)
        let release = try container.decode(Release.self, forKey: .release)
        self = .release(
          action: action,
          release: release
        )
      case .watch:
        let action = try container.decode(WatchAction.self, forKey: .action)
        self = .watch(action: action)
      case .fork:
        let repository = try container.decode(GitHubData.Repository.self, forKey: .forkee)
        self = .fork(repository: repository)
      case .commitComment:
        let comment = try container.decode(Commit.Comment.self, forKey: .comment)
        self = .commitComment(comment: comment)
      case .gollum:
        let pages = try container.decode([Page].self, forKey: .pages)
        self = .gollum(pages: pages)
      case .publicEvent:
        self = .publicEvent
      case .member:
        let action = try container.decode(MemeberAction.self, forKey: .action)
        let member = try container.decode(GitHubData.User.self, forKey: .member)
        self = .member(action: action, member: member)
      }
    }
  }
}
