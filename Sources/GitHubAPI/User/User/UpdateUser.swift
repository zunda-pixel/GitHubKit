//
//  UpdateUser.swift
//

import Foundation

public struct UpdateUser: Encodable {
  public var name: String?
  public var email: String?
  public var blog: String?
  public var twitterUserName: String?
  public var company: String?
  public var location: String?
  public var hireable: Bool?
  public var bio: String?

  public init(
    name: String? = nil,
    email: String? = nil,
    blog: String? = nil,
    twitterUserName: String? = nil,
    company: String? = nil,
    location: String? = nil,
    hireable: Bool? = nil,
    bio: String? = nil
  ) {
    self.name = name
    self.email = email
    self.blog = blog
    self.twitterUserName = twitterUserName
    self.company = company
    self.location = location
    self.hireable = hireable
    self.bio = bio
  }

  private enum CodingKeys: String, CodingKey {
    case name
    case email
    case blog
    case twitterUserName = "twitter_username"
    case company
    case location
    case hireable
    case bio
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(self.name, forKey: .name)
    try container.encodeIfPresent(self.email, forKey: .email)
    try container.encodeIfPresent(self.blog, forKey: .blog)
    try container.encodeIfPresent(self.twitterUserName, forKey: .twitterUserName)
    try container.encodeIfPresent(self.company, forKey: .company)
    try container.encodeIfPresent(self.location, forKey: .location)
    try container.encodeIfPresent(self.hireable, forKey: .hireable)
    try container.encodeIfPresent(self.bio, forKey: .bio)
  }
}
