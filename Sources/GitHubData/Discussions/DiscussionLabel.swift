//
//  DiscussionLabel.swift
//

import Foundation

extension Discussion {
  public struct Label: Codable, Sendable, Hashable {
    public let name: String
    public let color: String
    public let createdAt: Date
    public let _description: String
    public let isDefault: Bool
    public let resourcePath: String
    public let updatedAt: Date
    public let url: URL

    public init(
      name: String,
      color: String,
      createdAt: Date,
      _description: String,
      isDefault: Bool,
      resourcePath: String,
      updatedAt: Date,
      url: URL
    ) {
      self.name = name
      self.color = color
      self.createdAt = createdAt
      self._description = _description
      self.isDefault = isDefault
      self.resourcePath = resourcePath
      self.updatedAt = updatedAt
      self.url = url
    }

    private enum CodingKeys: String, CodingKey {
      case name
      case color
      case createdAt
      case _description = "description"
      case isDefault
      case resourcePath
      case updatedAt
      case url
    }
  }
}
