//
//  PerformGitHubApp.swift
//

import Foundation
import Tagged

public struct PerformGitHubApp: Codable, Sendable, Hashable, Identifiable {
  public typealias ID = Tagged<Self, Int>
  public let id: ID
  public let slug: String?
  public let nodeID: String
  public let owner: User
  public let name: String
  public let _description: String
  public let externalURL: URL
  public let htmlURL: URL
  public let createdAt: Date
  public let updatedAt: Date
  public let permissions: Permission
  public let installationsCount: Int?
  public let clientID: String?
  public let clientSecret: String?
  public let webhookSecret: String?
  public let pem: String?

  public init(
    id: ID,
    slug: String?,
    nodeID: String,
    owner: User,
    name: String,
    _description: String,
    externalURL: URL,
    htmlURL: URL,
    createdAt: Date,
    updatedAt: Date,
    permissions: Permission,
    installationsCount: Int?,
    clientID: String?,
    clientSecret: String?,
    webhookSecret: String?,
    pem: String?
  ) {
    self.id = id
    self.slug = slug
    self.nodeID = nodeID
    self.owner = owner
    self.name = name
    self._description = _description
    self.externalURL = externalURL
    self.htmlURL = htmlURL
    self.createdAt = createdAt
    self.updatedAt = updatedAt
    self.permissions = permissions
    self.installationsCount = installationsCount
    self.clientID = clientID
    self.clientSecret = clientSecret
    self.webhookSecret = webhookSecret
    self.pem = pem
  }

  private enum CodingKeys: String, CodingKey {
    case id
    case slug
    case nodeID = "node_id"
    case owner
    case name
    case _description = "description"
    case externalURL = "external_url"
    case htmlURL = "html_url"
    case createdAt = "created_at"
    case updatedAt = "updated_at"
    case permissions
    case installationsCount = "installations_count"
    case clientID = "client_id"
    case clientSecret = "client_secret"
    case webhookSecret = "webhook_secret"
    case pem
  }
}
