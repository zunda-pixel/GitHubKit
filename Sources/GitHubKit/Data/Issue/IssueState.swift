//
//  IssueState.swift
//

import Foundation

extension Issue {
  public enum State: String, Codable, Sendable {
    case open
    case closed
  }
}
