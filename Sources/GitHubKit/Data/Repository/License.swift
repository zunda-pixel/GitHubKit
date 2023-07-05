//
//  License.swift
//

import Foundation

public struct License: Codable {
  public let key: String
  public let name: String
  public let spdxID: String
  public let url: URL?
  public let nodeID: String
  
  private enum CodingKeys: String, CodingKey {
    case key
    case name
    case spdxID = "spdx_id"
    case url
    case nodeID = "node_id"
  }
}
