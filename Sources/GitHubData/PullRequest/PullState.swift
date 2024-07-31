//
//  PullState.swift
//

import Foundation

extension PullRequest {
  public enum State: String, Codable, Sendable {
    case open
    case closed
  }
}
