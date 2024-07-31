//
//  EventRepository.swift
//

import Foundation
import Tagged

extension Event {
  public struct Repository: Codable, Sendable, Hashable, Identifiable {
    public typealias ID = Tagged<Self, Int>
    public let id: ID
    public let name: String
    public let url: URL

    public init(
      id: ID,
      name: String,
      url: URL
    ) {
      self.id = id
      self.name = name
      self.url = url
    }
  }
}
