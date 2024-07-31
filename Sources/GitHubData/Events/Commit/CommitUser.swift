//
//  CommitUser.swift
//

import Foundation

extension Commit {
  public struct User: Codable, Sendable, Hashable {
    public let email: String
    public let name: String

    public init(
      email: String,
      name: String
    ) {
      self.email = email
      self.name = name
    }
  }
}
