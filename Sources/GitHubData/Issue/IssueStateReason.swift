//
//  IssueStateReason.swift
//

import Foundation

extension Issue {
  public enum StateReason: String, Codable, Sendable {
    case completed
    case reopened
    case notPlanned = "not_planned"
  }
}
