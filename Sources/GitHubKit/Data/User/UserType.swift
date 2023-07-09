//
//  UserType.swift
//

import Foundation

public enum UserType: String, Codable, Sendable {
  case user = "User"
  case organization = "Organization"
  
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
