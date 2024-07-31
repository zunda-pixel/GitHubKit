//
//  TemplateLicense.swift
//

import Foundation

public struct TemplateLicense: Codable, Sendable, Hashable {
  public let key: String
  public let name: String
  public let url: URL
  public let spdxID: String
  public let nodeID: String
  public let htmlURL: URL?
  public let description: String?
  public let implementation: String?
  public let permissions: [String]?
  public let conditions: [String]?
  public let limitations: [String]?
  public let body: String?
  public let isFeatured: Bool?

  private enum CodingKeys: String, CodingKey {
    case key
    case name
    case url
    case spdxID = "spdx_id"
    case nodeID = "node_id"
    case htmlURL = "html_url"
    case description
    case implementation
    case permissions
    case conditions
    case limitations
    case body
    case isFeatured = "featured"
  }
}
