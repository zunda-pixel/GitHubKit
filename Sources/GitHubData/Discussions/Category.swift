//
//  Category.swift
//

import Foundation

public struct Category: Codable, Hashable, Sendable {
  public let createdAt: Date
  public let _description: String
  public let emoji: String
  public let emojiHTML: String
  public let isAnswerable: Bool
  public let name: String
  public let slug: String
  public let updateAt: Date?

  public init(
    createdAt: Date,
    _description: String,
    emoji: String,
    emojiHTML: String,
    isAnswerable: Bool,
    name: String,
    slug: String,
    updateAt: Date?
  ) {
    self.createdAt = createdAt
    self._description = _description
    self.emoji = emoji
    self.emojiHTML = emojiHTML
    self.isAnswerable = isAnswerable
    self.name = name
    self.slug = slug
    self.updateAt = updateAt
  }

  private enum CodingKeys: String, CodingKey {
    case createdAt
    case _description = "description"
    case emoji
    case emojiHTML
    case isAnswerable
    case name
    case slug
    case updateAt
  }
}
