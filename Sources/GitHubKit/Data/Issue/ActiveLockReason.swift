//
//  ActiveLockReason.swift
//

import Foundation

public enum ActiveLockReason: String, Codable, Sendable {
  case tooHeated = "too heated"
  case offTopic = "off-topic"
  case resolved
  case spam
}
