//
//  ProtectionTag.swift
//

import Foundation
import Tagged

public struct ProtectionTag: Codable, Sendable, Hashable, Identifiable {
  public typealias ID = Tagged<Self, Int>
  public let id: ID
  public let createdAt: Date?
  public let updatedAt: Date?
  public let enabled: Bool?
  public let pattern: String

  public init(
    id: ID,
    createdAt: Date?,
    updatedAt: Date?,
    enabled: Bool?,
    pattern: String
  ) {
    self.id = id
    self.createdAt = createdAt
    self.updatedAt = updatedAt
    self.enabled = enabled
    self.pattern = pattern
  }

  private enum CodingKeys: String, CodingKey {
    case id
    case createdAt = "created_at"
    case updatedAt = "updated_at"
    case enabled
    case pattern
  }
}
