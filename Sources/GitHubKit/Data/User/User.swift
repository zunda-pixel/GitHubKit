//
//  User.swift
//

import Foundation

public struct User: Codable {
  public let id: Int
  public let userID: String?
  public let userName: String
  public let nodeID: String
  public let avatarURL: URL
  public let gravatarID: String
  public let url: URL
  public let htmlURL: URL
  public let followersURL: URL
  public let followingURL: URL
  public let subscriptionsURL: URL
  public let organizationsURL: URL
  public let reposURL: URL
  public let eventsURL: URL
  public let receivedEventsURL: URL
  public let gistsURL: URL
  public let starredURL: URL
  public let publicRepoCount: Int?
  public let publicGistsCount: Int?
  public let followerCount: Int?
  public let followingCount: Int?
  public let createdAt: Date?
  public let updatedAt: Date?
  public let bio: String?
  public let email: String?
  public let location: String?
  public let hireable: Bool?
  public let type: UserType
  public let score: Int
  public let siteAdmin: Bool
  
  public init(
    id: Int,
    userID: String?,
    userName: String,
    nodeID: String,
    avatarURL: URL,
    gravatarID: String,
    url: URL,
    htmlURL: URL,
    followersURL: URL,
    followingURL: URL,
    subscriptionsURL: URL,
    organizationsURL: URL,
    reposURL: URL,
    eventsURL: URL,
    receivedEventsURL: URL,
    gistsURL: URL,
    starredURL: URL,
    publicRepoCount: Int?,
    publicGistsCount: Int?,
    followerCount: Int?,
    followingCount: Int?,
    createdAt: Date?,
    updatedAt: Date?,
    bio: String?,
    email: String?,
    location: String?,
    hireable: Bool?,
    type: UserType,
    score: Int,
    siteAdmin: Bool
  ) {
    self.id = id
    self.userID = userID
    self.userName = userName
    self.nodeID = nodeID
    self.avatarURL = avatarURL
    self.gravatarID = gravatarID
    self.url = url
    self.htmlURL = htmlURL
    self.followersURL = followersURL
    self.followingURL = followingURL
    self.subscriptionsURL = subscriptionsURL
    self.organizationsURL = organizationsURL
    self.reposURL = reposURL
    self.eventsURL = eventsURL
    self.receivedEventsURL = receivedEventsURL
    self.gistsURL = gistsURL
    self.starredURL = starredURL
    self.publicRepoCount = publicRepoCount
    self.publicGistsCount = publicGistsCount
    self.followerCount = followerCount
    self.followingCount = followingCount
    self.createdAt = createdAt
    self.updatedAt = updatedAt
    self.bio = bio
    self.email = email
    self.location = location
    self.hireable = hireable
    self.type = type
    self.score = score
    self.siteAdmin = siteAdmin
  }
  
  private enum CodingKeys: String, CodingKey {
    case id
    case userID = "name"
    case userName = "login"
    case nodeID = "node_id"
    case avatarURL = "avatar_url"
    case gravatarID = "gravatar_id"
    case url
    case htmlURL = "html_url"
    case followersURL = "followers_url"
    case followingURL = "following_url"
    case gistsURL = "gists_url"
    case starredURL = "starred_url"
    case subscriptionsURL = "subscriptions_url"
    case organizationsURL = "organizations_url"
    case reposURL = "repos_url"
    case eventsURL = "events_url"
    case receivedEventsURL = "received_events_url"
    case type
    case siteAdmin = "site_admin"
    case score
    case publicRepoCount = "public_repos"
    case publicGistsCount = "public_gists"
    case followerCount = "followers"
    case followingCount = "following"
    case createdAt = "created_at"
    case updatedAt = "updated_at"
    case bio
    case email
    case location
    case hireable
  }
}

public enum UserType: String, Codable {
  case user = "User"
  case organization = "Organization"
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    let rawValue = try container.decode(String.self)
    self.init(rawValue: rawValue)!
  }
  
  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(rawValue)
  }
}
