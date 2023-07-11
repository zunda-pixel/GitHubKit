//
//  ActiveLockReason.swift
//

import Foundation

public enum ActiveLockReason: String, Codable, Sendable {
  case tooHeated = "too heated"
  
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
