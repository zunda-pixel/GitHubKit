//
//  DiscussionStateReason.swift
//

import Foundation

extension Discussion {
  public enum StateReason: String, Sendable, Codable {
    case duplicate = "DUPLICATE"
    case outdated = "OUTDATED"
    case reOpened = "REOPENED"
    case resolved = "RESOLVED"
  }
}
