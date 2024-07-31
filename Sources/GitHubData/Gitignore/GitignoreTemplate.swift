//
//  GitignoreTemplate.swift
//

import Foundation

public struct GitignoreTemplate: Codable, Sendable, Hashable {
  public let name: String
  public let source: String

  public init(
    name: String,
    source: String
  ) {
    self.name = name
    self.source = source
  }
}
