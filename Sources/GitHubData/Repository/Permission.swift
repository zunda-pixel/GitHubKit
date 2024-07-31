//
//  Permission.swift
//

import Foundation

public struct Permission: Codable, Hashable, Sendable {
  public let admin: Bool?
  public let maintain: Bool?
  public let push: Bool?
  public let triage: Bool?
  public let pull: Bool?
  public let issues: String?
  public let metadata: String?

  public init(
    admin: Bool?,
    maintain: Bool?,
    push: Bool?,
    triage: Bool?,
    pull: Bool?,
    issues: String?,
    metadata: String?
  ) {
    self.admin = admin
    self.maintain = maintain
    self.push = push
    self.triage = triage
    self.pull = pull
    self.issues = issues
    self.metadata = metadata
  }
}
