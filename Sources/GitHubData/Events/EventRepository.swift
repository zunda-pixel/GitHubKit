//
//  EventRepository.swift
//

import Foundation

extension Event {
  public struct Repository: Codable, Sendable, Hashable, Identifiable {
    public let id: Int
    public let name: String
    public let url: URL
    
    public init(
      id: Int,
      name: String,
      url: URL
    ) {
      self.id = id
      self.name = name
      self.url = url
    }
  }
}
