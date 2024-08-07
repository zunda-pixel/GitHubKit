//
//  DiscussionPoll.swift
// DiscussionPollOption

import Foundation

extension Discussion.Poll {
  public struct Option: Codable, Sendable, Hashable {
    public let option: String
    public let totalVoteCount: Int
    public let viewerHasVoted: Bool

    public init(
      option: String,
      totalVoteCount: Int,
      viewerHasVoted: Bool
    ) {
      self.option = option
      self.totalVoteCount = totalVoteCount
      self.viewerHasVoted = viewerHasVoted
    }
  }
}
