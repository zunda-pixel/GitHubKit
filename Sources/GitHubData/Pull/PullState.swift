//
//  PullState.swift
//

import Foundation

extension Pull {
  public enum State: String, Codable, Sendable {
    case open
    case closed
  }
}
