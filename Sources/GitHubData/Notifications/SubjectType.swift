//
//  SubjectType.swift
//

import Foundation

extension Subject {
  public enum SubjectType: String, Codable, Sendable {
    case issue = "Issue"
    case release = "Release"
    case pullRequest = "PullRequest"
    case discussion = "Discussion"
  }
}
