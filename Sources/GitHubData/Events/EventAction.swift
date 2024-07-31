//
//  EventAction.swift
//

import Foundation

public enum MemeberAction: String, Codable, Sendable {
  case added
}

public enum ReleaseAction: String, Codable, Sendable {
  case published
}

public enum CommentAction: String, Codable, Sendable {
  case created
}

public enum RepositoryAction: String, Codable, Sendable {
  case closed
  case opened
  case reopened
}

public enum WatchAction: String, Codable, Sendable {
  case started
}
