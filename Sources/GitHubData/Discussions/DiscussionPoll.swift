//
//  DiscussionPoll.swift
//

import Foundation

extension Discussion {
  public struct Poll: Codable, Sendable, Hashable {
    public let question: String
    public let totalVoteCount: Int
    public let viewerCanVote: Bool
    
    public init(
      question: String,
      totalVoteCount: Int,
      viewerCanVote: Bool
    ) {
      self.question = question
      self.totalVoteCount = totalVoteCount
      self.viewerCanVote = viewerCanVote
    }
  }
}
