//
//  Contributor.swift
//

import Foundation

public struct Contributor: Codable, Sendable, Hashable {
  public let user: User
  public let role: Role
  
  public init(
    user: User,
    role: Role
  ) {
    self.user = user
    self.role = role
  }
  
  private enum CodingKeys: String, CodingKey {
    case role = "role_name"
  }
  
  public init(from decoder: Decoder) throws {
    self.user = try .init(from: decoder)
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.role = try container.decode(Role.self, forKey: .role)
  }
  
  public func encode(to encoder: Encoder) throws {
    try self.user.encode(to: encoder)
    
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(role, forKey: .role)
  }
}
