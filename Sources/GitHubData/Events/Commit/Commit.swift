//
//  Commit.swift
//

import Foundation

public struct Commit: Codable, Sendable, Hashable {
  public let sha: String
  public let author: Commit.User
  public let message: String
  public let distinct: Bool
  public let url: URL

  public init(
    sha: String,
    author: Commit.User,
    message: String,
    distinct: Bool,
    url: URL
  ) {
    self.sha = sha
    self.author = author
    self.message = message
    self.distinct = distinct
    self.url = url
  }
}
