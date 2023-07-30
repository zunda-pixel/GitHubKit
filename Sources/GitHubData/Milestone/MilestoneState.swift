//
//  MilestoneState.swift
//

import Foundation

extension Milestone {
  public enum State: String, Codable, Sendable {
    case open
    case closed
  }
}
