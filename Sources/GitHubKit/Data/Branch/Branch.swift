//
//  Branch.swift
//

import Foundation

public struct Branch: Codable, Sendable, Hashable {
  public let label: String?
  public let ref: String
  public let sha: String
  public let user: User?
  public let repo: Repository?
  
  public init(
    label: String?,
    ref: String,
    sha: String,
    user: User?,
    repo: Repository?
  ) {
    self.label = label
    self.ref = ref
    self.sha = sha
    self.user = user
    self.repo = repo
  }
}
