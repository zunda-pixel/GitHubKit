//
//  ParentTeam.swift
//

import Foundation
import Tagged

public struct ParentTeam: Hashable, Sendable, Identifiable, Codable {
  public typealias ID = Tagged<Self, Int>
  public let id: ID
  public let nodeID: String
  public let membersURL: URL
  public let name: String
  public let _description: String?
  public let permission: PermissionType
  public let privacy: Privacy
  public let notificationSetting: NotificationSettings
  public let htmlURL: URL
  public let repositoriesURL: URL
  public let slug: String
  public let ldapDn: String?

  public init(
    id: ID,
    nodeID: String,
    membersURL: URL,
    name: String,
    _description: String?,
    permission: PermissionType,
    privacy: Privacy,
    notificationSetting: NotificationSettings,
    htmlURL: URL,
    repositoriesURL: URL,
    slug: String,
    ldapDn: String?
  ) {
    self.id = id
    self.nodeID = nodeID
    self.membersURL = membersURL
    self.name = name
    self._description = _description
    self.permission = permission
    self.privacy = privacy
    self.notificationSetting = notificationSetting
    self.htmlURL = htmlURL
    self.repositoriesURL = repositoriesURL
    self.slug = slug
    self.ldapDn = ldapDn
  }

  enum CodingKeys: String, CodingKey {
    case id
    case nodeID = "node_id"
    case membersURL = "members_url"
    case name
    case _description = "description"
    case permission
    case privacy
    case notificationSetting = "notification_setting"
    case htmlURL = "html_url"
    case repositoriesURL = "repositories_url"
    case slug
    case ldapDn = "ldap_dn"
  }
}
