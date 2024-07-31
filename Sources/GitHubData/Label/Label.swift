//
//  Label.swift
//

import Foundation
import Tagged

public struct Label: Codable, Hashable, Sendable, Identifiable {
  public typealias ID = Tagged<Self, Int>
  public let id: ID
  public let nodeID: String
  public let url: URL
  public let name: String
  public let color: String
  public let isDefault: Bool
  public let _description: String?

  public init(
    id: ID,
    nodeID: String,
    url: URL,
    name: String,
    color: String,
    isDefault: Bool,
    _description: String?
  ) {
    self.id = id
    self.nodeID = nodeID
    self.url = url
    self.name = name
    self.color = color
    self.isDefault = isDefault
    self._description = _description
  }

  private enum CodingKeys: String, CodingKey {
    case id
    case nodeID = "node_id"
    case url
    case name
    case color
    case isDefault = "default"
    case _description = "description"
  }
}
