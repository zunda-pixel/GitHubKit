//
//  EventUser.swift
//

import Foundation

extension Event {
  public struct User: Codable, Sendable, Hashable, Identifiable {
    public let id: Int
    public let userID: String
    public let userName: String?
    public let gravatarID: String
    public let url: URL
    public let avatarURL: String
    
    private enum CodingKeys: String, CodingKey {
      case id
      case userID = "login"
      case userName = "display_login"
      case gravatarID = "gravatar_id"
      case url
      case avatarURL = "avatar_url"
    }
    
    public init(
      id: Int,
      userID: String,
      userName: String?,
      gravatarID: String,
      url: URL,
      avatarURL: String
    ) {
      self.id = id
      self.userID = userID
      self.userName = userName
      self.gravatarID = gravatarID
      self.url = url
      self.avatarURL = avatarURL
    }
  }
}
