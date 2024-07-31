//
//  AutoMerge.swift
//

import Foundation

public struct AutoMerge: Codable, Hashable, Sendable {
  public let enabledBy: User
  public let method: Method
  public let commitTitle: String?
  public let commitMessage: String?

  public init(
    enabledBy: User,
    method: Method,
    commitTitle: String?,
    commitMessage: String?
  ) {
    self.enabledBy = enabledBy
    self.method = method
    self.commitTitle = commitTitle
    self.commitMessage = commitMessage
  }

  private enum CodingKeys: String, CodingKey {
    case enabledBy = "enabled_by"
    case method = "merge_method"
    case commitTitle = "commit_title"
    case commitMessage = "commit_message"
  }
}
