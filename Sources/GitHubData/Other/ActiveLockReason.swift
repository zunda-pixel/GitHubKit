//
//  ActiveLockReason.swift
//

import Foundation

public enum ActiveLockReason: String, Codable, Sendable {
  case tooHeated = "too heated"
  case offTopic = "off-topic"
  case resolved
  case spam

  public init(from decoder: any Decoder) throws {
    let container = try decoder.singleValueContainer()
    let rawValue = try container.decode(String.self)
    self.init(rawValue: rawValue.lowercased())!
  }
}
