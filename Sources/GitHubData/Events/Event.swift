//
//  Event.swift
//

import Foundation
import Tagged

public struct Event: Codable, Sendable, Hashable, Identifiable {
  public typealias ID = Tagged<Self, String>
  public let id: ID
  public let type: EventType
  public let actor: Event.User
  public let repository: Event.Repository
  public let organization: Event.User?
  public let payload: Event.Payload
  public let page: Event.Page?
  public let isPublic: Bool
  public let createdAt: Date
  public let format: String?

  private enum CodingKeys: String, CodingKey {
    case id
    case type
    case actor
    case repository = "repo"
    case organization = "org"
    case payload
    case page
    case isPublic = "public"
    case createdAt = "created_at"
    case format
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.id = try container.decode(ID.self, forKey: .id)
    self.type = try container.decode(EventType.self, forKey: .type)
    self.actor = try container.decode(Event.User.self, forKey: .actor)
    self.repository = try container.decode(Event.Repository.self, forKey: .repository)
    self.organization = try container.decodeIfPresent(Event.User.self, forKey: .organization)
    let payloadContainer = try container.nestedContainer(
      keyedBy: Payload.CodingKeys.self, forKey: .payload)
    self.payload = try Payload(container: payloadContainer, type: type)
    self.page = try container.decodeIfPresent(Event.Page.self, forKey: .page)
    self.isPublic = try container.decode(Bool.self, forKey: .isPublic)
    self.createdAt = try container.decode(Date.self, forKey: .createdAt)
    self.format = try container.decodeIfPresent(String.self, forKey: .format)
  }

  public init(
    id: ID,
    type: EventType,
    actor: Event.User,
    repository: Event.Repository,
    organization: Event.User?,
    payload: Event.Payload,
    page: Event.Page?,
    isPublic: Bool,
    createdAt: Date,
    format: String?
  ) {
    self.id = id
    self.type = type
    self.actor = actor
    self.repository = repository
    self.organization = organization
    self.payload = payload
    self.page = page
    self.isPublic = isPublic
    self.createdAt = createdAt
    self.format = format
  }
}
