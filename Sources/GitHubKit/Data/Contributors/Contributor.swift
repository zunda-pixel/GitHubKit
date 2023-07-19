//
//  Contributor.swift
//

import Foundation

public struct Contributor: Codable, Sendable, Hashable {
  public let user: User
  public let contributionCount: Int
  
  public init(
    user: User,
    contributionCount: Int
  ) {
    self.user = user
    self.contributionCount = contributionCount
  }
  
  private enum CodingKeys: String, CodingKey {
    case contributionCount = "contributions"
  }
  
  public init(from decoder: Decoder) throws {
    self.user = try .init(from: decoder)
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.contributionCount = try container.decode(Int.self, forKey: .contributionCount)
  }
  
  public func encode(to encoder: Encoder) throws {
    try self.user.encode(to: encoder)
    
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(contributionCount, forKey: .contributionCount)
  }
}
