//
//  IssueState.swift
//

import Foundation

extension Issue {
  public enum State: String, Codable, Sendable {
    case open
    case closed
    
    public init(from decoder: Decoder) throws {
      let container = try decoder.singleValueContainer()
      let rawValue = try container.decode(String.self)
      self.init(rawValue: rawValue)!
    }
    
    public func encode(to encoder: Encoder) throws {
      var container = encoder.singleValueContainer()
      try container.encode(rawValue)
    }
  }
}
