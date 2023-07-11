//
//  Label.swift
//

import Foundation

public struct Label: Codable, Hashable, Sendable, Identifiable {
  public let id: Int
  public let nodeID: String
  public let url: URL
  public let name: String
  public let color: String
  public let isDefault: Bool
  public let description: String?
  
  private enum CodingKeys: String, CodingKey {
    case id
    case nodeID = "node_id"
    case url
    case name
    case color
    case isDefault = "default"
    case description
  }
}
